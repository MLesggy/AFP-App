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
            NavigationStack {
                ContentView()
            }
            .tabItem {
                Label("Voyager", systemImage: "airplane")
            }
            
            Profil()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
            
            Text("")
                .tabItem {
                    Label("Cadeau", systemImage: "gift")
                }
            
            
            Passports()
                .tabItem {
                    Label {
                        Text("Pass")
                    } icon: {
                        Image("passport")
                            .renderingMode(.template)
                    }
                }
            
            
            
    
//        fermeture de la tab view et de la stack
        }
        .accentColor(.grennIcon)

    }
    
}


#Preview {
    TabBar()
}
