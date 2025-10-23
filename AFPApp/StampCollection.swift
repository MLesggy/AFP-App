//
//  StampCollection.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import SwiftUI

struct StampCollection: View {
    
    @State private var searchText: String = ""
    private let stamps = StampLoader.loadStamps()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            
            
            VStack{
                Text("Collection")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.greenTitle)
                    .padding()
                Text("Tokyo")
                    .font(.title2)
                    .foregroundStyle(.greenSubtitle)
                    .fontWeight(.semibold)
                
                TextField("Chercher un QR Code", text : $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                
                
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(stamps){ stamp in Image(stamp.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .padding(8)
                            .blur(radius : stamp.isLocked ? 3 : 0)
                            .opacity(stamp.isLocked ? 0.7 : 1)
                            .overlay(
                                Group{
                                    if stamp.isLocked {
                                        Image("lock")
                                            .offset(y : 0)
                                        
                                    }
                                }
                            )
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            
            
        }
        
        
    }
}
#Preview {
    StampCollection()
}
