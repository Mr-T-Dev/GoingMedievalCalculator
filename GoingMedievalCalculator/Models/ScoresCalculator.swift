//
//  ThresholdCalculator.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import Foundation

struct ScoresCalculator {
    let data: GoingMedievalScores
    let space: String
    let wealth: String
    let aesthetic: String
    
    init(data: GoingMedievalScores, space: String, wealth: String, aesthetic: String) {
        self.data = data
        self.space = space
        self.wealth = wealth
        self.aesthetic = aesthetic
    }
}

// MARK: Thresholds section
extension ScoresCalculator {
    var spaceResult: ThresholdResult {
        buildResult(list: data.spaciousness, value: space)
    }
    
    var wealthResult: ThresholdResult {
        buildResult(list: data.wealth, value: wealth)
    }
    
    var aestheticResult: ThresholdResult {
        buildResult(list: data.aesthetic, value: aesthetic)
    }
    
    private func getMin(list: [GoingMedievalScores.Item], value: Double) -> GoingMedievalScores.Item? {
        list.last(where: { $0.value < value }) ?? list.first
    }
    
    private func getMax(list: [GoingMedievalScores.Item], value: Double) -> GoingMedievalScores.Item? {
        list.first(where: { $0.value > value }) ?? list.last
    }
    
    private func buildResult(list: [GoingMedievalScores.Item], value: String) -> ThresholdResult {
        guard let casted = Double(value) else {
            return .init(value: 0, minimumThreshold: 0, minimumMult: 0, maximumThreshold: 0, maximumMult: 0)
        }
        
        if let same = list.first(where: { $0.value == casted }) {
            return .init(
                value: casted,
                minimumThreshold: same.value,
                minimumMult: same.multiplier,
                maximumThreshold: same.value,
                maximumMult: same.multiplier
            )
        }
        
        let min = getMin(list: list, value: casted)
        let max = getMax(list: list, value: casted)
        
        return .init(
            value: casted,
            minimumThreshold: min?.value ?? 0,
            minimumMult: min?.multiplier ?? 0,
            maximumThreshold: max?.value ?? 0,
            maximumMult: max?.multiplier ?? 0
        )
    }
}

// MARK: Interpolation section
extension ScoresCalculator {
    var spaceInterpolation: Double {
        interpolation(result: spaceResult)
    }

    var wealthInterpolation: Double {
        interpolation(result: wealthResult)
    }
    
    var aestheticInterpolation: Double {
        interpolation(result: aestheticResult)
    }
    
    func interpolation(result: ThresholdResult) -> Double {
        if result.maximumThreshold == result.minimumThreshold {
            return result.maximumThreshold
        }
        
        return (result.value - result.minimumThreshold) / (result.maximumThreshold - result.minimumThreshold)
    }
}

// MARK: Lerp section
extension ScoresCalculator {
    var spaceLerp: Double {
        lerp(result: spaceResult, interpolation: spaceInterpolation)
    }

    var wealthLerp: Double {
        lerp(result: wealthResult, interpolation: wealthInterpolation)
    }
    
    var aestheticLerp: Double {
        lerp(result: aestheticResult, interpolation: aestheticInterpolation)
    }
    
    func lerp(result: ThresholdResult, interpolation: Double) -> Double {
        if result.maximumMult == result.minimumMult {
            return result.maximumMult
        }
        
        return result.minimumMult + (result.maximumMult - result.minimumMult) * interpolation
    }
}

// MARK: Final score
extension ScoresCalculator {
    var score: Double {
        spaceLerp*wealthLerp*aestheticLerp
    }
}
