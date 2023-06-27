//
//  Wave.swift
//  Wave
//
//  Created by Manuel Antony on 27/06/23.
//

import SwiftUI


struct WaveAnimation: View {
    
    @State private var phase: Double = 0.0
    @Binding public var progress: Double
    
    var body: some View{
        WaveShape(progress: $progress, strength: 40, frequency: 7, phase: phase)
            .onAppear{
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    self.phase = .pi * 2
                }
            }
    }
}

struct WaveAnimation_Previews: PreviewProvider {
    @State static var progres = 0.0
    static var previews: some View {
        WaveAnimation(progress: $progres)
            .foregroundColor(.blue)
    }
}
