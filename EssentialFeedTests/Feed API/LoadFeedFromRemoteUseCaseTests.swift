//
//  LoadFeedFromRemoteUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 10/6/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class LoadFeedFromRemoteUseCaseTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        // given
        let (_, client) = makeSUT()
        
        // then
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_shouldRequestsDataFromURL() {
        // given
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        // when
        sut.load { _ in }
        
        // then
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_shouldRequestsDataFromURLTwice() {
        // given
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        // when
        sut.load { _ in }
        sut.load { _ in }
        
        // then
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        // given
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithResult: failure(.connectivity), when: {
            let clientError = NSError(domain: "error", code: 1, userInfo: nil)
            client.complete(with: clientError)
        })
    }
    
    func test_load_deliversErrorOnNon200HTTPResponse() {
        // given
        let (sut, client) = makeSUT()
        var capturedErrors: [RemoteFeedLoader.Error] = []
        
        let codes = [199, 201, 300, 400, 500]
        for (index, code) in codes.enumerated() {
            expect(sut, toCompleteWithResult: failure(.invalidData), when: {
                let json = makeItemsJSON([])
                client.complete(withStatusCode: code, data: json, at: index)
                capturedErrors.removeAll()
            })
        }
    }
    
    func test_load_deliversErrorOn200HTTPResponseWithInvalidJSONData() {
        // given
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithResult: failure(.invalidData), when: {
            let invalidJSON = Data("invalid-json".utf8)
            client.complete(withStatusCode: 200, data: invalidJSON)
        })
    }
    
    func test_load_deliversItemsOn200HTTPResponseWithEmptyJSONList() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithResult: .success([]), when: {
            let emptyJSONList = makeItemsJSON([])
            client.complete(withStatusCode: 200, data: emptyJSONList)
        })
    }
    
    func test_load_deliversItemsOn200HTTPResponseWithJSONList() {
        let (sut, client) = makeSUT()
        
        let item1 = makeItem(
            id: UUID(),
            imageURL: URL(string: "https://a-url.com")!
        )
        let item2 = makeItem(
            id: UUID(),
            description: "a description",
            location: "a location",
            imageURL: URL(string: "https://a-url.com")!
        )
        let items = [item1.model, item2.model]
        expect(sut, toCompleteWithResult: .success(items), when: {
            let jsonList = makeItemsJSON([item1.json, item2.json])
            client.complete(withStatusCode: 200, data: jsonList)
        })
    }
    
    func test_load_doesNotDeliverResultsAfterSUTInstanceHasBeenDeallocated() {
        // given
        let url = URL(string: "https://any-url.com")!
        let client = HTTPClientSpy()
        var sut: RemoteFeedLoader? = RemoteFeedLoader(url: url, client: client)
        
        // when
        var capturedResults: [RemoteFeedLoader.Result] = []
        sut?.load { result in
            capturedResults.append(result)
        }
        sut = nil
        client.complete(withStatusCode: 200, data: makeItemsJSON([]))
        
        // then
        XCTAssertTrue(capturedResults.isEmpty)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(
        url: URL = URL(string: "https://a-url.com")!,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (RemoteFeedLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        trackForMemoryLeaks(for: sut, file: file, line: line)
        trackForMemoryLeaks(for: client, file: file, line: line)
        return (sut, client)
    }
    
    private func failure(_ error: RemoteFeedLoader.Error) -> RemoteFeedLoader.Result {
        return .failure(error)
    }
    
    private func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageURL: URL) -> (model: FeedImage, json: [String: Any]) {
        let item = FeedImage(
            id: id,
            description: description,
            location: location,
            url: imageURL
        )
        let json = [
            "id": id.uuidString,
            "description": description,
            "location": location,
            "image": imageURL.absoluteString
        ]
        .compactMapValues { $0 }
        
        return (item, json)
    }
    
    private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
        let itemsJSON = [
            "items": items
        ]
        return try! JSONSerialization.data(withJSONObject: itemsJSON)
    }
    
    func expect(
        _ sut: RemoteFeedLoader,
        toCompleteWithResult expectedResult: FeedLoader.Result,
        when action: (() -> Void),
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let exp = self.expectation(description: "wait for load completion")
        
        sut.load { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (RemoteFeedLoader.Result.success(receivedItems), RemoteFeedLoader.Result.success(expectedItems)):
                XCTAssertEqual(receivedItems, expectedItems, file: file, line: line)
                
            case let (RemoteFeedLoader.Result.failure(receivedError as RemoteFeedLoader.Error), RemoteFeedLoader.Result.failure(expectedError as RemoteFeedLoader.Error)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)
                
            default:
                XCTFail("Expected result \(expectedResult), but got \(receivedResult) instead.", file: file, line: line)
            }
            exp.fulfill()
            
        }
        action()

        wait(for: [exp], timeout: 2.0)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var messages: [(url: URL, completion: (HTTPClientResult) -> Void)] = []
        var requestedURLs: [URL] {
            return messages.map { $0.url }
        }
        
        func get(
            from url: URL,
            completion: @escaping (HTTPClientResult) -> Void
        ) {
            messages.append((url, completion))
        }
        
        func complete(with error: Error, at index: Int = 0) {
            messages[index].completion(.failure(error))
        }
        
        func complete(withStatusCode code: Int, data: Data, at index: Int = 0) {
            let response = HTTPURLResponse(
                url: requestedURLs[index],
                statusCode: code,
                httpVersion: nil,
                headerFields: nil
            )!
            messages[index].completion(.success(data, response))
        }
        
    }
    
}


