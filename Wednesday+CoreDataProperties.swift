//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/26/23.
//
//

import Foundation
import CoreData


extension Wednesday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wednesday> {
        return NSFetchRequest<Wednesday>(entityName: "Wednesday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var playstation: Int32
    @NSManaged public var xbox: Int32

}

extension Wednesday : Identifiable {

}
