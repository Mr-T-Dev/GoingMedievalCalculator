//
//  TiersAndScoresView.swift
//  GoingMedievalCalculator
//
//  Created by Tiago Pereira on 26/4/24.
//

import SwiftUI

struct TiersAndScoresView: View {
    @State var sections: [TiersAndScoresSection] = []
    let itemSpaceColumn: CGFloat = 90
    let data: GoingMedievalScores
    
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
                                        Text(item.item)
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
        .onAppear(perform: {
            let adapter = TiersAndScoresAdapter(data: data)
            
            sections = adapter.sections
        })
    }
}

#Preview {
    TiersAndScoresView(data: .initData!)
}
