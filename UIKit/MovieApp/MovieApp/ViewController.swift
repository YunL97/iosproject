//
//  ViewController.swift
//  MovieApp
//
//  Created by 이윤식 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController{
    
    var movieModel: MovieModel?
    var term = ""
    var networkLayer = NetworkLayer()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //대리자 위임: 채택한 프로토콜을 준수해서 나대신 일을 수행할 대리자를 정함
        movieTableView.delegate = self
        movieTableView.dataSource = self
        searchBar.delegate = self
        requestMovieAPI2()
        
        
        
    }
    //{ image in cell.movieimageView.image = image}
    func loadImage2(urlString: String, completion: @escaping (UIImage?) -> Void){
        networkLayer.request(type: .justURL(urlString: urlString)) {  data, response, error in
            if let hasData = data {
                                DispatchQueue.main.async {
                                    //hadData를 통해서 data가 밖으로 나가기 때문에 @escaping 해줘야함
                                    completion(UIImage(data: hasData))
                                }
            
                            return
                            }
            //살패 했을때도 메모리를 계속 가지고 있기 때문에 실패했을때 nil을 넣어줘서 메모리를 해제 해줘야한다
            completion(nil)
        }
    }
    
    //이미지 값이 아닌 이미지가 들어있는 경로가 들어있기 떄문에 한번더 decode 해줘야함
//    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void){
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig)
//
//
//        //string 를 url로 변경
//        if let hasURL = URL(string: urlString){
//
//            var request = URLRequest(url: hasURL)
//            request.httpMethod = "GET"
//
//            //데이터 get 요청 해서 response로 받아온다
//            session.dataTask(with: request) { data, response, error in
//
//                //상태코드 ex: 200, 404 *****
//                print((response as! HTTPURLResponse).statusCode)
//
//
//                //여기서 탈출클로저 선언해주는 이유 @escaping 이유는
//                //클로저 안의 data 는 이 클로저 안에서만 있고 나가면 없어진다
//                //그런데 이loadImage 함수를 호출 했을 때 data를 밖에서도 사용하고
//                //싶기 때문에 @escaping을 사용한다
//                if let hasData = data {
//                    DispatchQueue.main.async {
//                        //hadData를 통해서 data가 밖으로 나가기 때문에 @escaping 해줘야함
//                        completion(UIImage(data: hasData))
//                    }
//
//                return
//                }
//            }.resume()
//            session.finishTasksAndInvalidate()
//        }
//        //살패 했을때도 메모리를 계속 가지고 있기 때문에 실패했을때 nil을 넣어줘서 메모리를 해제 해줘야한다
//        completion(nil)
//    }

    func requestMovieAPI2() {
        let term = URLQueryItem(name: "term", value: term)
        let media = URLQueryItem(name: "media", value: "movie")
        
        let querys = [term, media]
        networkLayer.request(type: .searchMovie(querys: querys)) { data, response, error in
            
            //data 가 있을때만 파싱(decoding)
            if let hasData = data {
                do{
                    
                    self.movieModel =  try  JSONDecoder().decode(MovieModel.self , from: hasData)
                    print(self.movieModel ?? "no data")
                    
                    self.movieModel?.results.sort{ $0.trackName ?? "" < $1.trackName ?? ""}
                    
                    DispatchQueue.main.async {
                        self.movieTableView.reloadData()
                    }
                    
                }catch{
                    print(error)
                }
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
        
    }
    
    //셀클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //셀 클릭했을때 검게 변하는거 다시 되돌아오게함
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailVC.movieResult =  self.movieModel?.results[indexPath.row]
        
        detailVC.modalPresentationStyle = .fullScreen
        
        present(detailVC, animated: true, completion: nil)
        
    }
    
    //셀 넣어주기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
//        print( cell.titleLabel.text)
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription

        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
        
        let price = self.movieModel?.results[indexPath.row].trackPrice?.description ?? ""
        cell.priceLabel.text = currency + price
        
        
        if let hasURL = self.movieModel?.results[indexPath.row].image {
                                    //여기서 이미지는 hasㅕ끼을 통해서 가져오는 이미지
            self.loadImage2(urlString: hasURL) { image in
                cell.movieimageView.image = image
            }
        }
        
        //dateString = "2016-10-10T07:00:00Z"
        if let dateString = self.movieModel?.results[indexPath.row].releaseDate {
        
        let formatter = ISO8601DateFormatter()
            if let isoDate = formatter.date(from: dateString){
                let myFormatter = DateFormatter()
                    myFormatter.dateFormat = "yyyy년 MM월 dd일"
                let dateString =  myFormatter.string(from: isoDate)
                
                cell.dateLabel.text = dateString
            }
        
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let hasText = searchBar.text else {
            return
        }
        term = hasText ?? ""
        requestMovieAPI2()
        self.view.endEditing(true)
    }
}
