//
//  PassportItems.swift
//  AFPApp
//
//  Created by Apprenant145 on 21/10/2025.
//

import SwiftUI

struct PassportItems: View {
    
    @State private var citySearchText = ""
    
    var body: some View {
        
        
        NavigationStack {
            
            
            VStack {
                // TITRE + SOUS-TITRE
                VStack {
                    Text("Passeports")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.greenTitle)
                        .padding()
                    Text("Japon")
                        .font(.subheadline)
                        .foregroundStyle(.greenSubtitle)
                        .padding()
                    
                    TextField("Chercher une ville", text: $citySearchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                .padding()
                
                // LES PASSEPORTS (DEUX CARTES)
                
                VStack(spacing: 20) {
            
                        
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: 370, height: 110)
                            .shadow(radius: 5)
                        
                        HStack(spacing: 10) {
                            NavigationLink(destination: StampCollection()){
                                Image("TokyoMini")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Image("Stamp6")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipped()
                                    .offset(y: 10)
                                Image("Stamp2")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipped()
                                    .offset(y: 10)
                                Text("4/12")
                                    .foregroundStyle(.black)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 50)
                            }
                        }
                        VStack{
                            Text("Tokyo")
                                .offset(x: -40, y: -30)
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .frame(width: 370, height: 110)
                            .shadow(radius: 5)
                        
                        HStack {
                            Image("Osaka")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .padding(20)
                            Image("Stamp5")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipped()
                                .offset(x: -20, y: 10)
                            Text("1/9")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                                .padding(.horizontal, 70)
                        }
                        VStack{
                            Text("Osaka")
                                .offset(x: -30, y: -30)
                            
                        }
                    }
                }
            }
            
        }
    }
}
    
#Preview {
    PassportItems()
}
