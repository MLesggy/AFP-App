//
//  ScrapBookPage1.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

import SwiftUI

struct ScrapBookPage1: View {
    var onSwipe: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Image("Stamp1")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .offset(x: -80)
                
                Image("Stamp8")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .offset(x: -80)
            }
            
            HStack {
                Image("Schrine")
                    .resizable()
                    .frame(width: 150, height: 250)
                    .offset(x: 70)
                
                Button(action: onSwipe) {
                    Image("BoutonSwipe")
                }
                .offset(x: 80)
            }
        }
        .frame(width: 350, height: 350)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.9))
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        )
        .padding(.bottom, 15)
    }
}

#Preview {
    ScrapBookPage1(onSwipe: {})
}
