import SwiftUI



//on aurait eu plus vite fait de faire un json

struct GiftItem: Identifiable {
    let id = UUID()
    let imageName: String
    let description: String
    let code : String
    let giftImage : String
}

struct GiftListView: View {
    let country: String
    var onTapCoupon: ((GiftItem) -> Void)? = nil
    
    var giftsForCountry: [GiftItem] {
        switch country {
        case "Japon":
            return [
                GiftItem(imageName: "atSushi", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code:"RUFUSSUSHIS25", giftImage: "sushis"),
                GiftItem(imageName: "visiteGuidé", description: "10% de réduction pour une visite guidée avec Voyages Culturels !", code : "RUFUSGUIDE25", giftImage: "tokyo"),
                GiftItem(imageName: "tokyoSkytree", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code: "RUFUSTOKYO25", giftImage: "tokyo"),
                GiftItem(imageName: "ceremonieDuThe", description: "10% de réduction pour une cérémonie du thé avec Voyages Culturels !", code : "RUFUSTHÉ25", giftImage: "tokyo"),
                GiftItem(imageName: "Ramen", description: "15% de réduction pour un ramen avec Voyages Culturels !", code:"RUFUSRAMEN15", giftImage: "tokyo")
            ]
        case "Mexique":
            return [
                GiftItem(imageName: "gift-tacos", description: "10% de réduction pour un tacos avec Voyages Culturels !", code: "RUFUSTACOS25", giftImage: "tokyo"),
                GiftItem(imageName: "gift-teotihuacan", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code: "RUFUSTEOTIHUACAN25", giftImage: "tokyo"),
                GiftItem(imageName: "gift-souvenir", description: "10% de réduction pour un sombreos souvenir avec Voyages Culturels !", code: "RUFUSSOUVENIR25", giftImage: "tokyo")
            ]
        case "États-Unis":
            return [
                GiftItem(imageName: "gift-cinema", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code : "RUFUSCINE25", giftImage: "tokyo"),
                GiftItem(imageName: "gift-burger", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code:"RUFUSBURGER25", giftImage: "tokyo"),
                GiftItem(imageName: "gift-nasa", description: "10% de réduction pour un atelier de sushi avec Voyages Culturels !", code: "RUFUSNASA25", giftImage: "tokyo")
            ]
        default:
            return []
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(" Bons d'achat débloqués pour \(country)")
                .font(.headline)
                .foregroundColor(.greenTitle)
                .padding(.bottom, 10)
            
            ForEach(giftsForCountry) { gift in
                Image(gift.imageName)
                    .resizable()
                    .frame(width: 350, height: 90)
                    .clipped()
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
                    .onTapGesture {
                        onTapCoupon?(gift)
                    }
            }
        }
        .padding()
    }
}


