//
//  ResultsViewAdapter.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import Foundation

struct ResultsViewAdapter {
    let data: GoingMedievalScores
    let calculator: ScoresCalculator
    
    init(data: GoingMedievalScores, calculator: ScoresCalculator) {
        self.data = data
        self.calculator = calculator
    }
}

extension ResultsViewAdapter {
    var tierRoom: String {
        data.tierScore.last(where: { $0.score < calculator.score })?.tier ?? data.tierScore[0].tier
    }
}
