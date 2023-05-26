//
//  Stopwatch.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/27/23.
//

import SwiftUI

struct Stopwatch: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        let hours = Int(stopWatchManager.secondsElapsed/3600)
        let minutes = Int(
            stopWatchManager.secondsElapsed.truncatingRemainder(dividingBy: 3600.0))/60
        let seconds =
        round(((stopWatchManager.secondsElapsed.truncatingRemainder(dividingBy: 3600.0)).truncatingRemainder(dividingBy: 60.0))*10)/10.0
        
        if minutes < 10{
            if seconds < 10 {
                Text(String("\(hours):0\(minutes):0\(seconds)"))
                    .font(.custom("Avenir", size: 60))
                    .padding(.bottom, 100)
            } else {
                Text(String("\(hours):0\(minutes):\(seconds)"))
                    .font(.custom("Avenir", size: 60))
                    .padding(.bottom, 100)
            }
        } else {
            if seconds < 10 {
                Text(String("\(hours):\(minutes):0\(seconds)"))
                    .font(.custom("Avenir", size: 60))
                    .padding(.bottom, 100)
            } else {
                Text(String("\(hours):\(minutes):\(seconds)"))
                    .font(.custom("Avenir", size: 60))
                    .padding(.bottom, 100)
            }
        }
    }
}

struct Stopwatch_Previews: PreviewProvider {
    static var previews: some View {
        Stopwatch()
    }
}
