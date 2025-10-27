import SwiftUI
import UIKit

struct NewTrip: View {
    
    //    Declaration des variables
    @State private var countrySearchText = ""
    @State private var citySearchText = ""
    @State private var selectedCountry: String? = nil
    @State private var selectedCity: String? = nil
    @State private var selectedContext: String? = nil
    
    
    
    
    //    LocalStorage
    let countries = ["Japon", "Allemagne", "Italie", "Espagne", "Portugal"]
    let cities = ["Tokyo", "Osaka", "Hiroshima", "Kyoto", "Kobe"]
    
    var filteredCountryNames: [String] {
        if countrySearchText.isEmpty {
            return []
        } else {
            return countries.filter { $0.lowercased().contains(countrySearchText.lowercased()) }
        }
    }
    var filteredCitiesNames : [String] {
        if citySearchText.isEmpty {
            return []
        }else{
            return cities.filter { $0.lowercased().contains(citySearchText.lowercased()) }
        }
    }
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    
                    Text("Où allons-nous ?")
                        .font(.title)
                        .foregroundColor(.greenTitle)
                        .bold()
                        .padding(.top, 40)
                    
                    //  Carte en fond arrondi
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(.systemBackground))
                            .shadow(radius: 10)
                            .padding(.horizontal)
                        
                        
                        VStack(spacing: 30) {
                            
                            // SECTION PAYS
                            VStack(spacing: 15) {
                                Text("Pays")
                                    .font(.headline)
                                    .foregroundStyle(.greenSubtitle)
                                
                                TextField("Chercher un pays", text: $countrySearchText)
                                    .padding(10)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                    .autocorrectionDisabled(true)
                                    .textInputAutocapitalization(.never)
                                
                                if !filteredCountryNames.isEmpty && selectedCountry == nil {
                                    ScrollView {
                                        VStack(alignment: .leading, spacing: 5) {
                                            ForEach(filteredCountryNames, id: \.self) { country in
                                                Text(country)
                                                    .padding(.vertical, 8)
                                                    .padding(.horizontal)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .background(Color(.systemGray5))
                                                    .cornerRadius(8)
                                                    .onTapGesture {
                                                        withAnimation {
                                                            selectedCountry = country
                                                            countrySearchText = country
                                                            
                                                        }
                                                    }
                                            }
                                        }
                                    }
                                    .frame(maxHeight: 150)
                                    .transition(.opacity.combined(with: .move(edge: .top)))
                                }
                                
                                if let country = selectedCountry {
                                    Text("Pays sélectionné : \(country)")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            // SECTION VILLE
                            VStack(spacing: 15) {
                                Text("Ville")
                                    .font(.headline)
                                    .foregroundStyle(.greenSubtitle)
                                
                                TextField("Chercher une ville", text: $citySearchText)
                                    .padding(10)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                    .autocorrectionDisabled(true)
                                    .textInputAutocapitalization(.never)
                                
                                if !filteredCitiesNames.isEmpty && selectedCity == nil {
                                    ScrollView {
                                        VStack(alignment: .leading, spacing: 5) {
                                            ForEach(filteredCitiesNames, id: \.self) { city in
                                                Text(city)
                                                    .padding(.vertical, 8)
                                                    .padding(.horizontal)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .background(Color(.systemGray5))
                                                    .cornerRadius(8)
                                                    .onTapGesture {
                                                        withAnimation {
                                                            selectedCity = city
                                                            citySearchText = city
                                                           
                                                        }
                                                    }
                                            }
                                        }
                                    }
                                    .frame(maxHeight: 150)
                                    .transition(.opacity.combined(with: .move(edge: .top)))
                                }
                            }
                            
                            // SECTION CONTEXTE ET BOUTON
                            VStack(spacing: 20) {
                                Text("Dans quel contexte ?")
                                    .font(.headline)
                                    .foregroundStyle(.greenSubtitle)
                                
                                
                                HStack(spacing: 20) {
                                    Image("pro")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 130)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(selectedContext == "pro" ? Color.greenTitle : Color.clear, lineWidth: 5)
                                        )
                                        .onTapGesture {
                                            withAnimation {
                                                selectedContext = "pro"
                                            }
                                        }
                                    
                                    Image("Tourist")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 130)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(selectedContext == "Tourist" ? Color.greenTitle : Color.clear, lineWidth: 5)
                                        )
                                        .onTapGesture {
                                            withAnimation {
                                                selectedContext = "Tourist"
                                            }
                                        }
                                }
                                
                                
                                
                                
                                NavigationLink(destination: Tips()){
                                        Text("Allons-y")
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 8)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.greenTitle)
                                            .background(Color.greenButtonBackGround)
                                            .cornerRadius(10)
                                            .padding(20)
                                }
                            }
                            
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal, 24)
                    }
                }
            }
        }
    }
    
    
    
}


#Preview {
    NewTrip()
    
}

