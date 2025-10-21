//
//  PassportItems.swift
//  AFPApp
//
//  Created by Apprenant145 on 21/10/2025.
//

import SwiftUI

struct PassportItems: View {
    var body: some View {
        VStack{
            Text("Passeports")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.greenTitle)
            Text("Japon")
                .font(.subheadline)
                .foregroundStyle(.greenSubtitle)
            
            
        }
    }
}

#Preview {
    PassportItems()
}
