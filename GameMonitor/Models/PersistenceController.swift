//
//  PersistenceController.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/3/23.
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-configure-core-data-to-work-with-swiftui

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let sun = Sunday(context: viewContext)
        sun.nintendo = Int32(0)
        sun.playstation = Int32(0)
        sun.xbox = Int32(0)
        
        let mon = Monday(context: viewContext)
        mon.nintendo = Int32(0)
        mon.playstation = Int32(0)
        mon.xbox = Int32(0)
        
        let tues = Tuesday(context: viewContext)
        tues.nintendo = Int32(0)
        tues.playstation = Int32(0)
        tues.xbox = Int32(0)
        
        let wed = Wednesday(context: viewContext)
        wed.nintendo = Int32(0)
        wed.playstation = Int32(0)
        wed.xbox = Int32(0)
        
        let thurs = Thursday(context: viewContext)
        thurs.nintendo = Int32(0)
        thurs.playstation = Int32(0)
        thurs.xbox = Int32(0)
        
        let fri = Friday(context: viewContext)
        fri.nintendo = Int32(0)
        fri.playstation = Int32(0)
        fri.xbox = Int32(0)
        
        let sat = Saturday(context: viewContext)
        sat.nintendo = Int32(0)
        sat.playstation = Int32(0)
        sat.xbox = Int32(0)
        
        do {
            try viewContext.save()
            
        } catch {
           // Replace this implementation with code to handle the error appropriately.
           // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            
        }
        return result
        
    }()
    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "CDMain")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }

    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
