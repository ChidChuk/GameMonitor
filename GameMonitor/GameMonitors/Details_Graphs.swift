//
//  Details+Graphs.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/13/23.
//

import SwiftUI

struct Details_Graphs: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var deviceUsage: [(String, Int32)]
    var device: String
    
    var body: some View {
        ZStack{
            GameMonitorDetail(deviceName: device)
            
            VStack {
                GameMonitorPullUp(deviceUsage: deviceUsage, device: device)
                    .offset(y:50)
            }
        }
        .ignoresSafeArea(edges:.top)
    }
}

//struct Details_Graphs_Previews: PreviewProvider {
//    static var previews: some View {
//        Details_Graphs()
//            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
//    }
//}
