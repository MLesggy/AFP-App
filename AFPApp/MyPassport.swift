//
//  MyPassport.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

import SwiftUI

struct MyPassport: View {
    
    @State private var currentIndex: Int = 0
    @Namespace private var animation
    //    empecher l'effet miroir!!!
    private let totalPages = 3
    
    
    
    @State private var isFlipping = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // En-tête
                Text("Mon Passport")
                    .font(.largeTitle)
                    .foregroundColor(.greenTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("Tokyo")
                    .font(.title2)
                    .foregroundColor(.greenSubtitle)
                    .fontWeight(.semibold)
                
                Text("Revivez vos voyages avec votre passport!")
                    .font(.title3)
                    .foregroundStyle(Color.greenSubtitle)
                    .padding(.bottom, 20)
                
                // Carnet de voyage (pages)
                ZStack {
                    // Face avant
                    pageView(for: currentIndex)
                        .opacity(isFlipping ? 0.0 : 1.0)
                        .rotation3DEffect(.degrees(isFlipping ? 180 : 0),
                                          axis: (x: 0, y: 1, z: 0))
                    
                    // Face arrière (prochaine page)
                    pageView(for: (currentIndex + 1) % totalPages)
                        .opacity(isFlipping ? 1.0 : 0.0)
                        .rotation3DEffect(.degrees(isFlipping ? 0 : -180),
                                          axis: (x: 0, y: 1, z: 0))
                }
                .frame(width: 350, height: 350)
                .padding(.bottom, 15)
                
                // Boutons bas de page
                HStack(spacing: 120) {
                    NavigationLink(destination: Tips()){
                        Image("Advices")
                    }
                    NavigationLink(destination: StampCollection()) {
                        Image("StampCollection")
                    }
                }
            }
        }
    }
    
    
    //
    @ViewBuilder
    private func pageView(for index: Int) -> some View {
        switch index {
        case 0:
            ScrapBookPage1(onSwipe: goToNextPage)
        case 1:
            ScrapBookPage2(onSwipe: goToNextPage)
        case 2:
            ScrapBookPage3(onSwipe: goToNextPage)
        default:
            EmptyView()
        }
    }
    
    // animation
    private func goToNextPage() {
        withAnimation(.easeInOut(duration: 0.6)) {
            currentIndex = (currentIndex + 1) % 3
        }
    }
}

#Preview {
    MyPassport()
}
