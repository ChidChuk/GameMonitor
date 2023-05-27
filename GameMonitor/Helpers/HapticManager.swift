//
//  HapticManager.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 5/27/23.
// https://www.youtube.com/watch?v=H45bl6e0cNs

import SwiftUI

public class HapticManager {
    static let instance = HapticManager() // Singleton
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
