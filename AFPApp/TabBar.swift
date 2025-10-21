//
//  TabBar.swift
//  AFPApp
//
//  Created by Apprenant145 on 20/10/2025.
//

import SwiftUI
import UIKit

struct TabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Voyager", systemImage: "airplane")
                }
            Text("")
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
            
            Text("")
                .tabItem {
                    Label("Cadeau", systemImage: "gift")
                }
            
            Text("")
                .tabItem {
                    Label {
                        Text("Pass")
                    } icon: {
                        Image("passport")
                            .renderingMode(.template)
                            .resizable()
                    }
                }
        }.accentColor(.grennIcon)
            
        
    }
       
}


#Preview {
    TabBar()
}
