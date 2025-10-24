//
//  StampLoader.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import Foundation

struct Stamp: Codable, Identifiable {
    var id = UUID()
    let imageName: String
    let isLocked: Bool
    let location: String
    
    private enum CodingKeys: String, CodingKey {
        case imageName
        case isLocked
        case location
        
    }
    
    final class StampLoader {
        
        static func loadStamps() -> [Stamp] {
            
            if let url = Bundle.main.url(forResource: "CollectionsData", withExtension: "json") {
                print("✅ Fichier JSON trouvé dans le bundle : \(url)")
            } else {
                print("❌ Fichier JSON NON trouvé dans le bundle")
            }
            
            
            
            
            
            
            
            guard let url = Bundle.main.url(forResource: "CollectionsData", withExtension: "json") else {
                print("❌ Erreur : impossible de trouver ta mère en slip dans le bundle.")
                return []
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let stamps = try decoder.decode([Stamp].self, from: data)
                return stamps
            } catch {
                print("⚠️ Erreur lors du chargement du JSON :", error)
                return []
            }
        }
    }
}
