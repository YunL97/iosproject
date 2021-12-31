//
//  ViewController.swift
//  MovieApp
//
//  Created by 이윤식 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController{
    
    var movieModel: MovieModel?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //대리자 위임: 채택한 프로토콜을 준수해서 나대신 일을 수행할 대리자를 정함
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        requestMovieAPI()
    }
 

    //nework, json 데이터 받아옴
    func requestMovieAPI(){
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "https://itunes.apple.com/search")
        
        let term = URLQueryItem(name: "term", value: "marvel")
        let media = URLQueryItem(name: "media", value: "movie")
    
        //https://itunes.apple.com/search?term=marvel&media=movie
        components?.queryItems = [term, media]
        
        guard let url = components?.url else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
       let task = session.dataTask(with: request) { data, response, error in
           
           //상태코드 ex: 200, 404 *****
           print((response as! HTTPURLResponse).statusCode)
        
           //data 가 있을때만 파싱(decoding)
           if let hasData = data {
               do{
                   
                   self.movieModel =  try  JSONDecoder().decode(MovieModel.self , from: hasData)
                   print(self.movieModel ?? "no data")
                   DispatchQueue.main.async {
                       self.movieTableView.reloadData()
                   }
                   
               }catch{
                   print(error)
               }
           }
       }
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
//        print( cell.titleLabel.text)
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription

        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        cell.priceLabel.text = currency + price
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
    }
    }
