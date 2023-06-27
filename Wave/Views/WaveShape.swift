//
//  WaveShape.swift
//  Wave
//
//  Created by Manuel Antony on 27/06/23.
//

import SwiftUI

struct WaveShape: Shape {
    
    @Binding var progress: Double
    
    // height
    var strength: Double
    // frequency of sin wave
    var frequency: Double
    // offset
    var phase: Double = 0.0
    
    // get phase values for animating
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue}
    }
    
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        // getting screen width and height
        let width = Double(rect.width)
        let height = Double(rect.height)
        
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverWidth = 1 / midWidth
        
        let wavelength = width / frequency
        
        // starting point
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width + 5, by: 5) {
            let relativeX = x / wavelength
            
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverWidth * distanceFromMidWidth
            let parabola = -(normalDistance * normalDistance) + 1
            
            let sine = sin(relativeX + phase)
            let y = parabola * strength * sine + midHeight - progress // button controller here
            
            path.addLine(to: CGPoint(x: x, y: y))
            
        }
        // Bottom
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        
        
        return Path(path.cgPath)
    }
    
}


struct WaveShape_Preview: PreviewProvider {
   @State static var progress = 0.0
    static var previews: some View{
        WaveShape(progress: $progress, strength: 30, frequency: 10)
    }
    
}
