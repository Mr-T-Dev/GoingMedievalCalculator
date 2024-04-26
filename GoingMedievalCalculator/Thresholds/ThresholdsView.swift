//
//  ThresholdsView.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import SwiftUI

struct ThresholdsView: View {
    var sections: [ThresholdSection]
    
    let itemSpaceColumn: CGFloat = 120
    
    init(
        data: GoingMedievalScores,
        spaciousness: String,
        wealth: String,
        aesthetic: String
    ) {
        
        let adapter = ThresholdAdapter(
            data: data,
            calculator: .init(
                data: data,
                space: spaciousness,
                wealth: wealth,
                aesthetic: aesthetic
            )
        )
        
        sections = adapter.sections
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(sections) { section in
                    VStack(alignment: .center, spacing: 5) {
                        Text(section.title)
                            .padding(.bottom, 10)
                        ForEach(section.items) { item in
                            VStack(alignment: .leading) {
                                HStack(spacing: 30) {
                                    HStack {
                                        Text(item.title)
                                        Spacer()
                                    }.frame(width: itemSpaceColumn)
                                    
                                    Text(item.value)
                                }
                                .padding(.horizontal, 5)
                                
                                Rectangle().frame(height: 1)
                                    .foregroundStyle(Color.gray.opacity(0.2))
                            }
                        }
                        Spacer()
                    }
                    .background(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color.white)
                    })
                }
            }
        }
    }
}

#Preview {
    ThresholdsView(
        data: .initData!,
        spaciousness: "45",
        wealth: "0",
        aesthetic: "0"
    )
}
