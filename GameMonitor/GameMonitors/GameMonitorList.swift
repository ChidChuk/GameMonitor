//
//  GameMonitorList.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/22/23.
//

import SwiftUI

struct GameMonitorList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var consoles: Array = ["Switch","Xbox","PlayStation"]
    var widths: Array = [960,705,725]
    var heights: Array = [480,480,480]
    
    @FetchRequest(entity: Monday.entity(), sortDescriptors: []) public var mondays: FetchedResults<Monday>
    @FetchRequest(entity: Tuesday.entity(), sortDescriptors: []) public var tuesdays: FetchedResults<Tuesday>
    @FetchRequest(entity: Wednesday.entity(), sortDescriptors: []) public var wednesdays: FetchedResults<Wednesday>
    @FetchRequest(entity: Thursday.entity(), sortDescriptors: []) public var thursdays: FetchedResults<Thursday>
    @FetchRequest(entity: Friday.entity(), sortDescriptors: []) public var fridays: FetchedResults<Friday>
    @FetchRequest(entity: Saturday.entity(), sortDescriptors: []) public var saturdays: FetchedResults<Saturday>
    @FetchRequest(entity: Sunday.entity(), sortDescriptors: []) public var sundays: FetchedResults<Sunday>
    
    var body: some View {
/* Here I make three arrays in the format of the SwiftUI Chart
 which I pass to theGameMonitorGraphs view to make the charts
 */
        let switchUsage: [(String, Int32)] =
        [
            ("Sunday", (sundays.count != 0 ? sundays[0].nintendo : Int32(0))),
            ("Monday", (mondays.count != 0 ? mondays[0].nintendo : Int32(0))),
            ("Tuesday", (tuesdays.count != 0 ? tuesdays[0].nintendo : Int32(0))),
            ("Wednesday", (wednesdays.count != 0 ? wednesdays[0].nintendo : Int32(0))),
            ("Thursday", (thursdays.count != 0 ? thursdays[0].nintendo : Int32(0))),
            ("Friday", (fridays.count != 0 ? fridays[0].nintendo : Int32(0))),
            ("Saturday", (saturdays.count != 0 ? saturdays[0].nintendo : Int32(0)))
        ]
        
        let xboxUsage: [(String, Int32)] =
        [
            ("Sunday", (sundays.count != 0 ? sundays[0].xbox : Int32(0))),
            ("Monday", (mondays.count != 0 ? mondays[0].xbox : Int32(0))),
            ("Tuesday", (tuesdays.count != 0 ? tuesdays[0].xbox : Int32(0))),
            ("Wednesday", (wednesdays.count != 0 ? wednesdays[0].xbox : Int32(0))),
            ("Thursday", (thursdays.count != 0 ? thursdays[0].xbox : Int32(0))),
            ("Friday", (fridays.count != 0 ? fridays[0].xbox : Int32(0))),
            ("Saturday", (saturdays.count != 0 ? saturdays[0].xbox : Int32(0)))
        ]

        let playstationUsage: [(String, Int32)] =
        [
            ("Sunday", (sundays.count != 0 ? sundays[0].playstation : Int32(0))),
            ("Monday", (mondays.count != 0 ? mondays[0].playstation : Int32(0))),
            ("Tuesday", (tuesdays.count != 0 ? tuesdays[0].playstation : Int32(0))),
            ("Wednesday", (wednesdays.count != 0 ? wednesdays[0].playstation : Int32(0))),
            ("Thursday", (thursdays.count != 0 ? thursdays[0].playstation : Int32(0))),
            ("Friday", (fridays.count != 0 ? fridays[0].playstation : Int32(0))),
            ("Saturday", (saturdays.count != 0 ? saturdays[0].playstation : Int32(0)))
        ]
        
        NavigationView{
            List{
                ForEach(consoles.indices, id: \.self){ index in
                    let console = consoles[index]
                    
                    NavigationLink{
                        if console == "Switch" {
                            Details_Graphs(deviceUsage: switchUsage, device: console)
                        }
                        
                        if console == "Xbox" {
                            Details_Graphs(deviceUsage: xboxUsage, device: console)
                        }
                        
                        if console == "PlayStation" {
                            Details_Graphs(deviceUsage: playstationUsage, device: console)
                        }
                    } label:{
                        GameMonitorRow(image:Image("graphic-\(console)"), console: console, width: CGFloat(widths[index]), height:CGFloat(heights[index]))
                    }
                    .navigationTitle("Consoles")
                    .font(.title3)
                }
            }
        }
    }
}

struct GameMonitorList_Previews: PreviewProvider {
    static var previews: some View {
        GameMonitorList()
    }
}
