//
//  SaleView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 30.01.2024.
//

import SwiftUI

struct SaleView: View {
    let saleCount: Int

    var body: some View {
        ZStack {
            Image("ImageSale")
                .resizable()
                .frame(width: 55, height: 32)
            Text("-\(saleCount)%")
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .bold))
                .padding(EdgeInsets(top: 5,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))
            
        }

    }
}

#Preview {
    SaleView(saleCount: 5)
}
