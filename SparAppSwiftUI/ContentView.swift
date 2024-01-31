//
//  ContentView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            NavigationView(content: {
                NavigationLink(destination:
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
                                           ))
                {
                    Text("К карточке товара (нажать сюда)")
                       
                }
            })
            
            
            
            
            
            .tabItem {
                VStack {
                    Text("Главная")
                    Image("ImageSpar")
                        .renderingMode(.template)
                }
            }
            
            
            
            
            Text("Каталог")
                .tabItem {
                    Text("Каталог")
                    Image("ImageCatalog")
                        .renderingMode(.template)
                }
            Text("Корзина")
                .tabItem {
                    Text("Корзина")
                    Image("ImageShoppingCart")
                        .renderingMode(.template)
                }
            Text("Профиль")
                .tabItem {
                    Text("Профиль")
                    Image("ImageProfile")
                        .renderingMode(.template)
                }
        }
        .colorScheme(.light)
    }
}

#Preview {
    ContentView()
}
