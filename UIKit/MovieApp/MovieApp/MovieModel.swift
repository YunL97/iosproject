//
//  MovieModel.swift
//  MovieApp
//
//  Created by 이윤식 on 2021/12/31.
//

import Foundation


//키를 안써놓으면 다른 벨류들은 가져올 수 없음
struct MovieModel: Codable {
    let resultCount: Int
    var results: [MovieResult]
}

struct MovieResult: Codable {
    let trackName: String?
    let previewUrl: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?

    
//    //artworkUrl100 대신 image를 쓰고 싶으면 enum문을 통해서 정의해 줘야한다. 다른 프로퍼티 까지 같이해줘야함.
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
        
    }
}

