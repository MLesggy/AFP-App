//
//  Profil.swift
//  AFPApp
//
//  Created by Apprenant145 on 21/10/2025.
//

import SwiftUI

struct Profil: View {
    var body: some View {
        
        
        //        Titre
        VStack{
            Text("Rufus")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.greenTitle)
        }
        .padding(20)
        

        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(radius: 10)
                .padding(.horizontal)
            
            VStack(){
                Image("Rufus")
            }
            .padding()
        
                
            VStack(alignment: .leading){
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
                Text("Date de naissance")
                    .font(.headline)
                    .foregroundStyle(.greenTitle)
                Text("01/04/2000")
                Text("Mot de passe")
                    .font(.headline)
                    .foregroundStyle(.greenTitle)
                Text("**********")
                
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
                        .padding(20)
                }
                
                VStack{
                    Image("planeTag")
                }
               
            }
            .padding(.leading)
            
            
           
            
            
            
            
            
            
            
            
            
            
        }
        VStack{
            Text("Supprimer le compte")
        }
        
        
        
    }
}

#Preview {
    Profil()
}
