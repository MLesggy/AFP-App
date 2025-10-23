import Foundation

struct Stamp: Codable, Identifiable {
    var id = UUID()
    let imageName: String
    let isLocked: Bool
    
    private enum CodingKeys: String, CodingKey {
        case imageName
        case isLocked
    }
}

final class StampLoader {
    
    static func loadStamps() -> [Stamp] {
        
        let fileName = "CollectionsData" // attention au nom exact de ton JSON
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            print("✅ Fichier JSON trouvé dans le bundle : \(url)")
        } else {
            print("❌ Fichier JSON NON trouvé dans le bundle")
        }
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("❌ Erreur : impossible de trouver le fichier JSON dans le bundle.")
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
