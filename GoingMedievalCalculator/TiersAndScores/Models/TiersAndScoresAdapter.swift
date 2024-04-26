//
//  TiersAndScoresAdapter.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import Foundation

struct TiersAndScoresAdapter {
    let data: GoingMedievalScores
    
    init(data: GoingMedievalScores) {
        self.data = data
    }
    
    var sections: [TiersAndScoresSection] {
        return [
            tiers,
            space,
            wealth,
            aesthetic
        ]
    }
    
    private var tiers: TiersAndScoresSection {
        .init(
            title: "Tiers",
            items: data.tierScore.map { tier -> TiersAndScoresSectionItem in
                    .init(item: tier.tier, value: "\(tier.score)")
            })
    }
    
    private var space: TiersAndScoresSection {
        .init(
            title: "Spaciousness",
            items: data.spaciousness.map { item -> TiersAndScoresSectionItem in
                    .init(item: "\(item.value)", value: "\(item.multiplier)")
            })
    }
    
    private var wealth: TiersAndScoresSection {
        .init(
            title: "Wealth",
            items: data.wealth.map { item -> TiersAndScoresSectionItem in
                    .init(item: "\(item.value)", value: "\(item.multiplier)")
            })
    }
    
    private var aesthetic: TiersAndScoresSection {
        .init(
            title: "Aesthetic",
            items: data.aesthetic.map { item -> TiersAndScoresSectionItem in
                    .init(item: "\(item.value)", value: "\(item.multiplier)")
            })
    }
}


struct TiersAndScoresSection: Hashable, Identifiable {
    var title: String
    var items: [TiersAndScoresSectionItem]
    
    var id: String { title }
}


struct TiersAndScoresSectionItem: Hashable, Identifiable {
    var item: String
    var value: String
    
    var id: String { item }
}
