//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/26/23.
//
//

import Foundation
import CoreData


extension Sunday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sunday> {
        return NSFetchRequest<Sunday>(entityName: "Sunday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var playstation: Int32
    @NSManaged public var xbox: Int32
    
}

extension Sunday : Identifiable {

}
