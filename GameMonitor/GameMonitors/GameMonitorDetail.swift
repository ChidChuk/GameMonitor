//
//  GameMonitorDetail.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/1/23.
// https://www.zerotoappstore.com/get-year-month-day-from-date-swift.html

import SwiftUI

struct GameMonitorDetail: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Monday.entity(), sortDescriptors: []) public var mondays: FetchedResults<Monday>
    @FetchRequest(entity: Tuesday.entity(), sortDescriptors: []) public var tuesdays: FetchedResults<Tuesday>
    @FetchRequest(entity: Wednesday.entity(), sortDescriptors: []) public var wednesdays: FetchedResults<Wednesday>
    @FetchRequest(entity: Thursday.entity(), sortDescriptors: []) public var thursdays: FetchedResults<Thursday>
    @FetchRequest(entity: Friday.entity(), sortDescriptors: []) public var fridays: FetchedResults<Friday>
    @FetchRequest(entity: Saturday.entity(), sortDescriptors: []) public var saturdays: FetchedResults<Saturday>
    @FetchRequest(entity: Sunday.entity(), sortDescriptors: []) public var sundays: FetchedResults<Sunday>
    
    @State public var dayIdx = 0
    
    let backgroundGradient = LinearGradient(
        colors: [.gradient1,.gradient2],
        startPoint: .top, endPoint: .bottom)
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }() // Very useful formatter that turns the day of the week into a usable String
    
    var deviceName: String
    
    var body: some View {
        let dayOfTheWeekString = dateFormatter.string(from: Date())
        
        VStack {
            DynamicButton(stopWatchManager: stopWatchManager)
            
            if stopWatchManager.mode == .paused{
                HStack(spacing:30){
                    Button(action:{self.stopWatchManager.stop()}){
                        Stop_Save_Button(text:"Reset")
                    }
                    
                    Button(action:{self.saveToDate(device: deviceName, weekday: dayOfTheWeekString, seconds: Int32(stopWatchManager.secondsElapsed))}){
                        Stop_Save_Button(text: "Save")
                    }
                }
            }
            
            if stopWatchManager.mode != .stopped {
                Stopwatch(stopWatchManager: stopWatchManager)
            }
            
            Spacer()
        }
        .animation(.interpolatingSpring(stiffness: 15, damping: 15), value: stopWatchManager.mode)
        .padding()
        .background(backgroundGradient)
    }
    
}

struct GameMonitorDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameMonitorDetail(deviceName: "Switch")
    }
}

extension Color {
    static let gradient1 = Color("Gradient1")
    static let gradient2 = Color("Gradient2")
}
// Noah helped create thes custom gradients for the background of my view

struct Stop_Save_Button: View {
    var text: String
    
    var body: some View{
        let backgroundGradient = LinearGradient(
            colors: [.gradient1,.gradient2],
            startPoint: .leading, endPoint: .trailing)
        
        Text(text)
            .foregroundColor(.black)
            .padding(.vertical, 20)
            .padding(.horizontal, 60)
            .background(backgroundGradient)
            .cornerRadius(30)
            .shadow(radius:20)
    }
}
// The view to create the reset and save buttons

extension GameMonitorDetail {
    func saveToDate(device: String, weekday: String, seconds: Int32) {
        stopWatchManager.stop()
        
        if device == "Switch" {
            saveToSwitch(weekday: weekday, seconds: seconds)
        }
        
        if device == "Xbox" {
            saveToXbox(weekday: weekday, seconds: seconds)
        }
        
        if device == "PlayStation" {
            saveToPlaystation(weekday: weekday, seconds: seconds)
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error: Failed to save new context, \(error.localizedDescription)")
        }
    }
    // A function that saves based on the device; made out of three others, each which saves usage data to the date
    
    func saveToSwitch(weekday: String, seconds: Int32) {
        let monday = mondays[dayIdx]
        let tuesday = tuesdays[dayIdx]
        let wednesday = wednesdays[dayIdx]
        let thursday = thursdays[dayIdx]
        let friday = fridays[dayIdx]
        let saturday = saturdays[dayIdx]
        let sunday = sundays[dayIdx]
        
        if weekday == "Monday" {
            monday.nintendo += seconds / 60
        }
        if weekday == "Tuesday" {
            tuesday.nintendo += seconds / 60
        }
        if weekday == "Wednesday" {
            wednesday.nintendo += seconds / 60
        }
        if weekday == "Thursday" {
            thursday.nintendo += seconds / 60
        }
        if weekday == "Friday" {
            friday.nintendo += seconds / 60
        }
        if weekday == "Saturday" {
            saturday.nintendo += seconds / 60
        }
        if weekday == "Sunday" {
            sunday.nintendo += seconds / 60
        }
    }
    
    func saveToXbox(weekday: String, seconds: Int32) {
        let monday = mondays[dayIdx]
        let tuesday = tuesdays[dayIdx]
        let wednesday = wednesdays[dayIdx]
        let thursday = thursdays[dayIdx]
        let friday = fridays[dayIdx]
        let saturday = saturdays[dayIdx]
        let sunday = sundays[dayIdx]
        
        if weekday == "Monday" {
            monday.xbox += seconds / 60
        }
        if weekday == "Tuesday" {
            tuesday.xbox += seconds / 60
        }
        if weekday == "Wednesday" {
            wednesday.xbox += seconds / 60
        }
        if weekday == "Thursday" {
            thursday.xbox += seconds / 60
        }
        if weekday == "Friday" {
            friday.xbox += seconds / 60
        }
        if weekday == "Saturday" {
            saturday.xbox += seconds / 60
        }
        if weekday == "Sunday" {
            sunday.xbox += seconds / 60
        }
    }
    
    func saveToPlaystation(weekday: String, seconds: Int32) {
        let monday = mondays[dayIdx]
        let tuesday = tuesdays[dayIdx]
        let wednesday = wednesdays[dayIdx]
        let thursday = thursdays[dayIdx]
        let friday = fridays[dayIdx]
        let saturday = saturdays[dayIdx]
        let sunday = sundays[dayIdx]
        
        if weekday == "Monday" {
            monday.playstation += seconds / 60
        }
        if weekday == "Tuesday" {
            tuesday.playstation += seconds / 60
        }
        if weekday == "Wednesday" {
            wednesday.playstation += seconds / 60
        }
        if weekday == "Thursday" {
            thursday.playstation += seconds / 60
        }
        if weekday == "Friday" {
            friday.playstation += seconds / 60
        }
        if weekday == "Saturday" {
            saturday.playstation += seconds / 60
        }
        if weekday == "Sunday" {
            sunday.playstation += seconds / 60
        }
    }
}
