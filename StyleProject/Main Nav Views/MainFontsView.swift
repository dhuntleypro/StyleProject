//
//  MainFontsView.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/12/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainFontsView: View {
    var body: some View {
        ScrollView(.vertical , showsIndicators: true) {
            VStack {
                
                // 1
                Text("Serif")
                    .font(.system(size: 30, weight: .bold, design: .serif))
                
                Text ( """
                    .font(.system(size: 30, weight: .bold, design: .serif))

                """)
                
                // 2
                Text("Rounded")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Text ( """
                    .font(.system(size: 30, weight: .bold, design: .rounded))

                """)
                
                // 3
                Text("Monospaced")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                
                Text ( """
                    .font(.system(size: 30, weight: .bold, design: .monospaced))

                """)
                
                
                // 4
                Text("Light - Monospaced")
                    .font(.system(size: 30, weight: .light, design: .monospaced))
                
                Text ( """
                    .font(.system(size: 30, weight: .light, design: .monospaced))

                """)
                
                // 5
                Text("Thin - Rounded")
                    .font(.system(size: 30, weight: .thin, design: .rounded))
                
                Text ( """
                    .font(.system(size: 30, weight: .thin, design: .rounded))

                """)
                
                
    //            // 5
    //            Text("Light - Rounded")
    //                .font(.system(size: 30, weight: .thin, design: .rounded))
    //
    //            Text ( """
    //                .font(.system(size: 30, weight: .thin, design: .rounded))
    //
    //            """)
                
            }

        }
        
        
        
    }
}
struct MainFontsView_Previews: PreviewProvider {
    static var previews: some View {
        MainFontsView()
    }
}
