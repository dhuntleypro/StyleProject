//
//  MainPageStyling.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainPageStyling: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: ProductPage()) {
                Text("Loading Screen 1")
            }
            
        }
    }
}

struct MainPageStyling_Previews: PreviewProvider {
    static var previews: some View {
        MainPageStyling()
    }
}


struct ProductPage : View {
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: true){
            VStack{
                
                
                ScrollView(.horizontal, showsIndicators: true)  {
                    HStack {
                        Image("background_w")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width ,height: 400 , alignment: .top)
                        
                        Image("background_w")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width ,height: 400 , alignment: .bottom)
                        
                        Image("background_w")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width ,height: 300 , alignment: .center)
                    }
                }.padding(.bottom, 10)
                
                VStack{
                    Button(action: {
                        
                    }){
                        Text("Newly Released")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.red)
                            .cornerRadius(6)
                    }
                }.padding(.bottom, 10 )
                
                VStack{
                    Text("Product Name")
                        .fontWeight(.bold)
                }
                
                Divider().frame(width: 350)
                    .background(Color.gray)
                
                
                VStack{
                    ScrollView(.horizontal, showsIndicators: false)  {
                        HStack{
                            
                            
                            Group {
                                HStack {
                                    ppp(type: "BRAND")
                                    
                                    Divider()
                                    
                                    ppp(type: "CATEGORY")
                                    Divider()
                                    
                                    ppp(type: "COLORWAY")
                                    Divider()
                                    
                                    ppp(type: "SKU")
                                    Divider()
                                    
                                    ppp(type: "RELEASE DATE")
                                    Divider()
                                    
                                }.frame(height: 100)
                            }
                            
                            
                        }
                    }
                    .padding(.bottom, 20)
                    Divider().frame(width: 350)
                        .background(Color.gray)
                }
            }
            
            VStack(alignment: .leading){
                Text("Description")
                    .fontWeight(.heavy)
                    .padding(.bottom, 20 )
                Text("rfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrfrffrfrfrfrf")
                    
                Text("SHIPPING AND RETURNS")
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                
            }.padding(.leading,15)
            .padding(.trailing,15)
            
            
        } // last
        
    }
}






struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}


struct ppp : View {
    
    var type : String
var body: some View {
        
    VStack {
        HStack {
           
            Text(type)
                .foregroundColor(.gray)
            .font(.system(size: 13))
            .padding(.leading, 15)
            .padding(.trailing, 15)
            
            
            
        }
        Text("data..")
            .foregroundColor(.black)
        
    }.foregroundColor(.gray)
        
    }
}
    
