//
//  NewHomeView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/20/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct NewHomeView: View {
    @State var showFull = false
    
    var body: some View {
        
        
        List {
        RapperView(title: "Buttons", subtitle: "22 different kinds", logo: #imageLiteral(resourceName: "Avatar"), bottomImage: #imageLiteral(resourceName: "computer-design"))
        
        }
    
   
        
    }
}

struct NewHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeView()
    }
}


struct RapperView: View {
    
    var title: String
    var subtitle: String
    var logo: UIImage
    var bottomImage: UIImage // transparent
    
    @State var show = false
    // (show ? true : false)
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading , spacing: 8.0) {
                    Text(title)
                        .font(.system(size: 30, weight: .bold)) // size: 24
                        .foregroundColor(.white)
                    Text(subtitle)
                        .underline()
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                Image(uiImage: logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36, alignment: .top)
                    .clipShape(Circle())
            }
            Spacer()
            Image(uiImage: bottomImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 310)
                
        }
        
    
    }
}

let screen = UIScreen.main.bounds
