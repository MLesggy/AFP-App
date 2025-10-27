import SwiftUI




//logique qui gère le popup sur la page Gift

struct CouponOverlayView: View {
    let coupon: GiftItem
    var onClose: () -> Void

    @State private var showCode = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        onClose()
                    }
                }

            VStack(spacing: 20) {
                Image(coupon.giftImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 150)
                    .cornerRadius(12)
                
                Text(coupon.description)
                    .font(.headline)
                    .foregroundColor(.white)
                
                // Texte cliquable pour révéler le code promo
                Text(showCode ? coupon.code : "Code Promo")
                    .font(.caption)
                    .padding(10)
                    .background(Color.greenSubtitle.opacity(0.2))
                    .cornerRadius(5)
                    .onTapGesture {
                        withAnimation {
                            showCode.toggle()
                        }
                    }
                
                Button(action: {
                    withAnimation {
                        onClose()
                    }
                }) {
                    Image("close")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.9))
            .cornerRadius(20)
            .frame(width: 300)
            .transition(.scale)
        }
    }
}
