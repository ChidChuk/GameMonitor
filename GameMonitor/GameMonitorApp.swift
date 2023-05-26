//
//  GameMonitorApp.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/1/23.
//  Github username: ChidChuk

import SwiftUI
import CoreData

@main
struct GameMonitorApp: App {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some Scene {
        let persistenceController = PersistenceController.shared
        let context = persistenceController.container.viewContext
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
