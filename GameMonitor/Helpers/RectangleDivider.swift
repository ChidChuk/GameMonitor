//
//  RectangleDivider.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/13/23.
//

import SwiftUI

struct RectangleDivider: View {
    
    var body: some View {
        ZStack (alignment:.center){
            Rectangle()
                .foregroundColor(.gradient1)
                .frame(height:40)
            Rectangle()
                .foregroundColor(.secondary)
                .frame(width:60,height:10)
                .cornerRadius(10)
        }
    }
}

struct RectangleDivider_Previews: PreviewProvider {
    static var previews: some View {
        RectangleDivider()
    }
}
