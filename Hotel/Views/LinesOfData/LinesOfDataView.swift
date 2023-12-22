//
//  LinesOfDataView.swift
//  Hotel
//
//  Created by macbook on 20.12.2023.
//

import SwiftUI

struct LinesOfDataView<Content: View>: View {
    // MARK: - Attributes
    
    var lines: [LineOfData]
    let aligment: Aligment
    var content: Content
    
    private let font = FontFamily.SFProDisplay.regular
    private let textColor = Asset.Colors._000000Ffffff.swiftUIColor
    
    var body: some View {
        VStack {
            ForEach(lines, id: \.self) { line in
                switch aligment {
                case .left:
                    LinesOfDataViewMethods().lineOfData(line: line)
                case .right:
                    LinesOfDataViewMethods().lineOfData(line: line,
                                                        lastColor: textColor,
                                                        lastFont: font)
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
    private let font = FontFamily.SFProDisplay.regular
    private let nameTextColor = Asset.Colors._828796.swiftUIColor
    
    func lineOfData(line: LineOfData) -> some View {
        LazyVGrid(columns: [GridItem(.fixed(150), spacing: 16, alignment: .topLeading), GridItem(alignment: .topLeading)]) {
            Text(line.name)
                .font(.custom(font, size: 16))
                .foregroundColor(nameTextColor)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            Text(line.data)
                .font(.custom(font, size: 16))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
    }
    
    func lineOfData(line: LineOfData, lastColor: Color? = nil, lastFont: FontConvertible) -> some View {
        LazyVGrid(columns: [GridItem(.fixed(150), spacing: 16, alignment: .topLeading), GridItem(alignment: .trailing)]) {
            Text(line.name)
                .font(.custom(font, size: 16))
                .foregroundColor(nameTextColor)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        
            Text(line.data)
                .font(.custom(lastFont, size: 16))
                .foregroundColor(lastColor)
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
        }
    }
}

// MARK: - Preview

struct LinesOfData_Previews: PreviewProvider {
    static var previews: some View {
        LinesOfDataView(lines: [
            LineOfData(name: "Вылет из", data: "Москва"),
            LineOfData(name: "Страна, город", data: "Египет, Хургада"),
            LineOfData(name: "Даты", data: "19.09.2023 - 27.09.2023"),
            LineOfData(name: "Кол-во ночей", data: "7 ночей"),
            LineOfData(name: "Отель", data: "Лучший пятизвёздочный отель в Хургаде, Египет"),
            LineOfData(name: "Номер", data: "Люкс номер с видом на море"),
            LineOfData(name: "Питание", data: "Все включено")
        ]) { }
    }
}
