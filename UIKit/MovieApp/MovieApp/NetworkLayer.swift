//
//  NetworkLaayer.swift
//  MovieApp
//
//  Created by 이윤식 on 2022/01/03.
//

import Foundation


enum MovieAPIType {
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum MovieAPIError: Error {
    case badURL
}

class NetworkLayer {
    //only url
    //url + param
    
    typealias NetworkCompletion = (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> Void
    
    func request(type: MovieAPIType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do{
            let request = try buildRequest(type: type)

            //데이터 get 요청 해서 response로 받아온다
            session.dataTask(with: request) { data, response, error in
               
                //상태코드 ex: 200, 404 *****
                print((response as! HTTPURLResponse).statusCode)
                
                completion(data, response, error)
                
            }.resume()
            session.finishTasksAndInvalidate()
        }
        catch{
            //try에서 실패하면 catch문으로 들어감
            //에러에 MovieAPIError throw가 들어감
            print(error)
        }

            
        }
    

    //return 하기전에 throws 상황 (ex: URLRrquest가 nil 인상황)
private func buildRequest(type: MovieAPIType) throws -> URLRequest {
    switch type {
    
        //string 를 url로 변경
    case .justURL(urlString: let urlString):
        
        //값을 가져오지 못했을 떄 throw 상황
        guard let hasURL = URL(string: urlString) else {
            throw MovieAPIError.badURL
        }
        var request = URLRequest(url: hasURL)
        request.httpMethod = "GET"
        return request
        
    case .searchMovie(querys: let querys):
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = querys
        
        guard let hasurl = components?.url  else {
            throw MovieAPIError.badURL
        }
        
            var request = URLRequest(url: hasurl)
            request.httpMethod = "GET"
            return request
        }
    }
}


