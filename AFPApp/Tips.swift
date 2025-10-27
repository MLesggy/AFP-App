import SwiftUI

struct Tips: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    private let tipsIcon = TipsIcon.TipsLoader.loadTips()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                // Titre
                Text("Les conseils")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.greenTitle)
                    .padding(.top)
                
                // Bloc d'introduction
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.greenTitle)
                    Text("Ici, vous retrouverez tous les conseils à suivre pour éviter les faux pas culturels. \nN’hésitez pas à rechercher des tips selon la situation que vous rencontrez !")
                        .foregroundStyle(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .frame(width: 350, height: 130)
                .padding(.horizontal)
                
                // Grille de boutons
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(tipsIcon) { tip in
                        Button(action: {
                            print("button was tapped: \(tip.nom)")
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 1)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                
                                VStack {
                                    Image(tip.icone)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                    Text(tip.nom.capitalized)
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                .padding(8)
                               
                                
                            }
                            .frame(width: 140, height: 90)
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                )
                .padding(.horizontal)
                .padding(.bottom, 30)
               
                
            }
        }
    }
}

#Preview {
    Tips()
}
