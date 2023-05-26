//
//  TimePlayed.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 3/4/23.
//

import SwiftUI

struct TimePlayed: View {
    
    @ObservedObject var fadeoutManager = FadeoutManager()
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        if stopWatchManager.mode == .stopped{ Text(String("\(stopWatchManager.timePlayed) seconds played"))
                .font(.title)
//                .opacity(fadeoutManager.opacity)
        }
        
        if stopWatchManager.mode != .stopped{
            Text(String("\(stopWatchManager.timePlayed) seconds played"))
                .font(.title)
//                .opacity(0)
        }
        
    }
}

struct TimePlayed_Previews: PreviewProvider {
    static var previews: some View {
        TimePlayed()
    }
}
