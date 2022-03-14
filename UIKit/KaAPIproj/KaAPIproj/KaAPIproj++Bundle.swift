//
//  KaAPIproj++Bundle.swift
//  KaAPIproj
//
//  Created by 이윤식 on 2022/03/08.
//

import Foundation

extension Bundle {
    var apiKey: String{
        guard let file = self.path(forResource: "KakaoAPIinfo", ofType: "plist") else{return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else {return ""}
        
        guard let key = resource["API_KEY"] as? String else {fatalError("KakaoAPIinfo.plist 에 API_KEY 설정을 해주세요")}
        return key
    }
}
