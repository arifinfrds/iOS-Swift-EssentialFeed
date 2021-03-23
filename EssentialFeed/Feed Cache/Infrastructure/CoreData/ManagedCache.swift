//
//  ManagedCache.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 23/03/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import CoreData

@objc(ManagedCache)
internal class ManagedCache: NSManagedObject {
    @NSManaged var timestamp: Date
    @NSManaged var feed: NSOrderedSet
    
    var localFeed: [LocalFeedImage] {
        return feed
            .compactMap { $0 as? ManagedFeedImage }
            .map { $0.local }
    }
    
    static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
        let request = NSFetchRequest<ManagedCache>(entityName: ManagedCache.entity().name!)
        request.returnsObjectsAsFaults = false
        return try context.fetch(request).first
    }
    
    static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedCache {
        try find(in: context).map(context.delete)
        return ManagedCache(context: context)
    }
}
