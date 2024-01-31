//
//  ReviewCardView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 31.01.2024.
//

import SwiftUI

struct ReviewCardView: View {
    let reviewerName: String
    let date: String
    let countOfStars: Int
    let reviewText: String
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))

                .foregroundColor(.white)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 6)
            VStack {
                HStack {
                    Text(reviewerName)
                        .font(.system(size: 14, weight: .bold))
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0))
                HStack {
                    Text(date)
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .medium))
                    Spacer()
                }
                HStack {
                    ForEach(0..<countOfStars, id: \.self) {_ in
                        Image("ImageStar")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -5))
                    }
                    ForEach(countOfStars..<5, id: \.self) {_ in
                        Image("ImageStarGray")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -5))
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: -3, leading: 0, bottom: 0, trailing: 0))
                
                Text(reviewText)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .font(.system(size: 13))
                Spacer(minLength: 0)
                
                
            }
            .padding(EdgeInsets(top: 12, leading: 10, bottom: 10, trailing: 10))
        }
        .frame(width: 220, height: 140)


    }
}

#Preview {
    ReviewCardView(reviewerName: "Александр В.", date: "7 мая 2021", countOfStars: 4, reviewText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
}
