//
//  UpperView.swift
//  CarRentSwiftUI
//
//  Created by Nalin Porwal on 15/05/21.
//

import Foundation
import SwiftUI

struct UpperBody: View {
    @Binding var isDriver:Bool
    var body: some View {
        IconHeader()
        Spacer(minLength: 40)
        Text("Choose a Car")
            .font(.custom(CustomFont.sFProText_SemiBold, size: 28, relativeTo: .title))
            .foregroundColor(.white)
        Spacer(minLength: 10)
        HStack{
            Text("With a driver")
                .font(.custom(CustomFont.sFProText_Light, size: 18, relativeTo: .title))
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $isDriver)
        }
    }
}



struct IconHeader: View {
    var body: some View {
        HStack{
            IconView(imageName: "bell")
            Spacer()
            IconView(imageName: "magnifyingglass")
            IconView(imageName: "gear")
        }
    }
}

struct IconView: View {
    var imageName: String

    var body: some View {
        ZStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.white)
                .padding(3)
        }.frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
            .background(Color(#colorLiteral(red: 0.9996392131, green: 1, blue: 0.9997561574, alpha: 0.1)))
            .cornerRadius(10)
    }
}
