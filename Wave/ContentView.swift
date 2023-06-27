//
//  ContentView.swift
//  Wave
//
//  Created by Manuel Antony on 26/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress: Double = 0.0
    
    var body: some View {
        ZStack {
            WaveAnimation(progress: $progress)
                .foregroundColor(.blue.opacity(0.5))
            
            WaveAnimation(progress: $progress, strength: 40, frequency: 7,  isPhaseReverse: true)
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
