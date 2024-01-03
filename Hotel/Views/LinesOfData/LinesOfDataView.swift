//
//  LinesOfDataView.swift
//  Hotel
//
//  Created by macbook on 20.12.2023.
//

import SwiftUI

// MARK: - Constant

extension LinesOfDataView {
    struct Constant {
        let fontRegular = GeneralConstatnt.fontRegular
        let textColor = Asset.Colors._000000Ffffff.swiftUIColor
    }
}

struct LinesOfDataView<Content: View>: View {
    // MARK: - Attributes
    
    var lines: [LineOfData]
    let aligment: Aligment
    var content: Content
    
    private let constant = Constant()
    
    var body: some View {
        VStack {
            ForEach(lines, id: \.self) { line in
                switch aligment {
                case .left:
                    LinesOfDataViewMethods().lineOfData(line: line)
                case .right:
                    LinesOfDataViewMethods().lineOfData(line: line,
                                                        lastColor: constant.textColor,
                                                        lastFont: constant.fontRegular)
                }
            }
            
            content
        }
    }
    
    // MARK: - Init
    
    init(lines: [LineOfData], aligment: Aligment = .left, @ViewBuilder content: () -> Content) {
        self.lines = lines
        self.aligment = aligment
        self.content = content()
    }
}

// MARK: - Aligment

extension LinesOfDataView {
    enum Aligment {
        case left
        case right
    }
}

// MARK: - Methods

struct LinesOfDataViewMethods {
    struct Constant {
        let fontRegular = GeneralConstatnt.fontRegular
        let fontRegularSize: CGFloat = 16
        
        let nameTextColor = Asset.Colors._828796.swiftUIColor
        
        let columnsOne = [GridItem(.fixed(150), spacing: 16, alignment: .topLeading), GridItem(alignment: .topLeading)]
        let columnsTwo = [GridItem(.fixed(150), spacing: 16, alignment: .topLeading), GridItem(alignment: .trailing)]
        
        let lineLimit = 2
    }
    
    private let constant = Constant()
    
    func lineOfData(line: LineOfData) -> some View {
        LazyVGrid(columns: constant.columnsOne) {
            Text(line.name)
                .font(
                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                )
                .foregroundColor(constant.nameTextColor)
                .lineLimit(constant.lineLimit)
                .multilineTextAlignment(.leading)
            
            Text(line.data)
                .font(
                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                )
                .lineLimit(constant.lineLimit)
                .multilineTextAlignment(.leading)
        }
    }
    
    func lineOfData(line: LineOfData, lastColor: Color? = nil, lastFont: FontConvertible) -> some View {
        LazyVGrid(columns: constant.columnsTwo) {
            Text(line.name)
                .font(
                    .custom(constant.fontRegular, size: constant.fontRegularSize)
                )
                .foregroundColor(constant.nameTextColor)
                .lineLimit(constant.lineLimit)
                .multilineTextAlignment(.leading)
        
            Text(line.data)
                .font(
                    .custom(lastFont, size: constant.fontRegularSize)
                )
                .foregroundColor(lastColor)
                .lineLimit(constant.lineLimit)
                .multilineTextAlignment(.trailing)
        }
    }
}
