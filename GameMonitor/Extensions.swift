//
//  Extensions.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 4/20/23.
//

import Foundation

extension Date: RawRepresentable {
    public var rawValue: String {
        self.timeIntervalSinceReferenceDate.description
    }
    
    public init?(rawValue: String) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue) ?? 0.0)
    }
}

extension ContentView {
    private func addNewMonday() {
        let day = Monday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewTuesday() {
        let day = Tuesday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewWednesday() {
        let day = Wednesday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewThursday() {
        let day = Thursday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewFriday() {
        let day = Friday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewSaturday() {
        let day = Saturday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func addNewSunday() {
        let day = Sunday(context: managedObjectContext)
        day.nintendo = Int32(0)
        day.playstation = Int32(0)
        day.xbox = Int32(0)
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Data saved!")
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func createFirstWeek() {
        addNewMonday()
        addNewTuesday()
        addNewWednesday()
        addNewThursday()
        addNewFriday()
        addNewSaturday()
        addNewSunday()
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error: Failed to save new context, \(error.localizedDescription)")
        }
    }
}
