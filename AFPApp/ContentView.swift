//
//  ContentView.swift
//  AFPApp
//
//  Created by Apprenant145 on 20/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationStack {
            
            VStack{
                //        Premier stack titre et legende
                VStack{
                    Text("Bienvenue, Rufus!")
                        .font(.largeTitle)
                        .bold(true)
                        .foregroundStyle(.greenTitle)
                }
                
                VStack {
                    Text("Découvrez, sélectionnez, explorez le monde.")
                    Text("La prochaine destination est à portée de main.")
                        .fontWidth(.standard)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }   .font(.subheadline)
                    .padding(.top, 20)
                
                
                //          Deuxième Stack, mes voyages + Scanner
                HStack(spacing: 140) {
                    Text("Mes Voyages")
                    Text("Scannez")
                }
                .foregroundStyle(Color.greenSubtitle)
                .fontWeight(.semibold)
                
                HStack (spacing: 50){
                    Image("null")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 100)
                        .clipShape(Rectangle())
                    Button {
                        print("button was tapped")
                    } label: {
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.black)
                            .padding(8)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                }
                .padding(.bottom)
                
                //     Troisième Stack: suggestions de voyage
                VStack {
                    Text("Suggestion de voyage")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.greenSubtitle)
                    
                    
                    HStack{
                        let imageNames = ["hawai", "ny", "tower"]
                        
                        ForEach(imageNames, id: \.self) { name in Image(name)
                                .resizable()
                                .frame(width: 110, height: 150)
                                .clipped()
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity)
                                .padding(6)
                        }
                    }
                    
                    //            Dernier Stack avec le bouton
                    VStack{
                        NavigationLink(destination: NewTrip()) {
                            Text("Nouveau voyage")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.greenTitle)
                                .background(Color.greenButtonBackGround)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.greenTitle, lineWidth: 1)
                                )
                                .padding(.top, 30)
                        }
                    }
                    }
                    
                }
            }
        }
    }
    
    
    
    






#Preview {
    ContentView()
}

