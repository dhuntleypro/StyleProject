//
//  TheStart.swift
//  StyleProject
//
//  Created by Darrien Huntley on 11/3/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct TheStart: View {
    
   // var links = ["BarChart" = BarChart , "CombineURLSession" = CombineURLSession]
    var body: some View {
        List{
            //  not working
            NavigationLink(destination: AlternateIcons()) {
                Text("Alternate Icons")
            }
            
            NavigationLink(destination: BarChart()) {
                Text("Bar Chart")
            }
            NavigationLink(destination: CombineURLSession()) {
                Text("CombineURLSession")
            }
            
        }
    }
}

struct TheStart_Previews: PreviewProvider {
    static var previews: some View {
        TheStart()
    }
}
