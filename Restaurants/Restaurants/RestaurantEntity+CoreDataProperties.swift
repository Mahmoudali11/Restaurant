//
//  RestaurantEntity+CoreDataProperties.swift
//  Restaurants
//
//  Created by Admin on 2/9/19.
//  Copyright © 2019 Mahmoudali. All rights reserved.
//

import Foundation
import CoreData


extension RestaurantEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RestaurantEntity> {
        return NSFetchRequest<RestaurantEntity>(entityName: "RestaurantEntity");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var isVisited: Bool
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var rating: String?
    @NSManaged public var type: String?

}
