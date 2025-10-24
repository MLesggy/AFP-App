//
//  Profil.swift
//  AFPApp
//
//  Created by Apprenant145 on 21/10/2025.
//

import SwiftUI

struct Profil: View {
    var body: some View {
        VStack {
            // Titre
            Text("Rufus")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.greenTitle)
                .padding(60)

            ZStack(alignment: .top) {
                
                // Encadré
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, minHeight: 400)
                
                // Image de profil en haut, à cheval
                Image("Rufus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .shadow(radius: 5)
                    .offset(y: -60)
                
                // Contenu du profil
                VStack(alignment: .leading, spacing: 10) {
                    Spacer().frame(height: 10)

                    Group {
                        Text("Nom")
                            .font(.headline)
                            .foregroundStyle(.greenTitle)
                        Text("Trepide")
                        Text("Prénom")
                            .font(.headline)
                            .foregroundStyle(.greenTitle)
                        Text("Rufus")
                        Text("Addresse mail")
                            .font(.headline)
                            .foregroundStyle(.greenTitle)
                        Text(verbatim: "RufusTrepide@gmail.com")
                            .foregroundColor(.black)
                        Text("Date de naissance")
                            .font(.headline)
                            .foregroundStyle(.greenTitle)
                        Text("01/04/2000")
                        Text("Mot de passe")
                            .font(.headline)
                            .foregroundStyle(.greenTitle)
                        Text("**********")
                    }

                    Button(action: {
                        print("button was tapped")
                    }) {
                        Text("Modifier mon profil")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.greenTitle)
                            .background(Color.greenButtonBackGround)
                            .cornerRadius(10)
                            .padding(.top, 10)
                    }
                }
                .padding(.top, 40)
            }

            // Supprimer le compte
            Text("Supprimer le compte")
                .foregroundColor(.red)
                .padding(.top, 70)
                .padding(.bottom, 20)
        }
    }
}
#Preview {
    Profil()
}
