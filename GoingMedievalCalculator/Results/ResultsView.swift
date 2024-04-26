//
//  InterpolationView.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import SwiftUI

struct ResultsView: View {
    let adapter: ResultsViewAdapter
    let calculator: ScoresCalculator
    
    init(
        data: GoingMedievalScores,
        space: String,
        wealth: String,
        aesthetic: String
    ) {
        self.calculator = .init(
            data: data,
            space: space,
            wealth: wealth, 
            aesthetic: aesthetic
        )
        self.adapter = .init(data: data, calculator: calculator)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack (alignment: .center, spacing: 10) {
                Text("Results")
                HStack(spacing: 20) {
                    VStack {
                        Text("Space Interpolation")
                        Text("\(calculator.spaceInterpolation, specifier: "%.2f")").padding(.bottom, 10)
                        
                        Text("Space multiplier")
                        Text("\(calculator.spaceLerp, specifier: "%.2f")")
                    }
                    VStack {
                        Text("Wealth Interpolation")
                        Text("\(calculator.wealthInterpolation, specifier: "%.2f")").padding(.bottom, 10)
                        
                        VStack {
                            Text("Wealth multiplier")
                            Text("\(calculator.wealthLerp, specifier: "%.2f")")
                        }
                    }
                    VStack {
                        Text("Aesthetic Interpolation")
                        Text("\(calculator.aestheticInterpolation, specifier: "%.2f")").padding(.bottom, 10)
                        
                        Text("Aesthetic multiplier")
                        Text("\(calculator.aestheticLerp, specifier: "%.2f")")
                    }
                }
                VStack(alignment: .center, spacing: 0) {
                    Text("Final Score")
                    Text("\(calculator.score, specifier: "%.2f")")
                    
                    Text(adapter.tierRoom)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top, 20)
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ResultsView(
        data: .initData!,
        space: "45",
        wealth: "0",
        aesthetic: "0"
    )
}
