//
//  MainCoolCode.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins  // QRGenerater

struct MainCoolCode: View {
    
    @State var showsearchBar = false

    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: QRGenerater()) {
                Text("QRGenerater")
            }
            
            Button(action: {
            makeAPhoneCall(number: "6467077829")

            })  {
                Text("Call Customer Support ")
            }
            
            Button(action: {
                self.showsearchBar.toggle()
            })  {
                Text("Seach Bar")
            }
            .sheet(isPresented: $showsearchBar) {
                SearchBar(text: .constant(""))
            }
            
            
          
        }
        
        
        
        
        
    }
}

struct MainCoolCode_Previews: PreviewProvider {
    static var previews: some View {
        MainCoolCode()
    }
}




struct QRGenerater: View  {
    @State private var name = "Anonymous"
    @State private var emailAddress = "youremail@gmail.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                    .padding(.horizontal)
                
                TextField("Email", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                    .padding([.horizontal , .bottom])
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                
                Spacer()
            }
        .navigationBarTitle("YOUR CODE")
        }
        
    }
    
    func generateQRCode(from string: String)  -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage  = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "circle") ?? UIImage()
    }
    
}
 



func makeAPhoneCall( number: String)  {
    
    let url: NSURL = URL(string: "TEL://\(number)")! as NSURL
    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
}






 
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}





