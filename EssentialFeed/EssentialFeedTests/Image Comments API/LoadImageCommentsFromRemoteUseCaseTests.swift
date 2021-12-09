//
//  LoadImageCommentsFromRemoteUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 07/12/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class LoadImageCommentsFromRemoteUseCaseTests: XCTestCase {
    
    func test_load_deliversErrorOnNon2xxHTTPResponse() {
        let (sut, client) = makeSUT()
        var capturedErrors: [RemoteImageCommentsLoader.Error] = []
        
        let samples = [199, 150, 300, 400, 500]
        
        for (index, code) in samples.enumerated() {
            expect(sut, toCompleteWithResult: failure(.invalidData), when: {
                let json = makeItemsJSON([])
                client.complete(withStatusCode: code, data: json, at: index)
                capturedErrors.removeAll()
            })
        }
    }
    
    func test_load_deliversErrorOn2xxHTTPResponseWithInvalidJSONData() {
        let (sut, client) = makeSUT()
        
        let samples = [200, 201, 250, 280, 299]
        
        samples.enumerated().forEach { (index, code) in
            expect(sut, toCompleteWithResult: failure(.invalidData), when: {
                let invalidJSON = Data("invalid-json".utf8)
                client.complete(withStatusCode: code, data: invalidJSON, at: index)
            })
        }
    }
    
    func test_load_deliversItemsOn2xxHTTPResponseWithEmptyJSONList() {
        let (sut, client) = makeSUT()
        
        let samples = [200, 201, 250, 280, 299]
        
        samples.enumerated().forEach { (index, code) in
            expect(sut, toCompleteWithResult: .success([]), when: {
                let emptyJSONList = makeItemsJSON([])
                client.complete(withStatusCode: code, data: emptyJSONList, at: index)
            })
        }
    }
    
    func test_load_deliversItemsOn2xxHTTPResponseWithJSONList() {
        let (sut, client) = makeSUT()
        
        let item1 = makeItem(
            id: UUID(),
            message: "a message",
            createdAt: (Date(timeIntervalSince1970: 1598627222), "2020-08-28T15:07:02+00:00"),
            username: "a username")
        let item2 = makeItem(
            id: UUID(),
            message: "another message",
            createdAt: (Date(timeIntervalSince1970: 1577881882), "2020-01-01T12:31:22+00:00"),
            username: "another username")
        let items = [item1.model, item2.model]
        
        let samples = [200, 201, 250, 280, 299]
        
        samples.enumerated().forEach { (index, code) in
            expect(sut, toCompleteWithResult: .success(items), when: {
                let jsonList = makeItemsJSON([item1.json, item2.json])
                client.complete(withStatusCode: code, data: jsonList, at: index)
            })
        }
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        url: URL = URL(string: "https://a-url.com")!,
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (RemoteImageCommentsLoader, HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteImageCommentsLoader(url: url, client: client)
        trackForMemoryLeaks(for: sut, file: file, line: line)
        trackForMemoryLeaks(for: client, file: file, line: line)
        return (sut, client)
    }
    
    private func failure(_ error: RemoteImageCommentsLoader.Error) -> RemoteImageCommentsLoader.Result {
        return .failure(error)
    }
    
    private func makeItem(
        id: UUID,
        message: String,
        createdAt: (date: Date, iso8601String: String),
        username: String
    ) -> (model: ImageComment, json: [String: Any]) {
        let item = ImageComment(id: id, message: message, createdAt: createdAt.date, username: username)
        
        let json: [String: Any] = [
            "id": id.uuidString,
            "message": message,
            "created_at": createdAt.iso8601String,
            "author": [
                "username": username
            ]
        ]
        
        return (item, json)
    }
    
    private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
        let itemsJSON = [
            "items": items
        ]
        return try! JSONSerialization.data(withJSONObject: itemsJSON)
    }
    
    func expect(
        _ sut: RemoteImageCommentsLoader,
        toCompleteWithResult expectedResult: RemoteImageCommentsLoader.Result,
        when action: (() -> Void),
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let exp = self.expectation(description: "wait for load completion")
        
        sut.load { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (RemoteImageCommentsLoader.Result.success(receivedItems), RemoteImageCommentsLoader.Result.success(expectedItems)):
                XCTAssertEqual(receivedItems, expectedItems, file: file, line: line)
                
            case let (RemoteImageCommentsLoader.Result.failure(receivedError as RemoteImageCommentsLoader.Error), RemoteImageCommentsLoader.Result.failure(expectedError as RemoteImageCommentsLoader.Error)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)
                
            default:
                XCTFail("Expected result \(expectedResult), but got \(receivedResult) instead.", file: file, line: line)
            }
            exp.fulfill()
            
        }
        action()
        
        wait(for: [exp], timeout: 2.0)
    }
    
}
