//
//  AlbumLoader.swift
//  AFPApp
//
//  Created by Apprenant145 on 24/10/2025.
//

//
//  StampLoader.swift
//  AFPApp
//
//  Created by Apprenant145 on 23/10/2025.
//

import Foundation

struct ScrapBook: Codable, Identifiable {
    var id = UUID()
    let imageName: String
    let name : String
   
    
    private enum CodingKeys: String, CodingKey {
        case imageName
        case name
        
    }
    
    final class ScrapBookLoader {
        
        static func loadScrapbook() -> [ScrapBook] {
            
            if let url = Bundle.main.url(forResource: "ScrapBook", withExtension: "json") {
                print("✅ Fichier JSON trouvé dans le bundle : \(url)")
            } else {
                print("❌ Fichier JSON NON trouvé dans le bundle")
            }
            
            guard let url = Bundle.main.url(forResource: "ScrapBook", withExtension: "json") else {
                print("❌ Erreur : impossible de trouver ta mère en slip dans le bundle.")
                return []
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let stamps = try decoder.decode([ScrapBook].self, from: data)
                return stamps
            } catch {
                print("⚠️ Erreur lors du chargement du JSON :", error)
                return []
            }
        }
    }
}
