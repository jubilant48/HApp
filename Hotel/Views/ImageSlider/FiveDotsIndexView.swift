//
//  FiveDotsIndexView.swift
//  Hotel
//
//  Created by macbook on 19.12.2023.
//

import SwiftUI

// MARK: - Constant

extension FiveDotsIndexView {
    struct Constant {
        let cornerRadius: CGFloat = 5
        let circleSize: CGFloat = 7
        let circleSpacing: CGFloat = 5
        
        let edgeInsets = EdgeInsets(top: -5, leading: -10, bottom: -5, trailing: -10)
    }
}

struct FiveDotsIndexView: View {
    // MARK: - Attributes
    
    var numberOfPages: Int
    let selectedTab: Int
    
    private let constant = Constant()
    
    private let primaryColor = Color.black
    private let secondaryColor = Color.black.opacity(0.22)
    private let thirdColor = Color.black.opacity(0.17)
    private let fourthColor = Color.black.opacity(0.10)
    private let fiveColor = Color.black.opacity(0.05)
    private let rectangelColor = Color.white
    
    var body: some View {
        
        HStack(spacing: constant.circleSpacing) {
            ForEach(0..<numberOfPages) { index in
                
                if shouldShowIndex(index) {
                    Circle()
                        .fill(getColor(for: index))
                        .frame(width: constant.circleSize,
                               height: constant.circleSize)
                }
                
            }
        }
        .background(
            Rectangle()
                .foregroundColor(rectangelColor)
                .cornerRadius(constant.cornerRadius)
                .padding(constant.edgeInsets)
        )
        
    }
    
    // MARK: - Methods
    
    func shouldShowIndex(_ index: Int) -> Bool {
        guard numberOfPages > 1 else { return false }
        
        return ((selectedTab - 4)...(selectedTab + 4)).contains(index)  
    }
    
    func getColor(for index: Int) -> Color {
        if selectedTab == index {
            return primaryColor
        } else if selectedTab > index || selectedTab < index {
            if selectedTab - 1 == index || selectedTab + 1 == index {
                return secondaryColor
            } else if selectedTab - 2 == index || selectedTab + 2 == index {
                return thirdColor
            } else if selectedTab - 3 == index || selectedTab + 3 == index {
                return fourthColor
            } else {
                return fiveColor
            }
        } else {
            return Color.clear
        }
    }
}
