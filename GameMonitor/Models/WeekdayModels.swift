//
//  WeekdayModels.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/24/23.
//
//

import Foundation
import CoreData

@objc(Sunday)
public class Sunday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sunday> {
        return NSFetchRequest<Sunday>(entityName: "Sunday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Monday)
public class Monday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Monday> {
        return NSFetchRequest<Monday>(entityName: "Monday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Tuesday)
public class Tuesday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tuesday> {
        return NSFetchRequest<Tuesday>(entityName: "Tuesday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Wednesday)
public class Wednesday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wednesday> {
        return NSFetchRequest<Wednesday>(entityName: "Wednesday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Thursday)
public class Thursday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thursday> {
        return NSFetchRequest<Thursday>(entityName: "Thursday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Friday)
public class Friday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friday> {
        return NSFetchRequest<Friday>(entityName: "Friday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}

@objc(Saturday)
public class Saturday: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Saturday> {
        return NSFetchRequest<Saturday>(entityName: "Saturday")
    }

    @NSManaged public var nintendo: Int32
    @NSManaged public var xbox: Int32
    @NSManaged public var playstation: Int32
}
