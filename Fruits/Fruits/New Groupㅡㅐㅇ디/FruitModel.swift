//
//  FruitModel.swift
//  Fruits
//
//  Created by 이윤식 on 2021/12/03.
//

//import Foundation
import SwiftUI

// MARK: - FRUIT DATA MODEL

struct Fruit: Identifiable {
    var id = UUID() //유일키 생성
    var title : String
    var headline : String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
