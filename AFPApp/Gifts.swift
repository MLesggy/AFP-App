//
//  Gifts.swift
//  AFPApp
//
//  Created by Apprenant145 on 27/10/2025.
//

import SwiftUI

struct Gifts: View {
    
    @State private var selectedCountry: String = "Selectionnez un pays"
    let options = ["Japon", "Mexique", "Etats-Unis"]
    @Namespace private var animationNamespace
    @State private var isExpanded = false
    @State private var selectedCoupon: GiftItem? = nil
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Texte
                    VStack(spacing: 10) {
                        Text("Cadeaux")
                            .font(.title)
                            .foregroundStyle(.greenTitle)
                            .fontWeight(.bold)
                            .padding()
                        Text("Les voyages sont plus sympa quand les cadeaux vous attendent, n’est-ce pas ?")
                        Text("En récupérant nos tampons digitaux, vous avez débloqué des cadeaux pour enrichir votre séjour !")
                    }
                    .frame(width: 350)
                    .padding(30)
                    
                    // Dropdown
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                isExpanded.toggle()
                            }
                        }) {
                            HStack {
                                Text(selectedCountry)
                                Spacer()
                                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .border(Color.gray, width: 1)
                            .foregroundStyle(Color.black)
                            .cornerRadius(8)
                            .matchedGeometryEffect(id: "dropdown", in: animationNamespace)
                        }
                        
                        if isExpanded {
                            VStack {
                                ForEach(options, id: \.self) { option in
                                    Text(option)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                selectedCountry = option
                                                isExpanded = false
                                            }
                                        }
                                        .matchedGeometryEffect(id: "dropdown-\(option)", in: animationNamespace)
                                }
                            }
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .transition(.scale)
                        }
                    }
                    .padding()
                    
                    // Contenu dynamique
                    if !selectedCountry.isEmpty && selectedCountry != "Selectionnez un pays" {
                        GiftListView(country: selectedCountry) { coupon in
                            withAnimation {
                                selectedCoupon = coupon
                            }
                        }
                        .padding(.top, 30)
                    } else {
                        Image("London")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .padding(.top, 20)
                            .transition(.opacity)
                    }
                }
            }
            
          
            if let coupon = selectedCoupon {
                CouponOverlayView(coupon: coupon) {
                    withAnimation {
                        selectedCoupon = nil
                    }
                }
            }
        }
    }
}

#Preview {
    Gifts()
}
