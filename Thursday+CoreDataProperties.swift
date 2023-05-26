//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/26/23.
//
//

import Foundation
import CoreData


extension Thursday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thursday> {
        return NSFetchRequest<Thursday>(entityName: "Thursday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var playstation: Int32
    @NSManaged public var xbox: Int32

}

extension Thursday : Identifiable {

}
