//
//  ContentView.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var space: String = ""
    @State var wealth: String = ""
    @State var aesthetic: String = ""
    var data: GoingMedievalScores? = .initData
    
    var body: some View {
        if let data {
            ScrollView {
                TiersAndScoresView(data: data)
                    .padding(20)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 5){
                        Text("Space")
                        TextField("Total space", text: $space)
                    }
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Wealth")
                        TextField("Total wealth", text: $wealth)
                    }
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Aesthetic")
                        TextField("Total aesthetic", text: $aesthetic)
                    }
                }
                .padding()
                
                ThresholdsView(
                    data: data,
                    spaciousness: space,
                    wealth: wealth,
                    aesthetic: aesthetic
                )
                .padding(20)
                
                ResultsView(
                    data: data,
                    space: space,
                    wealth: wealth,
                    aesthetic: aesthetic
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
