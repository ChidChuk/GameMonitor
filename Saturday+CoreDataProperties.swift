//
//  Monday+CoreDataProperties.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/26/23.
//
//

import Foundation
import CoreData


extension Saturday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saturday> {
        return NSFetchRequest<Saturday>(entityName: "Saturday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var playstation: Int32
    @NSManaged public var xbox: Int32

}

extension Saturday : Identifiable {

}
