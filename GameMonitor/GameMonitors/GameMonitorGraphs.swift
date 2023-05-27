//
//  GameMonitorGraphs.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/2/23.
//
// SwiftUICharts package from https://github.com/AppPear/ChartView

import SwiftUICharts
import SwiftUI
import CoreData

struct GameMonitorGraphs: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(entity: Monday.entity(), sortDescriptors: []) public var mondays: FetchedResults<Monday>
    @FetchRequest(entity: Tuesday.entity(), sortDescriptors: []) public var tuesdays: FetchedResults<Tuesday>
    @FetchRequest(entity: Wednesday.entity(), sortDescriptors: []) public var wednesdays: FetchedResults<Wednesday>
    @FetchRequest(entity: Thursday.entity(), sortDescriptors: []) public var thursdays: FetchedResults<Thursday>
    @FetchRequest(entity: Friday.entity(), sortDescriptors: []) public var fridays: FetchedResults<Friday>
    @FetchRequest(entity: Saturday.entity(), sortDescriptors: []) public var saturdays: FetchedResults<Saturday>
    @FetchRequest(entity: Sunday.entity(), sortDescriptors: []) public var sundays: FetchedResults<Sunday>
    /* A FetchRequest which appears in a bunch of my views and gets the Core Data entities and puts
     their values into arrays; the values can be editted by picking them form the arrays
     */
    
    var deviceUsage: [(String, Int32)]
    var device: String
    
    var body: some View {
        ScrollView{
            Spacer()
            HStack{
                Spacer()
                
                Button{
                    refreshWeek()
                }label:{
                    Label("Clear Week Data", systemImage: "trash.circle.fill")
                        .foregroundColor(.red)
                }
                .padding()
            }
            
            VStack{
                Text("This week")
                    .font(.custom("PingFang HK",size: 36))
                    .fontWeight(.light)
                    .padding()
                
                BarChartView(data: ChartData(values: deviceUsage), title: device, style: Styles.barChartStyleNeonBlueLight, form: ChartForm.extraLarge)
                    .padding()
                // A chart from the SwifuUICharts package that displays data in the format of (String, Double)
            }
        }
    }
}


extension GameMonitorGraphs {
    func refreshWeek() {
        for i in sundays {
            managedObjectContext.delete(i)
        }
        
        
        for i in mondays {
            managedObjectContext.delete(i)
        }
        
        for i in tuesdays {
            managedObjectContext.delete(i)
        }
        
        for i in wednesdays {
            managedObjectContext.delete(i)
        }
        
        for i in thursdays {
            managedObjectContext.delete(i)
        }
        
        for i in fridays {
            managedObjectContext.delete(i)
        }
        
        for i in saturdays {
            managedObjectContext.delete(i)
        }
        
        replaceWeek()
        
        do {
            try managedObjectContext.save()
            print("Data saved!")
        } catch {
                fatalError("Error: \(error.localizedDescription)")
        }
    }
// Function to delete and replace the current week ⬇️
    
    func replaceWeek() {
        let sun = Sunday(context: managedObjectContext)
        sun.nintendo = Int32(0)
        sun.playstation = Int32(0)
        sun.xbox = Int32(0)

        let mon = Monday(context: managedObjectContext)
        mon.nintendo = Int32(0)
        mon.playstation = Int32(0)
        mon.xbox = Int32(0)

        let tues = Tuesday(context: managedObjectContext)
        tues.nintendo = Int32(0)
        tues.playstation = Int32(0)
        tues.xbox = Int32(0)

        let wed = Wednesday(context: managedObjectContext)
        wed.nintendo = Int32(0)
        wed.playstation = Int32(0)
        wed.xbox = Int32(0)

        let thurs = Thursday(context: managedObjectContext)
        thurs.nintendo = Int32(0)
        thurs.playstation = Int32(0)
        thurs.xbox = Int32(0)

        let fri = Friday(context: managedObjectContext)
        fri.nintendo = Int32(0)
        fri.playstation = Int32(0)
        fri.xbox = Int32(0)

        let sat = Saturday(context: managedObjectContext)
        sat.nintendo = Int32(0)
        sat.playstation = Int32(0)
        sat.xbox = Int32(0)
    }
}

//struct GameMonitorGraphs_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        GameMonitorGraphs()
//    }
//}
