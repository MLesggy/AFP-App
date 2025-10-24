//
//  MyPassport.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

import SwiftUI

struct MyPassport: View {
    
    @State private var scrapBook: [ScrapBook] = []
    @State private var currentIndex : Int = 0
    
    
    
    
    var body: some View {
        
        NavigationStack{
            
            
            
            Text("Mon Passport")
                .font(.largeTitle)
                .foregroundColor(.greenTitle)
                .fontWeight(.bold)
                .padding()
            Text("Tokyo")
                .font(.title2)
                .foregroundColor(Color.greenSubtitle)
                .fontWeight(.semibold)
            
            Text("Revivez vos voyages avec votre passport!")
                .font(.title3)
                .foregroundStyle(Color.greenSubtitle)
                .padding()
            
            
            
            ZStack{
                
                VStack{
                    Image("Stamp1")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: -80)
                    
                    Image("Stamp8")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .offset(x: -80)
                }
                HStack{
                    Image("Schrine")
                        .resizable()
                        .frame(width: 150, height: 250)
                        .offset(x: 70)
                }
                
            }
            .frame(width: 350, height: 350)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.9))
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            )
            .padding(.bottom, 15)
            
            
            
            
            HStack (spacing: 120){
                Image("Advices")
                NavigationLink(destination: StampCollection()){
                    Image("StampCollection")
                }
            }
            
            
            
            
            
            
         
            
            
            
            
            
        }
    }
}

#Preview {
    MyPassport()
}
