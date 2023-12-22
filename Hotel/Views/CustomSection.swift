//
//  CustomSection.swift
//  Hotel
//
//  Created by macbook on 22.12.2023.
//

import SwiftUI

struct CustomSection<Content: View>: View {
    // MARK: - Attributes
    
    var content: Content
    
    private let color = Asset.Colors.ffffff212121.swiftUIColor
    private let radius: CGFloat = 15
    
    var body: some View {
        Section {
            content
        }
        .background(color)
        .cornerRadius(radius)
    }
    
    // MARK: - Init
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

// MARK: - Preview

struct CustomSection_Previews: PreviewProvider {
    static var previews: some View {
        CustomSection() { }
    }
}
