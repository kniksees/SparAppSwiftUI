//
//  ProductView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 31.01.2024.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectedUnit = 0
    var selectedUnitLabel = ["Шт", "Кг"]
    
    let rating: String
    let reviewCount: Int
    let saleCount: Int
    let image: UIImage
    let productName: String
    let countryName: String
    let countryFlag: UIImage
    let description: String
    let сountryOfOriginNameText: String
    let energyValueText: String
    let fatsText: String
    let proteinsText: String
    let carbohydratesText: String
    let countOfReviews: Int = 152
    let reviewsList: [(String, String, Int, String)]
    let priceForOne: Double
    let priceForKilo: Double
    let isSale: Bool
    let oldPriceForOne: Double
    let oldPriceForKilo: Double
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                VStack {
                    VStack {
                        if isSale {
                            PriceByCardView()
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        }
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 300, height: 300)
                        HStack {
                            RatingView(rating: rating, reviewCount: reviewCount)
                            Spacer()
                            SaleView(saleCount: saleCount)
                        }
                        HStack {
                            Text(productName)
                                .font(.system(size: 30, weight: .bold))
                                .frame(width: 240)
                            Spacer()
                        }
                        HStack {
                            CountryView(countryName: countryName, flagImage: countryFlag)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        HStack {
                            Text("Описание")
                                .font(.system(size: 20, weight: .medium))
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        
                        HStack {
                            Text(description)
                                .lineLimit(nil)
                                .font(.system(size: 15))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                            
                            Spacer()
                        }
                        
                        
                        HStack {
                            Text("Основные характеристики")
                                .font(.system(size: 20, weight: .medium))
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                        DescriptionLineView(descriptionName: "Производство", descriptionText: сountryOfOriginNameText)
                        DescriptionLineView(descriptionName: "Энернетическая ценность, ккал/100 г", descriptionText: energyValueText)
                        DescriptionLineView(descriptionName: "Жиры", descriptionText: fatsText)
                        DescriptionLineView(descriptionName: "Белки", descriptionText: proteinsText)
                        DescriptionLineView(descriptionName: "Углеводы", descriptionText: carbohydratesText)
                        
                        HStack {
                            Button(action: {}, label: {
                                Text("Все характеристики")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.colorAppGreen)
                            })
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        
                        
                        HStack {
                            Text("Отзывы")
                                .font(.system(size: 23, weight: .medium))
                            Spacer()
                            Button(action: {}, label: {
                                Text("Все \(countOfReviews)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.colorAppGreen)
                            })
                        }
                    }
                    .padding(EdgeInsets(top: 0,
                                        leading: 20,
                                        bottom: 0,
                                        trailing: 20))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<reviewsList.count, id: \.self) {i in
                                ReviewCardView(reviewerName: reviewsList[i].0, date: reviewsList[i].1, countOfStars: reviewsList[i].2, reviewText: reviewsList[i].3)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0,
                                        leading: 10,
                                        bottom: 0,
                                        trailing: 0))
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                            Text("Оставить отзыв")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.colorAppGreen)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.colorAppGreen, lineWidth: 2)
                        )
                        .padding(EdgeInsets(top: 0,
                                            leading: 20,
                                            bottom: 0,
                                            trailing: 20))
                        .frame(height: 32)
                    })
                    
                    
                    
                    Spacer(minLength: 10)
                }
                .background(Color.white)
            }
            .background(Color("ColorAppGray"))
            
            
            
            
            ZStack {
                Rectangle()
                    .frame(height: 40)
                    .foregroundColor(.white)
                VStack {
                    Picker(selection: $selectedUnit) {
                        ForEach(0..<selectedUnitLabel.count, id: \.self) { i in
                            Text(selectedUnitLabel[i])
                        }
                    } label: {}
                        .pickerStyle(SegmentedPickerStyle())
                    if selectedUnit == 0 {
                        HStack {
                            VStack {
                                HStack {
                                    Text("\(String(priceForOne))")
                                        .font(.system(size: 30, weight: .bold))
//                                    Image("rublesForKilo")
//                                        .resizable()
//                                        .frame(width: 25, height: 25)
                                    RublesForOne()
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 0))
                                if isSale {
                                    HStack {
                                        Text("\(String(oldPriceForOne))")
                                            .foregroundColor(.gray)
                                            .strikethrough()
                                            .font(.system(size: 13))
                                        Spacer()
                                    }
                                }
                                
                            }
                            Spacer()
                            CountOfUnitsView(price: priceForOne)
                        }
                    } else if selectedUnit == 1 {
                        
                        HStack {
                            VStack {
                                HStack {
                                    Text("\(String(priceForKilo))")
                                        .font(.system(size: 30, weight: .bold))
//                                    Image("rublesForKilo")
//                                        .resizable()
//                                        .frame(width: 25, height: 25)
                                    RublesForKiloView()
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 0))
                                if isSale {
                                    HStack {
                                        Text("\(String(oldPriceForKilo))")
                                            .foregroundColor(.gray)
                                            .strikethrough()
                                            .font(.system(size: 13))
                                        Spacer()
                                    }
                                }
                                
                            }
                            Spacer()
                            CountOfKiloView(price: priceForKilo)
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 20,
                                    bottom: 0,
                                    trailing: 20))
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "doc.plaintext")
                    }
                    Button {
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    Button {
                    } label: {
                        Image(systemName: "heart")
                    }
                }
            }
        }
        
    }
}


#Preview {
    ProductView(rating: "4.1",
                reviewCount: 19,
                saleCount: 5,
                image: UIImage(named: "ImageLinden")!,
                productName: "Добавка \"Липа\" к чаю 200 г",
                countryName: "Испания, Риоха",
                countryFlag: UIImage(named: "ImageSpainFlag")!,
                description: "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.",
                сountryOfOriginNameText: "Россия, Краснодарский Край",
                energyValueText: "25 ккал, 105 кДж",
                fatsText: "0,1 г",
                proteinsText: "1,3 г",
                carbohydratesText: "3,3 г",
                reviewsList: [("Александр В.", "7 мая 2021", 4, "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                              ("Александр В.", "7 мая 2021", 4, "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                              ("Александр В.", "7 мая 2021", 4, "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")],
                priceForOne: 55.9,
                priceForKilo: 67.7,
                isSale: true,
                oldPriceForOne: 100.0,
                oldPriceForKilo: 110.0
    )
}
