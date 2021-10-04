//
//  ManagedFeedImage.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 23/03/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import CoreData

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var imageDescription: String?
    @NSManaged var location: String?
    @NSManaged var url: URL
	@NSManaged var data: Data?
    @NSManaged var cache: ManagedCache
}
 
extension ManagedFeedImage {

	static func first(with url: URL, in context: NSManagedObjectContext) throws -> ManagedFeedImage? {
		let request = NSFetchRequest<ManagedFeedImage>(entityName: entity().name!)
		request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(ManagedFeedImage.url), url])
		request.returnsObjectsAsFaults = false
		request.fetchLimit = 1
		return try context.fetch(request).first
	}
    
    internal static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: localFeed.map { local in
            let managed = ManagedFeedImage(context: context)
            managed.id = local.id
            managed.imageDescription = local.description
            managed.location = local.location
            managed.url = local.url
            return managed
        })
    }
    
    internal var local: LocalFeedImage {
        return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
    }
}

