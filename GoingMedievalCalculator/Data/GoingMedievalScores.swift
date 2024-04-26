//
//  GoingMedievalScores.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import Foundation

struct GoingMedievalScores: Codable {
    let spaciousness: [Item]
    let wealth: [Item]
    let aesthetic: [Item]
    let tierScore: [TierScore]
}

extension GoingMedievalScores {
    struct Item: Codable {
        let value: Double
        let multiplier: Double
    }
    
    struct TierScore: Codable {
        let tier: String
        let score: Double
    }
}

extension GoingMedievalScores {
    static var initData: GoingMedievalScores? {
        guard let path = Bundle.main.path(forResource: "Scores", ofType: "json") else {
            return nil
        }
        
        let url = URL(filePath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            return try decoder.decode(GoingMedievalScores.self, from: data)
        } catch {
            return nil
        }
    }
}
