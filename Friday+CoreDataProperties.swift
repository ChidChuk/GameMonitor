//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/24/23.
//
//

import Foundation
import CoreData


extension Friday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friday> {
        return NSFetchRequest<Friday>(entityName: "Friday")
    }

    @NSManaged public var playstation: Int32
    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32

}

extension Friday : Identifiable {

}
