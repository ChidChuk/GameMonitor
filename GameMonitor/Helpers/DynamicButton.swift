//
//  DynamicButton.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 3/8/23.
//

import SwiftUI


struct DynamicButton: View {

    @ObservedObject var stopWatchManager = StopWatchManager()

    var body: some View {
        if stopWatchManager.mode == .stopped {
            Button(action: {
                self.stopWatchManager.start()
                HapticManager.instance.impact(style: .heavy)
            }){
                GoButton(color:.blue, label:"Record", textSize: 50, scale: 0.7)
            }
        }
           
        if stopWatchManager.mode == .running{
            Button(action:{
                self.stopWatchManager.pause()
                HapticManager.instance.impact(style: .heavy)
            }){
                GoButton(color:.gradient1, label:"Pause", textSize: 50, scale: 0.7)
            }
        }
           
        if stopWatchManager.mode == .paused{
            Button(action:{
                self.stopWatchManager.start()
                HapticManager.instance.impact(style: .heavy)
            }){
                GoButton(color:.blue, label:"Resume", textSize: 50, scale: 0.7)
            }
        }
    }
}
struct DynamicButton_Previews: PreviewProvider {
    static var previews: some View {
        DynamicButton()
    }
}
