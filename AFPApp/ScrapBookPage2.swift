//
//  ScrapBookPage2.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

import SwiftUI

struct ScrapBookPage2: View {
    var onSwipe: () -> Void
    
    var body: some View {
        ZStack {
            HStack {
                Image("tokyo")
                    .resizable()
                    .frame(width: 210, height: 250)
                
                Image("QR2")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .offset(x: -40, y: -80)
                
                Button(action: onSwipe) {
                    Image("BoutonSwipe")
                }
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
    ScrapBookPage2(onSwipe: {})
}
