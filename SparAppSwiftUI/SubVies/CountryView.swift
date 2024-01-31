//
//  CountryView.swift
//  SparAppSwiftUI
//
//  Created by Дмитрий Ерофеев on 30.01.2024.
//

import SwiftUI

struct CountryView: View {
    let countryName: String
    let flagImage: UIImage
    var body: some View {
        HStack {
            Image(uiImage: flagImage)
                .resizable()
                .frame(width: 50, height: 30)
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 0))
            Text(countryName)
                .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 0))
        }

    }
}

#Preview {
    CountryView(countryName: "Испания, Риоха", flagImage: UIImage(named: "ImageSpainFlag")!)
}
