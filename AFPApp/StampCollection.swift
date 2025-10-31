//
//  StampCollection.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import SwiftUI
import _MapKit_SwiftUI

struct StampCollection: View {
    
    @State private var searchText: String = ""
    @State private var selectedStamp: Stamp? = nil
    @State private var showPopup = false
    private let stamps = Stamp.StampLoader.loadStamps()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        ZStack {
            
            NavigationStack{
                VStack(spacing: 20) {
                    Text("Collection")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.greenTitle)
                        .padding(.top)
                    
                    Text("Tokyo")
                        .font(.title2)
                        .foregroundStyle(.greenSubtitle)
                        .fontWeight(.semibold)
                    
                    
                    NavigationLink(destination: InterractivMap()){
                        Text("Chercher sur la carte")
                            .foregroundStyle(Color.greenTitle)
                            .fontWeight(.bold)
                    }
                }
                TextField("Chercher un QR Code", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(stamps) { stamp in
                            ZStack {
                                Image(stamp.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .padding(8)
                                    .blur(radius: stamp.isLocked ? 3 : 0)
                                    .opacity(stamp.isLocked ? 0.7 : 1)
                                
                                if stamp.isLocked {
                                    Image("lock")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                }
                            }
                            .onTapGesture {
                                selectedStamp = stamp
                                showPopup = true
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                )
                .padding(.horizontal)
            }
            
            // Popup
            if showPopup, let stamp = selectedStamp {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showPopup = false
                    }
                
                VStack(spacing: 20) {
                    if !stamp.isLocked {
                        Image(stamp.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 300)
                    } else {
                        Image(stamp.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300, maxHeight: 300)
                            .blur(radius: stamp.isLocked ? 3 : 0)
                            .opacity(stamp.isLocked ? 0.7 : 1)
                            
                        Text("Tampon verrouillé")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                    Text("Location : \(stamp.location)")
                        .font(.title2)
                    
                    Button(action: {
                        showPopup = false
                    }) {
                        Image("close")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .shadow(radius: 10)
            }
        }
    }
}
#Preview {
    StampCollection()
}
