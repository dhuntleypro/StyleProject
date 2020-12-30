//
//  MainMenuViews.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/16/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI


struct MainMenuViews: View {
    
    @State var showMenu1 = false
    
    var body: some View {
        
        VStack {
            HomeMenu(title: "Hello", imageName: "Avatar")
        }
    }
}

struct HomeMenu: View {
    
    @State var showProfile1 = false
    
    var title : String
    var imageName: String

    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(title)
                        .font(.system(size: 28, weight: .bold))
                   
                    Spacer()
                    
                    Button(action: {
                        self.showProfile1.toggle()
                    }) {
                        Image(imageName)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top,30)
                .padding(.top,100)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
                
            
            MenuView()
                .offset(y : showProfile1 ? 0 : 600)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
         
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    
    }
}

struct HomeMenu_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenu(title: "DCDV", imageName: "FVF")
    }
}



struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                
                Text("Tom - 28% complete ")
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    // bar
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame(maxWidth : .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            // smooth corners
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal,30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    var title : String
    var icon : String
    
    var body: some View {
        HStack(spacing : 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1) ))
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120,  alignment: .leading)
        }
    }
}
