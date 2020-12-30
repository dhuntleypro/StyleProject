//
//  MainButtonView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainButtonView: View {
    
    @State var showWhiteButtonCode = false
    @State var showGradientButtonCode = false
    @State var showNeumorphicButtonCode = false
    @State var showClearButtonCode = false
    @State var showSheet5 = false
    
    
    @State var isShareSheetShowing = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            NavigationLink(destination: HardPressButton()) {
                Text("Notification")
            }
            Button1()
            // Button2()
            Button("white button", action: {
                self.showWhiteButtonCode.toggle()
            })
                .buttonStyle(WhiteButtonStyle(bgColor: .white))
                .padding()
                .sheet(isPresented: $showWhiteButtonCode) {
                    WhiteButtonView()
            }
            
            Button("Gradient", action: {
                self.showGradientButtonCode.toggle()
            }).buttonStyle(GradientButtonStyle(bgColor: .white))
                .padding(.horizontal, 20)
                .sheet(isPresented: $showGradientButtonCode) {
                    GradientButtonView()
            }
            
            Button("Neumorphic", action: {
                self.showNeumorphicButtonCode.toggle()
            }).buttonStyle(NeumorphicButtonStyle(bgColor: .white)).padding()
                .sheet(isPresented: $showNeumorphicButtonCode) {
                    NeumorphicButtonView()
            }
            
            Button("clearButton", action: {
                self.showClearButtonCode.toggle()
            }).buttonStyle(ClearButtonStyle(bgColor: .white))
                .padding()
                .sheet(isPresented: $showClearButtonCode) {
                    ClearButtonView()
            }
            
            
            Button(action: {
                shareButton()
            })  {
                Image(systemName: "square.and.arrow.up")
                    .font(.largeTitle)
            }
            
            
        }
        .frame(width: 500, height: UIScreen.main.bounds.height * 2)
        .edgesIgnoringSafeArea(.all)
        .background(Color.green)
        
        
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView()
    }
}



struct HardPressButton: View {
    @State var counter = 0
    
    var body: some View {
        Text("PRESS HARD - \(counter)")
            .contextMenu{
                VStack{
                    Button(action: {
                        self.counter += 1
                    }) {
                        Text("+1")
                    }
                    Button(action: {
                        print("Cancelling")
                    }) {
                        Text("Cancel")
                    }
                }
        }
        
    }
}







struct Button1: View {
    @State var showingButton1Detail = false
    
    var body: some View {
        Button(action: {
            self.showingButton1Detail.toggle()
        }, label: {
            Text("Press Me")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.red)
                .cornerRadius(10)
        }).padding()
            .sheet(isPresented: $showingButton1Detail) {
                Button1Detail()
        }
    }
}
struct Button1Detail: View {
    var body: some View {
        
        // Display Code: Start
           Text("""
        
        // Under struct -
        @State var showingButton1Detail = false
        
        // in Body
        Button(action: {
            self.showingButton1Detail.toggle()
        }, label: {
            Text("Press Me")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color.red)
                .cornerRadius(10)
        }).padding()
            .sheet(isPresented: $showingButton1Detail) {
                Button1Detail()
        }
        
        """)
               .font(.system(size: 15))
           .padding()
           // Display Code: End
        
        
    }
}


struct Button2: View {
    var body: some View {
        VStack{
            Button(action: {}, label: {
                Text("Button2")
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .background(Color.white )
                    .cornerRadius(6)
            }).padding(.bottom, 40)
        }
    }
}


struct WhiteButtonStyle: ButtonStyle {
    var bgColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.black)
            .padding(.all, 10)
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .background(Color.white )
            .cornerRadius(6)
            
        
    }
}


struct WhiteButtonView: View {
var body: some View {
    // Display Code: Start
    Text("""

    struct WhiteButtonStyle: ButtonStyle {
        var bgColor: Color
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.black)
                .padding(.all, 10)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .background(Color.white )
                .cornerRadius(6)
                
            
        }
    }
    """)
        .font(.system(size: 15))
        .padding()
    // Display Code: End
    
    
    }
    
}


//func ClearButtonStylez(color: Color, configuration: ButtonStyleConfiguration ) {
//    configuration.label
//        .foregroundColor(Color.black)
//        .padding(.leading, 20)
//        .padding(.trailing, 20)
//        .padding(.all, 10)
//        .overlay(
//        RoundedRectangle(cornerRadius: 4)
//            .stroke(Color.black, lineWidth: 2)
//    )
//}

struct ClearButtonStyle: ButtonStyle {
    var bgColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.black)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.all, 10)
            .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}


struct ClearButtonView: View {
var body: some View {
    // Display Code: Start
    Text("""

    struct ClearButtonStyle: View {
        var bgColor: Color
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.black)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.all, 10)
                .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 2)
            )
        }
    }

    """)
        .font(.system(size: 15))
        .padding()
    // Display Code: End
    
    
    }
    
}

struct GradientButtonStyle: ButtonStyle {
    var bgColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

struct GradientButtonView: View {
var body: some View {
    // Display Code: Start
    Text("""

    struct GradientButtonStyle: ButtonStyle {
        var bgColor: Color
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15.0)
        }
    }

    """)
        .font(.system(size: 15))
        .padding()
    // Display Code: End
    
    
    }
    
}



struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.leading, 100)
            .padding(.trailing, 100)
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.black)
            .animation(.spring())
    }
}

struct NeumorphicButtonView: View {
var body: some View {
    // Display Code: Start
    Text("""

    struct NeumorphicButtonStyle: ButtonStyle {
        var bgColor: Color
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .padding(.leading, 100)
                .padding(.trailing, 100)
                .padding(20)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                            .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                            .blendMode(.overlay)
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(bgColor)
                    }
            )
                .scaleEffect(configuration.isPressed ? 0.95: 1)
                .foregroundColor(.black)
                .animation(.spring())
        }
    }

    """)
        .font(.system(size: 15))
        .padding()
    // Display Code: End
    
    
    }
    
}



func shareButton()  {
   
    
    let url = URL(string: "https://apple.com")
    let av = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
    
    UIApplication.shared.windows.first?.rootViewController?
    .present(av, animated: true, completion: nil)
    
}
