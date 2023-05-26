//
//  ContentView.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/1/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @AppStorage("install_date") var installDate = Date().rawValue
    @AppStorage("first_open") var firstOpen = true

    var body: some View {
        GameMonitorList()
            .environment(\.managedObjectContext, managedObjectContext)
            .onAppear {
                if firstOpen {
                    firstOpen = false
                    // initalize the week days
                    createFirstWeek()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
