//
//  MainLoadingScreen.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainLoadingScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: LoadingScreen1()) {
                Text("Loading Screen 1")
            }
        }
    }
}

struct MainLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainLoadingScreen()
    }
}



struct LoadingScreen1: View {
    
    @State var isAnimating = false
    
    func foreverAnimation(_ thisDelay:Double = 0) -> Animation{
        
        return Animation.easeInOut(duration: 1)
            .repeatForever(autoreverses: false)
            .delay(thisDelay/10)
    }
    
    var numberOfCircles = 5
    
    @State var totalAngle:Double = 0
    var body: some View {
        
        ZStack{
            ForEach(0..<numberOfCircles){i in
            VStack{
            Circle().frame(width:20, height:20)
            //.background(Color.red)
            Spacer()
            }.frame(width:100, height:100)
            //.background(Color.green)
            .opacity(1 - (Double(i)/Double(self.numberOfCircles)))
            .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
            .animation(self.foreverAnimation(Double(i)))
            .onAppear {
            self.isAnimating = true
            }
            }
            }
        .rotationEffect(Angle(degrees: self.totalAngle))
    .animation(
        .easeInOut(duration: 1)
        )
            .onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                    
                    self.totalAngle += 50
                    
                }
        }
        
    }
}

struct LoadingScreen1_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen1()
    }
}

