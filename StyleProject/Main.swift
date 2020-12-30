//
//  Main.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/14/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI




struct Coding: Identifiable, Hashable {
    
    var id: String
    var name: String
    var backgroundImageName: String
    var subtitle: String
    var imageName: String
    var imageName1: String
    var category: Category
    var codeDescription: String
    var code: String
}

enum Category: String, CaseIterable, Codable, Hashable {
    case view
    case animation
    case Loop
}

let codingData = [
    Coding(
           id: UUID().uuidString,
           name: "Views",
           backgroundImageName: "gold-background",
           subtitle: "Recomended",
           imageName: "main",
           imageName1: "background",
           category: Category.view,
           codeDescription: "Change the background",
           
           code:  """
                     ZStack {
                     
                     Color(colorLiteral).edgesIgnoringSafeArea(.all)
                     
                     }
                     """
         
       ),
    
    Coding(
        id: UUID().uuidString,
        name: "Backgrounds",
        backgroundImageName: "gold-background",
        subtitle: "Recomended",
        imageName: "main",
        imageName1: "gold-screen-1",
        category: Category.view,
        codeDescription: "Have your website in the form of an app your customers to havfe forever on their phone",
        code: "tigjitjgitjigtijgij"
    )

]

//struct MainCoding: View {
//
//    var coding : Coding
//
//    var body: some View {
//        CodingRow(coding: coding)
//    }
//}
//
//struct MainCoding_Previews: PreviewProvider {
//    static var previews: some View {
//        MainCoding(coding: codingData[0])
//    }
//}



// design row
struct CodingRow: View {
    
    var coding : Coding
    
    var body: some View {
        HStack {
            Image(coding.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 40)
            Text(coding.name)
            
            Spacer()
        }.padding(.leading, 20)
    }
}


struct CodingRow_Previews: PreviewProvider {
    static var previews: some View {
        CodingRow(coding: codingData[0])
    }
}



// lists and main view
struct CodingList: View {
    
   
    
    var body: some View {
        NavigationView {
        VStack {
            VStack {
                Text("Hello Coder")
            }
            .padding()
                 List(codingData) { coding in
                    
                    NavigationLink(destination: CodingDetail(coding: coding)) {
                         CodingRow(coding: coding)
                    }
                }
            }
        .navigationBarHidden(true)
        .navigationBarTitle("")
            
        }
        
        
        
        
    }
}


struct CodingList_Previews: PreviewProvider {
    static var previews: some View {
        CodingList()
    }
}






// next page & details
struct CodingDetail: View {
    var coding : Coding
    

    
    var body: some View {
        VStack {
            Text(coding.name)
            Text(coding.codeDescription)
            
            if coding.name == "Views" {
            NavigationLink(destination: BackgroundImageView()) {
                Text("Background Image")
            }//.padding(.all, 40)
            
            }
            
        }
    }
}
