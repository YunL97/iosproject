//
//  FruitModel.swift
//  Fruits
//
//  Created by 이윤식 on 2021/12/03.
//

//import Foundation
import SwiftUI

// MARK: - FRUIT DATA MODEL

struct Fruit: Identifiable { // Identifiable: 단순히 id 프로퍼티를 가지고 있는 형태 struct, class 정의할 때 id 값이 필요할 경우 채용 uuid 쓸때 사용
    var id = UUID() //유일키 생성
    var title : String
    var headline : String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
