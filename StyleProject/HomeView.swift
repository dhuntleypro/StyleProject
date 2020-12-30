//
//  HomeView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/6/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var showProfile = false
    var body: some View {
        
        NavigationView{
            ZStack {
                List{
                    NavigationLink(destination: TheStart()) {
                        Text("The Start")
                    }//.padding(.all, 40)
                    
                    
                    NavigationLink(destination: MainView()) {
                        Text("Views")
                    }//.padding(.all, 40)
                    
                    NavigationLink(destination: MainBackgroundView()) {
                        Text("Backgrounds")
                    }//.padding(.all, 40)
                    
                    NavigationLink(destination: MainButtonView()) {
                        Text("Buttons")
                    }//.padding(.all, 40)
                    
                    
                    NavigationLink(destination: MainNotificationViews()) {
                        Text("Notifications")
                    }//.padding(.all, 40)
                    
                    
                    NavigationLink(destination: MainLoadingScreen()) {
                        Text("Loading Screens")
                    }
                    
                    NavigationLink(destination: MainPageStyling()) {
                        Text("Page Stylings")
                    }
                    
                    NavigationLink(destination: MainCoolCode ()) {
                        Text("Cool Code")
                    }
                    
                    NavigationLink(destination: MainFontsView()) {
                        Text("Fonts")
                    }
                    
                    Button(action: {
                        self.showProfile.toggle()
                    }) {
                        Text("profile")
                    }
                    
                    
                }
                MenuView()
                    .offset(y: showProfile ? 0 : 600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
            }//End of ZStack
                .navigationBarTitle("Keep Coding")
            
            
        }
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



