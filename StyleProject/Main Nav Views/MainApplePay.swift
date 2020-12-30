//
//  MainApplePay.swift
//  StyleProject
//
//  Created by Darrien Huntley on 8/10/20.
//  Copyright © 2020 dhuntleyinc. All rights reserved.
//

import SwiftUI

struct MainApplePay: View {
    var body: some View {
        VStack{
            Text("1. Enable Apple Pay in Xcode and Create a merchant ID (+).")
            Text("2. https://developer.apple.com/account/resources/identifiers/list/merchant")
            Text("3. Create a New Certificate")
            Text("4. Open: Keychain Access")
            Text("5. Click Keychain Access at the top, Certificste Assistant, Request... ")
            Text("6. enter email, check box, continue  ...., ECC, 256,  ")
            Text("5. Add to app store connect ")
            Text("5. Open in app-Purchases ")
            Text("5. Add to app store connect ")
   
            
           
            

        }
        
        
        
    }
}

struct MainApplePay_Previews: PreviewProvider {
    static var previews: some View {
        MainApplePay()
    }
}
