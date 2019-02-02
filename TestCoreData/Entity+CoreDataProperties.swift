//
//  Entity+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Kang JK on 23/01/2019.
//  Copyright © 2019 Kang JK. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?

}
