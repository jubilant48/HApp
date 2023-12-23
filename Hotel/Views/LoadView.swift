//
//  LoadView.swift
//  Hotel
//
//  Created by macbook on 23.12.2023.
//

import SwiftUI

struct LoadView: View {
    // MARK: - Attributes
    
    var body: some View {
        VStack {
            ProgressView("Загрузка")
        }
    }
}

// MARK: - Prieview

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
