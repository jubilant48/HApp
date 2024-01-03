//
//  PeculiaritiesView.swift
//  Hotel
//
//  Created by macbook on 18.12.2023.
//

import SwiftUI
import SwiftUIFlowLayout

struct TagsView: View {
    // MARK: - Attributes
    
    var tags: [String]
    
    var body: some View {
        FlowLayout(mode: .scrollable, items: tags) { tag in
            TagView(tag)
        }
    }
    
    // MARK: - Init
    
    init(_ tags: [String]) {
        self.tags = tags
    }
}
