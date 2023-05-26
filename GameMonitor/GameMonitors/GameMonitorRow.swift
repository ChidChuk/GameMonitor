//
//  GameMonitorRow.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/15/23.
//
// graphic-switch comes from pixabay's free vectors https://pixabay.com/vectors/search/nintendo%20switch/

import SwiftUI

struct GameMonitorRow: View {
    var image: Image
    var console: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        let scaleFactor: CGFloat = width/75
        HStack {
            image
                .resizable()
                .frame(width:width/scaleFactor, height:height/scaleFactor)
                .cornerRadius(5)
            
            Text(console)
            Spacer()
        }
    }
}

struct GameMonitorRow_Previews: PreviewProvider {
    static var previews: some View {
        GameMonitorRow(image:Image("graphic-Switch"),console:"Switch",width:960, height:480)
    }
}
