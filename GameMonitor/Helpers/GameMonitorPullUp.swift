//
//  GameMonitorPullUp.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/15/23.
//

import SwiftUI

struct GameMonitorPullUp: View {
    @State private var offset: CGSize = .zero
    let e: CGFloat = 2.71828
    @State var pastLocation: CGFloat = 0
    
    var deviceUsage: [(String, Int32)]
    var device: String
    
    var body: some View {
        VStack{
            RectangleDivider()
                .offset(y:10)
            
            GameMonitorGraphs(deviceUsage: deviceUsage, device: device)
                .frame(maxWidth: .infinity)
                .background(.white)
        }
        .offset(y:730+offset.height)
        .gesture(
            DragGesture()
                .onChanged{ value in
                    let yTranslation = value.translation.height
                    withAnimation{
                        pastLocation = -500/(1+pow(e,yTranslation))
                        offset.height = pastLocation
                    }
                }
        )
    }
}

//struct GameMonitorPullUp_Previews: PreviewProvider {
//    static var previews: some View {
//        GameMonitorPullUp()
//    }
//}
