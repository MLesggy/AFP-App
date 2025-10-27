//
//  QRCodeFlasher.swift
//  AFPApp
//
//  Created by Apprenant145 on 27/10/2025.
//

import SwiftUI

struct QRCodeFlasher: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .ignoresSafeArea(edges: .all)
                .shadow(radius: 5)
            Rectangle()
                .fill(Color.black)
                .frame(width: 200, height: 200)
                .border(Color.white, width: 1)
                .padding()
                
            
           Text("Flashez-moi")
                .foregroundStyle(.white)
            
            
        }
            
            
            
            
            
            
            
            
            
            
    }
}

#Preview {
    QRCodeFlasher()
}
