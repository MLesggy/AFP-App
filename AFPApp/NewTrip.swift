//
//  NewTrip.swift
//  AFPApp
//
//  Created by Apprenant145 on 20/10/2025.
//

import SwiftUI

struct NewTrip: View {
    
    @State private var searchText = ""
    let countries = ["Japon", "Allemagne", "Italie", "Espagne", "Portugal"]
    let cities = ["Tokyo", "Berlin", "Rome", "Madrid", "Lisbonne"]
    
    
    var body: some View {
        
        VStack {
            NavigationStack {
                if !searchText.isEmpty {
                       List(filteredCountryNames, id: \.self) { name in
                           Text(name)
                       }
                       .searchable(text: $searchText, prompt: "chercher un pays")
                       .navigationTitle(Text("Choisir un pays"))
                   } else {
                       VStack {
                           Text("Tapez pour rechercher un pays")
                               .foregroundColor(.gray)
                               .padding()
                       }
                       .searchable(text: $searchText, prompt: "chercher un pays")
                       .navigationTitle(Text("Choisir un pays"))
                   }
               }
                
            }
            VStack{
                Text("Ou allons-nous?")
                    .font(.title)
                    .padding(.top)
                    .foregroundStyle(.greenTitle)
                    .bold(true)
            }
            ZStack{
                Text("Hacking with Swift")
                    .frame(width: 100, height: 10, alignment: .center)
                    .background(.white)
                    .foregroundStyle(.white)
                    .border(Color.gray, width: 1)
                    .cornerRadius(10)
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
           
           
        }
    

#Preview {
    NewTrip()
    TabBar()
}
