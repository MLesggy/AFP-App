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
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    
    
    struct Location: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }
    
    let locations = [
        Location(name: "Tokyo Tower", coordinate: CLLocationCoordinate2D(latitude: 35.658449, longitude: 139.745536)),
        Location(name: "Meiji-jingū", coordinate: CLLocationCoordinate2D(latitude: 35.674842, longitude: 139.699627)),
        Location(name: "Temple Sensō", coordinate: CLLocationCoordinate2D(latitude: 35.713403, longitude: 139.795527)),
        Location(name: "Kuramae", coordinate: CLLocationCoordinate2D(latitude: 35.703212, longitude: 139.790939)),
        Location(name: "Palais Imperial", coordinate: CLLocationCoordinate2D(latitude: 35.683847, longitude: 139.750686)),
        Location(name: "Tokyo Skytree", coordinate: CLLocationCoordinate2D(latitude:  35.710054, longitude: 139.810714)),
        Location(name: "Musée National de Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.719045, longitude: 139.775968)),
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
             
            
            Map {
                
                ForEach(locations) { location in
                    Marker(location.name, coordinate: location.coordinate)
                }
            } .frame(height: 500)
            
            
          
            
            
            
        }
        
    }
}

#Preview {
    InterractivMap()
}
