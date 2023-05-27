//
//  StopWatchManager.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/27/23.
//
//
//  StopWatchManager.swift
//  StopWatchDemoEN
//
//  Created by Farukh IQBAL on 13/06/2020.
//  Copyright © 2020 Farukh Academy. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

// A class to create a stopwatch, recording in seconds, to record time spent playing a game

class StopWatchManager: ObservableObject {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var mode: stopWatchMode = .stopped
    
    @Published var secondsElapsed = 0.0
    
    @Published var timePlayed = 0.0
    
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    // Start the timer to record in seconds and change the state to a running one
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    // Pause the timer, keeping the seconds where they are at
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    // Stop the timer and reset it
}
