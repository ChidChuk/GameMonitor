//
//  FadeoutManager.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 3/3/23.
//

import Foundation
import SwiftUI

class FadeoutManager: ObservableObject {
    
//    @ObservedObject var stopWatchManager = StopWatchManager()
  
    @Published var opacity = 0.0
    
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.75, repeats: true) { _ in
            self.fade()
        }
    }
    
    func fade(){
        let newOpacityValue = 1 - opacity
        withAnimation(newOpacityValue == 1 ? .easeIn(duration: 1.0) : .easeIn(duration: 1.0)) {
            opacity = newOpacityValue
        }
    }
    
}
