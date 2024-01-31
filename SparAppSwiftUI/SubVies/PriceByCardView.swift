//
//  PriceView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 31.01.2024.
//

import SwiftUI

struct PriceByCardView: View {

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color("ColorAppGreen"))
                    .frame(width: 130, height: 30)
                
                Text("Цена по карте")
                    .foregroundColor(.white)
                
            }
            Spacer()
        }
    }
}
