//
//  ThresholderAdapter.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import Foundation


struct ThresholdAdapter {
    private let data: GoingMedievalScores
    let calculator: ScoresCalculator
    
    init(
        data: GoingMedievalScores,
        calculator: ScoresCalculator
    ) {
        self.data = data
        self.calculator = calculator
    }
    
    var sections: [ThresholdSection] {
        [space, wealth, aesthetic]
    }
    
    private var space: ThresholdSection {
        .init(
            title: "Spaciousness",
            items: buildItems(for: calculator.spaceResult)
        )
    }
    
    private var wealth: ThresholdSection {
        .init(
            title: "Wealth",
            items: buildItems(for: calculator.wealthResult)
        )
    }
    
    private var aesthetic: ThresholdSection {
        .init(
            title: "Aesthetic",
            items: buildItems(for: calculator.aestheticResult)
        )
    }
    
    private func buildItems(for result: ThresholdResult) -> [ThresholdItem] {
        [
            .init(title: "Lower threshold", value: "\(result.minimumThreshold)"),
            .init(title: "Lower mult", value: "\(result.minimumMult)"),
            .init(title: "Higher threshold", value: "\(result.maximumThreshold)"),
            .init(title: "Higher mult", value: "\(result.maximumMult)")
        ]
    }
}


struct ThresholdSection: Hashable, Identifiable {
    var title: String
    var items: [ThresholdItem]
    
    var id: String { title }
}


struct ThresholdItem: Hashable, Identifiable {
    var title: String
    var value: String
    
    var id: String { title }
}
