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
        
        VStack{
            Text("Passeports")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.greenTitle)
            Text("Japon")
                .font(.subheadline)
                .foregroundStyle(.greenSubtitle)
            
            // SECTION VILLE
            VStack(spacing: 15) {
                
                TextField("Chercher une ville", text: $citySearchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
            }
        }
        
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray)
                    .frame(width: 370, height: 110)
                Image("TokyoMini")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("4/12")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
            }
            
        }
        
        
        
    }
}

#Preview {
    PassportItems()
}
