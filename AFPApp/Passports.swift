//
//  Passports.swift
//  AFPApp
//
//  Created by Apprenant145 on 21/10/2025.
//

import SwiftUI

struct Passports: View {
    var body: some View {
        NavigationView {
            
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Passeports")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.greenTitle)
                        .padding(.top, 30)
                    
                    Text("Accédez aux tips culturels et souvenirs de vos voyages !")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text("N’oubliez pas de flasher nos QR codes aux points d’intérêts dans le pays que vous visitez pour récupérer un tampon unique qui sera sauvegardé dans votre passeport.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack(spacing: 55) {
                        NavigationLink(destination:  PassportItems()){
                            Image("Japon")
                        }
                        Image("USA")
                    }
                    
                    HStack(spacing: 55) {
                        Image("Mexique")
                        Image("Italie")
                    }
                }
                .padding()
            }
        }
    }
}
#Preview {
    Passports()
}

