//
//  ContentView.swift
//  CarRentSwiftUI
//
//  Created by Nalin Porwal on 15/05/21.
//

import SwiftUI

struct ContentView: View {
   
    @State private var isDriver = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                UpperBody(isDriver: $isDriver)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< CarData.carArray.count) { index in
                            CarCard(carModel: CarData.carArray[index])
                                .frame(width: 380, height: 380, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                               
                            Spacer(minLength: 40)
                        }
                    }
                }
                BottomView()
            }.padding(10)
             .padding(.top, 30)
        }.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.0558475256, green: 0.06114148349, blue: 0.1033822671, alpha: 1)), Color(#colorLiteral(red: 0.1652879417, green: 0.1745034754, blue: 0.282112658, alpha: 1))]), startPoint: .topLeading, endPoint: .trailing))
            .edgesIgnoringSafeArea(.all)
            .coordinateSpace(name: "home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CarCard: View {
    @State private var isPresented = false
    var carModel: Car
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack(alignment: .topLeading) {
                    Color(carModel.bgColor)
                    LinearGradient(gradient: Gradient(colors: [Color(carModel.stripColor), Color(carModel.stripColor), Color(carModel.bgColor)]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 100, height: 380, alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.init(degrees: -45))
                
                    VStack(alignment: .leading) {
                        Text("LAMBORGINI")
                            .font(.custom(CustomFont.sFProText_Bold, size: 40, relativeTo: .title))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        Text("\(carModel.name.uppercased())")
                            .font(.custom(CustomFont.sFProText_SemiBold, size: 20, relativeTo: .title))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        Text("\(carModel.name.uppercased())")
                            .font(.custom(CustomFont.sFProText_SemiBold, size: 60, relativeTo: .title))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)))
                            .padding(.top, 20)
                    }.offset(x: 20.0, y: 30.0)
                
                }.cornerRadius(40)
          
                Image("\(carModel.name)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: -geo.frame(in: .named("Custom")).midX / 10, y: 50.0)
                    .offset(x: 20, y: 0)
            }.onTapGesture {
                isPresented.toggle()
            }.fullScreenCover(isPresented: $isPresented, content: {
                DetailView(scene: carModel.getScene())
            })
        }
    }
}
