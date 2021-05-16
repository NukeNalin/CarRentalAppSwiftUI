//
//  Car.swift
//  CarRentSwiftUI
//
//  Created by Nalin Porwal on 15/05/21.
//

import Foundation
import UIKit
import SceneKit
struct Car {
    let name: String
    let bgColor: UIColor
    let stripColor: UIColor
    let price: Int
    let scale: SCNVector3
    
    func getScene() -> CarModel {
        CarModel(name, scale)
    }
}


struct CarData {
    static var carArray: [Car] = [.init(name: "urus", bgColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), stripColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), price: 14000, scale: .init(0.035, 0.035, 0.035)),
                                  .init(name: "aventador", bgColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), stripColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), price: 14000, scale: .init(0.05, 0.05, 0.05)),
                                  
                                  .init(name: "Red Aventador", bgColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), stripColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), price: 14000, scale: .init(0.05, 0.05, 0.05))
    ]
    
    static var carRentService = ["Ocean Car Retal Service","BBT Cars","Luxury Toys","Porwal's Cars"]
    static var colorsArray = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)]
}
