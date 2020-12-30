//
//  SwiftUIAlternateIcons.swift
//  StyleProject
//
//  Created by Darrien Huntley on 11/3/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct AlternateIcons: View {

    @EnvironmentObject var iconSettings : IconNames

    var body: some View {
     
            Form {
                Section{
                    
                    Picker(selection: $iconSettings.currentIndex, label: Text("Icons"))
                    {
                        ForEach(0..<iconSettings.iconNames.count) { index in
                            HStack{
                                Text(self.iconSettings.iconNames[index] ?? "Default")
                                    .frame(minWidth : 100, alignment: .leading)

                                Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Default") ?? UIImage())
                                    .renderingMode(.original) //important
                                    .frame(height: 50)
                            }
                        }
                    }.onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in

                        let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0

                        if index != value{
 
                            UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]){ error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("Success!")
                                }
                            }
                        }
                    }
                }

            } .navigationBarTitle("AlternateIcons", displayMode: .inline)

        
    }
}

struct AlternateIcons_Previews: PreviewProvider {
    static var previews: some View {
        AlternateIcons()
    }
}



class IconNames: ObservableObject {
    var iconNames: [String?] = [nil]
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName{
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }

    }
    
    func getAlternateIconNames()
    {
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
            let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any]
        {
                 
             for (_, value) in alternateIcons{

                 guard let iconList = value as? Dictionary<String,Any> else{return}
                 guard let iconFiles = iconList["CFBundleIconFiles"] as? [String]
                     else{return}
                     
                 guard let icon = iconFiles.first else{return}
                 iconNames.append(icon)
    
             }
        }
    }
}


