//
//  CustomScrollView.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

struct CustomScrollView<Content: View>: View {
    // MARK: - Attributes
    
    var title: String
    var content: Content
    
    private let backgroundColor = Asset.Colors.ffffff000000.color
    private let contentBackgroundColor = Asset.Colors.f6f6f9424242.swiftUIColor
        
    var body: some View {
            ScrollView(showsIndicators: false) {
                content
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(uiColor: backgroundColor), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(contentBackgroundColor)
            .onAppear {
                UIToolbar.appearance().backgroundColor = backgroundColor
                UIToolbar.appearance().isTranslucent = false
            }
    }
    
    // MARK: - Init
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
}

