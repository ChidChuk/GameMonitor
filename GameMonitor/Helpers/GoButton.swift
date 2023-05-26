//
//  GoButton.swift
//  GameMonitor
//
//  Created by Chidubem Chukwu on 2/3/23.
//

import SwiftUI

struct GoButton: View {
    var color: Color
    var label: String
    var textSize: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack{
            ScaledShape(shape: Circle(), scale: CGSize(width: scale,height: scale))
                .foregroundColor(color)
                .overlay{
                    ScaledShape(shape: Circle(), scale: CGSize(width: scale, height: scale))
                        .stroke(.white,lineWidth: 10)
                }
                .shadow(radius:7)
            Text(label)
                .font(.custom("Avenir", size: textSize))
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
}

struct GoButton_Previews: PreviewProvider {
    static var previews: some View {
        GoButton(color: .blue, label: "Record", textSize: 60, scale: 0.7)
    }
}
