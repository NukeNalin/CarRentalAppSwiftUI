//
//  BottomView.swift
//  CarRentSwiftUI
//
//  Created by Nalin Porwal on 15/05/21.
//

import Foundation
import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Dealers")
                .font(.custom(CustomFont.sFProText_SemiBold, size: 26, relativeTo: .title))
                .foregroundColor(.white)
            Spacer(minLength: 15)
            ForEach(0 ..< CarData.carRentService.count) { item in
                HStack {
                    Text("\(String(CarData.carRentService[item].first ?? "A"))")
                        .font(.custom(CustomFont.sFProText_Bold, size: 26, relativeTo: .title))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                        .background(Color(CarData.colorsArray[item]))
                        .cornerRadius(10)
                                        
                    VStack(alignment: .leading) {
                        Text("\(CarData.carRentService[item])")
                            .font(.custom(CustomFont.sFProText_Regular, size: 20, relativeTo: .title))
                            .foregroundColor(.white)
                        Text("\(Int.random(in: 1..<5)) Km away")
                            .font(.custom(CustomFont.sFProText_Light, size: 16, relativeTo: .title))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(10)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.08)))
                .cornerRadius(10)
                .padding(.bottom,8)
            }
        }
    }
}

