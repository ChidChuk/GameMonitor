//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/24/23.
//
//

import Foundation
import CoreData


extension Monday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Monday> {
        return NSFetchRequest<Monday>(entityName: "Monday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32

}

extension Monday : Identifiable {

}
