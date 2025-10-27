//
//  StampLoader.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import Foundation

struct TipsIcon: Codable, Identifiable {
    var id = UUID()
    let nom: String
    let icone : String
    
    private enum CodingKeys: String, CodingKey {
        case nom
        case icone
        
    }
    
    final class TipsLoader {
        
        static func loadTips() -> [TipsIcon] {
            
            print("yo")
            
            if let url = Bundle.main.url(forResource: "TipsButtons", withExtension: "json") {
                print("✅ Fichier JSON bien trouvé dans le bundle : \(url)")
            } else {
                print("❌ Fichier JSON NON trouvé dans le bundle")
            }
            
            guard let url = Bundle.main.url(forResource: "TipsButtons", withExtension: "json") else {
                print("❌ Erreur : impossible de trouver ta mère en slip dans le bundle.")
                return []
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let tips = try decoder.decode([TipsIcon].self, from: data)
                return tips
            } catch {
                print("⚠️ Erreur lors du chargement du JSON :", error)
                return []
            }
        }
    }
}
