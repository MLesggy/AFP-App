//
//  ScrapBookPage3.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

import SwiftUI

struct ScrapBookPage3: View {
    var onSwipe: () -> Void
    
    var body: some View {
        ZStack{
            
            VStack{
                Image("FugiSan")
                    .resizable()
                    .frame(width: 250, height: 210)
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
    ScrapBookPage3(onSwipe: {})
}
