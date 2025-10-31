//
//  Map.swift
//  AFPApp
//
//  Created by Apprenant145 on 28/10/2025.
//

import SwiftUI
import MapKit

struct InterractivMap: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6768601, longitude: 139.7638947),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    struct Location: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
        var image : String
        
    }
    @State var isLocationSelected: Location? = nil
    
    let locations = [
        Location(name: "Tokyo Tower", coordinate: CLLocationCoordinate2D(latitude: 35.658449, longitude: 139.745536), image : "Stamp1"),
        Location(name: "Meiji-jingū", coordinate: CLLocationCoordinate2D(latitude: 35.674842, longitude: 139.699627), image : "Stamp2" ),
        Location(name: "Temple Sensō", coordinate: CLLocationCoordinate2D(latitude: 35.713403, longitude: 139.795527), image : "Stamp3"),
        Location(name: "Kuramae", coordinate: CLLocationCoordinate2D(latitude: 35.703212, longitude: 139.790939), image : "Stamp4"),
        Location(name: "Palais Imperial", coordinate: CLLocationCoordinate2D(latitude: 35.683847, longitude: 139.750686), image : "Stamp5"),
        Location(name: "Tokyo Skytree", coordinate: CLLocationCoordinate2D(latitude:  35.710054, longitude: 139.810714), image : "Stamp6"),
        Location(name: "Musée National de Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.719045, longitude: 139.775968), image : "Stamp8"),
    ]
    
    
    
    
    var body: some View {
        
        VStack{
            Text("Ma carte")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.greenTitle)
                .padding()
            Text("Japon")
                .font(.subheadline)
                .foregroundStyle(.greenSubtitle)
                .padding()
            
            
            Map (position : $position){
                
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate){
                        Button {
                            withAnimation(.spring()) {
                                isLocationSelected = location
                            }
                        } label: {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.green)
                                .shadow(radius: 3)
                        }
                    }
                }
                .tint(Color.greenSubtitle)
            } .frame(height: 500)
            
            
//            overlay
            if let selected = isLocationSelected {
                VStack{
                    Spacer()
                    VStack(spacing : 12){
                        Image (selected.image)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .font(.system(size : 40))
                            .foregroundColor(.green)
                        
                        Text(selected.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        
                        Button("Fermer"){
                            withAnimation(.spring()) {
                                isLocationSelected = nil
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    .padding()
                    .shadow(radius : 10)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            }
            
            
            
            
            
            
        }
        
    }


#Preview {
    InterractivMap()
}
