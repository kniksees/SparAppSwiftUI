//
//  RatingView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 30.01.2024.
//

import SwiftUI

struct RatingView: View {
    let rating: String
    let reviewCount: Int
    var body: some View {
        HStack {
            Image("ImageStar")
                .resizable()
                .frame(width: 32, height: 32)
            Text("4.1")
            Rectangle()
                .frame(width: 1, height: 16)
            Text("\(reviewCount) отзывов")
                .foregroundColor(.gray)
            
        }

    }
}

#Preview {
    RatingView(rating: "4.1", reviewCount: 19)
}
