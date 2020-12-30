//
//  MainBackgroundView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: BackgroundImageView()) {
                Text("Background Image")
            }//.padding(.all, 40)
            
            NavigationLink(destination: BackgroundColorView()) {
                Text("Background Color")
            }
            
            NavigationLink(destination: AnimatedBackground()) {
                Text("Animated Background")
            }
            
            
        }
    }
}

struct MainBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        MainBackgroundView()
    }
}



struct BackgroundImageView: View {
    var body: some View {
        
        ZStack{
            
            Image("background_w")
                
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            // Display Code: Start
            Text("""

            ZStack{
                Image("background_w")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
            

            """)
                .font(.system(size: 25))
            .padding()
            // Display Code: End
            
            
            
        }
            
       // .frame(width: 500, height: 1000)
        //.edgesIgnoringSafeArea(.all)
        //.background(Color.green)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}


struct BackgroundColorView: View {
    var body: some View {
        ZStack{
            
            Text("")
                
            // Display Code: Start
            Text("""

            ZStack{
                Text("")
            }
            .frame(width: 500, height: 1000)
            .edgesIgnoringSafeArea(.all)
            .background(Color.green)

            or

            ZStack {
            Color(colorLiteral).edgesIgnoringSafeArea(.all)
            
            }
            

            """)
                .font(.system(size: 25))
            .padding()
            // Display Code: End
            
            
            
        }
        .frame(width: 500, height: 1000)
        .edgesIgnoringSafeArea(.all)
        .background(Color.green)
    }
}



struct AnimatedBackground: View {
    
    let universalSize = UIScreen.main.bounds
    
    @State var isAnimated = false
    var body: some View {
        
        ZStack {
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: isAnimated ? -1*universalSize.width : 0)
            .animation(
                Animation.linear(duration: 2)
                .repeatForever(autoreverses: false)
            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
            .animation(
                Animation.linear(duration: 5)
                .repeatForever(autoreverses: false)
            )
            
            
            // Display Code: Start
            ScrollView(.vertical, showsIndicators: true) {
                Text("""
            // In body
                ZStack {
                   getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                       .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                       .offset(x: isAnimated ? -1*universalSize.width : 0)
                   .animation(
                       Animation.linear(duration: 2)
                       .repeatForever(autoreverses: false)
                   )
                   getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                       .foregroundColor(Color.init(red: 0.3, green: 0.6, blue: 1).opacity(0.4))
                       .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
                   .animation(
                       Animation.linear(duration: 5)
                       .repeatForever(autoreverses: false)
                   )
                }.onAppear(){
                self.isAnimated = true
                }
                
                }
            
            func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
            Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
            }
            
            }
            }

            """)
                    .font(.system(size: 15))
                    .padding()
            }
            // Display Code: End
            
        }.onAppear(){
            self.isAnimated = true
        }
            
    }
    
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
    
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}

