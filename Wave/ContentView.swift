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
            VStack(alignment: .center){
           
                WaveAnimation(progress: $progress)
                .foregroundColor(.blue)
           
                Button {
                    progress +=  10.0
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
