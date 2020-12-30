//
//  MainView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var showSideMenu = false
    var body: some View {
        VStack(spacing: 20) {
            
            NavigationView {
            NavigationLink(destination: OpenAlert()) {
                Text("Alert")
            }
            
            NavigationLink(destination: OpenAction()) {
                Text("Action")
            }
            
            NavigationLink(destination: ButtonView()) {
                Text("Open Sheet")
            }
   
            NavigationLink(destination: BottomTabView()) {
                 Text("Bottom TabView")
            }
          
            NavigationLink(destination: HalfScreenView()) {
                 Text("Half View ")
            }
            
            NavigationLink(destination: Segmented2Views()) {
                Text("Segmented View")
            }
            Button(action: {
                self.showSideMenu.toggle()
            }) {
                Text("SideMenuView")
            }
            .sheet(isPresented: $showSideMenu) {
                SideMenuView()
            }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




struct ButtonView: View {
    
    @State var openSheet = false
    
    var body: some View {
         VStack{
                    
            Button(action: {
                self.openSheet.toggle()
            }) {
                Text("Open Sheet")
            }
            .sheet(isPresented: $openSheet) {
                MySheet()
            }
                    
                    
                    
                    
                }
                    
               // .frame(width: 500, height: 1000)
                //.edgesIgnoringSafeArea(.all)
                //.background(Color.green)
            }
        }

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}



struct MySheet: View {

var body: some View {

    // Display Code: Start
    Text("""

    // below struct
    @State var openSheet = false


    // in body
    Button(action: {
        self.openSheet.toggle()
    }) {
        Text("Open Sheet")
    }
    .sheet(isPresented: $openSheet) {
        MySheet()
    }


    // place info inside of MySheet
    

    """)
        .font(.system(size: 20))
    .padding()
    // Display Code: End
    }
    
}



struct OpenAlert: View {
    @State var openAlert = false
    var body: some View {
        
        VStack {
            Button(action: {
                self.openAlert.toggle()
            }) {
                Text("Open Alert")
            }


            // Display Code: Start
            Text("""

            VStack {
                Button(action: {
                    self.openAlert.toggle()
                }) {
                    Text("Open Alert")
                }
            }

            """)
                .font(.system(size: 25))
            .padding()
            // Display Code: End

        }
        .alert(isPresented: $openAlert) {
            Alert(title: Text("Title Part : HI"), message: Text("MESSAGE : YOO"), dismissButton: .default(Text("OK")))
        }
    }
}



struct OpenAction: View {
    
@State var openAction = false
    
    var actionSheet : ActionSheet {
        ActionSheet(
            title: Text("Title to Action sheet"),
            message: Text("Message for action sheet"),
            buttons: [
                .default(Text("default button1"), action:  {
                    print("trigger clciked1")
                    
                }),
                .default(Text("default button2"), action:  {
                    print("trigger clciked2")
                }),
                .destructive(Text("Close button")),
        ])
    }
var body: some View {
    
    
    VStack {
    Button(action: {
        self.openAction.toggle()
    }) {
        Text("Open Action Sheet")
    }
    
 
        
        // Display Code: Start
        Text("""
        // Under Struct
        
        @State var openAction = false
        
        var actionSheet : ActionSheet {
            ActionSheet(
                title: Text("Title to Action sheet"),
                message: Text("Message for action sheet"),
                buttons: [
                    .default(Text("default button1"), action:  {
                        print("trigger clciked1")
                        
                    }),
                    .default(Text("default button2"), action:  {
                        print("trigger clciked2")
                    }),
                    .destructive(Text("Close button")),
            ])
        }


        // In Body

        VStack {
        Button(action: {
            self.openAction.toggle()
        }) {
            Text("Open Action Sheet")
        }

        """)
            .font(.system(size: 17))
        .padding()
    
        // Display Code: End

        
        
        
        
        
        
        
    }
    .actionSheet(isPresented: $openAction, content: {self.actionSheet })
    
    }
}



struct BottomTabView: View  {
    var body: some View {
        
        TabView {
            //1
            Tab1()
                .tabItem {
                    Image(systemName: "equal.square.fill")
                    Text("Home")
            }
            Tab2()
                .tabItem {
                    Image(systemName: "equal.square.fill")
                    Text("Home")
            }
        }
    }
}


struct Tab1: View  {
var body: some View {
    
    // Display Code: Start
     Text("""
    // Add to body
    TabView {

        //1
        Tab1()
            .tabItem {
                Image(systemName: "equal.square.fill")
                Text("Home")
        }

        //2
        Tab2()
            .tabItem {
                Image(systemName: "equal.square.fill")
                Text("Home")
        }
    }

    """)
        .font(.system(size: 15))
    .padding()
    // Display Code: End
    }
}

struct Tab2: View  {
var body: some View {
    // Display Code: Start
     Text("""
    // to change the color place in  sceneDelegate under var window: UIWindow?

    // Tab Bar
    override init() {

            UITabBar.appearance().shadowImage = UIImage()
            UITabBar.appearance().backgroundImage = UIImage()
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    """)
        .font(.system(size: 15))
    .padding()
    // Display Code: End
    
    }
    
}







struct HalfScreenView: View {
    
    @State var halfModal_shown = false
    var body: some View {
        ZStack{
            Button(action: {
                self.halfModal_shown.toggle()
                
            }) {
                Text("show card")
            }
            HalfModalView(isShown: $halfModal_shown, modalHeight: 600){
                // Display Code: Start
                ScrollView(.vertical, showsIndicators: true) {
                 Text("""
                // Under Struct

                @State var halfModal_shown = false

                // In Body
                
                ZStack{
                    Button(action: {
                        self.halfModal_shown.toggle()
                        
                    }) {
                        Text("show card")
                    }
                    HalfModalView(isShown: $halfModal_shown, modalHeight: 600){
                        // text("Type  here")
                    }
                }


                // In another file name : HalfModalView
                

                struct HalfModalView<Content: View> : View {
                    @GestureState private var dragState = DragState.inactive
                    @Binding var isShown:Bool
                    
                    private func onDragEnded(drag: DragGesture.Value) {
                        let dragThreshold = modalHeight * (2/3)
                        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
                            isShown = false
                        }
                    }
                    
                    var modalHeight:CGFloat = 400
                    
                    
                    var content: () -> Content
                    var body: some View {
                        let drag = DragGesture()
                            .updating($dragState) { drag, state, transaction in
                                state = .dragging(translation: drag.translation)
                        }
                        .onEnded(onDragEnded)
                        return Group {
                            ZStack {
                                //Background
                                Spacer()
                                    .edgesIgnoringSafeArea(.all)
                                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                                    .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                    .gesture(
                                        TapGesture()
                                            .onEnded { _ in
                                                self.isShown = false
                                        }
                                )
                                
                                //Foreground
                                VStack{
                                    Spacer()
                                    ZStack{
                                        Color.white.opacity(1.0)
                                            .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                        self.content()
                                            .padding()
                                            .padding(.bottom, 65)
                                            .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                                            .clipped()
                                    }
                                    .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                    .gesture(drag)
                                    
                                    
                                }
                            }.edgesIgnoringSafeArea(.all)
                        }
                    }
                }

                enum DragState {
                    case inactive
                    case dragging(translation: CGSize)
                    
                    var translation: CGSize {
                        switch self {
                        case .inactive:
                            return .zero
                        case .dragging(let translation):
                            return translation
                        }
                    }
                    
                    var isDragging: Bool {
                        switch self {
                        case .inactive:
                            return false
                        case .dragging:
                            return true
                        }
                    }
                }



                func fraction_progress(lowerLimit: Double = 0, upperLimit:Double, current:Double, inverted:Bool = false) -> Double{
                    var val:Double = 0
                    if current >= upperLimit {
                        val = 1
                    } else if current <= lowerLimit {
                        val = 0
                    } else {
                        val = (current - lowerLimit)/(upperLimit - lowerLimit)
                    }
                    
                    if inverted {
                        return (1 - val)
                        
                    } else {
                        return val
                    }
                    
                }




                """)
                    .font(.system(size: 15))
                .padding()
                }
                // Display Code: End
            }
        }
    }
}


struct HalfModalView<Content: View> : View {
    @GestureState private var dragState = DragState.inactive
    @Binding var isShown:Bool
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2/3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
            isShown = false
        }
    }
    
    var modalHeight:CGFloat = 400
    
    
    var content: () -> Content
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
        }
        .onEnded(onDragEnded)
        return Group {
            ZStack {
                //Background
                Spacer()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.isShown = false
                        }
                )
                
                //Foreground
                VStack{
                    Spacer()
                    ZStack{
                        Color.white.opacity(1.0)
                            .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        self.content()
                            .padding()
                            .padding(.bottom, 65)
                            .frame(width: UIScreen.main.bounds.size.width, height:modalHeight)
                            .clipped()
                    }
                    .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                    .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                    .gesture(drag)
                    
                    
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}



func fraction_progress(lowerLimit: Double = 0, upperLimit:Double, current:Double, inverted:Bool = false) -> Double{
    var val:Double = 0
    if current >= upperLimit {
        val = 1
    } else if current <= lowerLimit {
        val = 0
    } else {
        val = (current - lowerLimit)/(upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - val)
        
    } else {
        return val
    }
    
}



struct Segmented2Views: View {
    @State var toggled = true
    var buttonDimensions:CGFloat = 50
    var body: some View {
        
        VStack{
            ZStack{
                HStack(spacing:0){
                    Spacer().frame(height: 30).frame(maxWidth: .infinity)
                    //.background(Color.red)
                    Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : buttonDimensions)
                    //.background(Color.yellow)
                    Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : .infinity)
                    Circle().frame(width: buttonDimensions, height: buttonDimensions).foregroundColor(Color.blue)
                    Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : .infinity)
                    Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : buttonDimensions)
                    //.background(Color.yellow)
                    Spacer().frame(height: 30).frame(maxWidth: .infinity)
                }
                HStack(spacing:0){
                    Spacer()
                    Button(action: {
                        self.toggled = true
                    }) {
                        Image(systemName: "text.bubble")
                            .font(.system(size: 25))
                            .foregroundColor(toggled ? Color.white : Color.init(white: 0.8))
                    }.frame(width: buttonDimensions, height:buttonDimensions)
                    Spacer()
                    Button(action: {
                        self.toggled = false
                    }) {
                        
                        Image(systemName: "list.bullet.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(!toggled ? Color.white : Color.init(white: 0.8))
                    
                    }.frame(width: buttonDimensions, height:buttonDimensions)
                    Spacer()
                }
                
            }.animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 6))
            if toggled {
                ZStack{
                    RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.red).opacity(0.5)
                        .transition( AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                    )
                    .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
                    
                    VStack{
                        // Display Code: Start
                        ScrollView(.vertical, showsIndicators: true) {
                        Text("""
                        // below struct
                                                                        
                        @State var toggled = true
                        var buttonDimensions:CGFloat = 50

                        // in body

                            VStack{
                               ZStack{
                                   HStack(spacing:0){
                                       Spacer().frame(height: 30).frame(maxWidth: .infinity)
                                       //.background(Color.red)
                                       Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : buttonDimensions)
                                       //.background(Color.yellow)
                                       Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : .infinity)
                                       Circle().frame(width: buttonDimensions, height: buttonDimensions).foregroundColor(Color.blue)
                                       Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : .infinity)
                                       Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : buttonDimensions)
                                       //.background(Color.yellow)
                                       Spacer().frame(height: 30).frame(maxWidth: .infinity)
                                   }
                                   HStack(spacing:0){
                                       Spacer()
                                       Button(action: {
                                           self.toggled = true
                                       }) {
                                           Image(systemName: "text.bubble")
                                               .font(.system(size: 25))
                                               .foregroundColor(toggled ? Color.white : Color.init(white: 0.8))
                                       }.frame(width: buttonDimensions, height:buttonDimensions)
                                       Spacer()
                                       Button(action: {
                                           self.toggled = false
                                       }) {
                                           
                                           Image(systemName: "list.bullet.below.rectangle")
                                           .font(.system(size: 25))
                                           .foregroundColor(!toggled ? Color.white : Color.init(white: 0.8))
                                       
                                       }.frame(width: buttonDimensions, height:buttonDimensions)
                                       Spacer()
                                   }
                                   
                               }.animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 6))
                               if toggled {
                                   ZStack{
                                       RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.red).opacity(0.5)
                                           .transition( AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                                       )
                                       .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
                                       
                                       VStack{
                                           Text("Put info 1 here....")
                                           Image(systemName: "text.bubble")
                                       }
                                           
                                       
                                   }
                               } else {
                                   ZStack{
                                       
                                       RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.blue).opacity(0.5)
                                           .transition( AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
                                           
                                       )
                                       .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
                                       VStack{
                                           Text("Put info 2 here....")
                                           Image(systemName: "text.bubble")
                                       }
                                   }
                               }
                           }
                           
                           
                           


                        """)
                            .font(.system(size: 15))
                        .padding()
                        }
                        // Display Code: End
                        
                        
                        
                        
                        Image(systemName: "text.bubble")
                    }
                        
                    
                }
            } else {
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.blue).opacity(0.5)
                        .transition( AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
                        
                    )
                    .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
                    VStack{
                        Text("Put info 2 here....")
                        Image(systemName: "text.bubble")
                    }
                }
            }
        }
        
        
        
        
    }
}

struct Segmented2Views_Previews: PreviewProvider {
    static var previews: some View {
        Segmented2Views()
    }
}





struct SideMenuView: View {
    
    let buttons = [  MenuButton(text: "Saved", sfsymbol: "bookmark", action: {print("potato")}),
                     MenuButton(text: "Edit Profile", sfsymbol: "pencil.circle", action: {print("you pressed the save button")}),
                     MenuButton(text: "Settings", sfsymbol: "gear", action: {print("you pressed the save button")}),
                     MenuButton(text: "Discover", sfsymbol: "star", action: {print("you pressed the save button")}),
                     MenuButton(text: "Contact", sfsymbol: "quote.bubble", action: {print("you pressed the save button")}),
                     MenuButton(text: "Sign-Out", sfsymbol: "square.lefthalf.fill", action: {print("you pressed the save button")})
    ]
    @State var menuShown = false
    
    var body: some View {
        ZStack{
            SlidingMenuView(buttons: buttons)
            //Foreground View
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
                    HStack {
                        Button(action: {self.menuShown.toggle()}) {
                            Image(systemName: "ellipsis")
                            .padding()
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .scaleEffect(menuShown ? 0.8 : 1)
            .offset(x: menuShown ? 200 : 0)
            .animation(.easeInOut(duration: 0.2))
        .shadow(radius: 4)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}




struct MenuButton:Identifiable {
    var id = UUID()
    var text:String
    var sfsymbol:String
    var action:() -> Void
}

struct SlidingMenuView: View {
    
    var buttons:[MenuButton]
    var body: some View {
        
        HStack{
            VStack{
            Spacer().frame(height:UIApplication.shared.windows.first?.safeAreaInsets.top)
            ForEach(buttons, id: \.id){thisButton in
                Button(action: {thisButton.action()}){
                    HStack{
                        Image(systemName: thisButton.sfsymbol)
                        Text(thisButton.text)
                    }.padding().foregroundColor(.black)
                }
            }
                Spacer()
        }.edgesIgnoringSafeArea(.all)
            Spacer()
        }
    }
}
//
//struct SlidingMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlidingMenuView()
//    }
//}
