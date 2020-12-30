//
//  Modifiers.swift
//  TruRobot
//
//  Created by Darrien Huntley on 8/19/20.
//  Copyright © 2020 Darrien Huntley. All rights reserved.
//

import SwiftUI

// BUTTONS //////////////////////////////////////////////////////////////
// BUTTONS //////////////////////////////////////////////////////////////


// See through Button
struct ClearButtonStyle2: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(bgColor)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.all, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 2)
            )
    }
}



// Double shadow
struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
    }
}


// FONTS //////////////////////////////////////////////////////////////
// FONTS //////////////////////////////////////////////////////////////


// Font Modifier

struct FontModifier : ViewModifier {
    
    var style : Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
        
    }
}



// (Custom fonts can be found at https://fonts.google.com/)
// 1. Go to info.plist
// 2. (+) Fonts provided by application
// 3. click drop down and add them by name on the right -
struct CustomFontModifier : ViewModifier {
    
    var size : CGFloat = 28
    func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
        
    }
}


// See through Button
struct fullScreen1: ViewModifier {
    
     @State var showFull = false
    
    func body(content: Content) -> some View {
        content
            .padding(showFull ? 30 : 20)
            .padding(.top, showFull ? 30 : 0)
            //.frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: showFull ? .infinity : screen.width - 60 , maxHeight: showFull ? .infinity : 280)
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .onTapGesture {
                self.showFull.toggle()
            }
            .edgesIgnoringSafeArea(.all)
    }
}
