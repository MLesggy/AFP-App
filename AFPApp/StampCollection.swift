//
//  StampCollection.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import SwiftUI

struct StampCollection: View {
    
    @State private var searchText: String = ""
    private let stamps = Stamp.StampLoader.loadStamps()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            // Titres et barre de recherche
            Text("Collection")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.greenTitle)
                .padding(.top)
            
            Text("Tokyo")
                .font(.title2)
                .foregroundStyle(.greenSubtitle)
                .fontWeight(.semibold)
            
            TextField("Chercher un QR Code", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            
            // Rectangle scrollable avec la grille de tampon
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(stamps) { stamp in
                        Image(stamp.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .padding(8)
                            .blur(radius: stamp.isLocked ? 3 : 0)
                            .opacity(stamp.isLocked ? 0.7 : 1)
                            .overlay(
                                Group {
                                    if stamp.isLocked {
                                        Image("lock")
                                            .offset(y: 0)
                                    }
                                }
                            )
                    }
                }
                
                
                .padding()
            }
            .frame(maxHeight: 400) // hauteur du rectangle (modifiable)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.9))
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            )
            .frame(height: 400)
            .padding(.horizontal)
        }
       
     
        
        
        
        
        
        
        
    }
}
#Preview {
    StampCollection()
}
