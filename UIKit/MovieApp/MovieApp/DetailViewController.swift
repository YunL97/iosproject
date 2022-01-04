//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 이윤식 on 2022/01/01.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

//    var movieModel: MovieModel?
    //배열 안하는 이유는 cell이아니고 하나의 스토리보드 파일만 보여주기 때문
    var movieResult: MovieResult?
//    {
//        didSet { //값을 넣었을 때
//            titleLabel.text = movieResult?.trackName
//            descriptionLabel.text = movieResult?.longDescription
//        }
//    }
    
    var player:AVPlayer?
//
    @IBOutlet weak var MovieContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont.systemFont(ofSize: 24,weight: .medium)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 24,weight: .light)
        }
    }
    
    //viewDidLoad는 디바이스 크기를 가져오지 못함
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movieResult?.trackName
                  descriptionLabel.text = movieResult?.longDescription
        // Do any additional setup after loading the view.
        
//        if let hasURL = movieResult?.previewUrl {
//            makePlaterAndPlay(urlString: hasURL)
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl {
            makePlaterAndPlay(urlString: hasURL)
        }
    }
    
    
    
    func makePlaterAndPlay(urlString: String) {
        
            if let hasurl = URL(string: urlString) {
        
                self.player = AVPlayer(url: hasurl)
            //player은 재생능력만 있음 playerLayer는 틀을 잡고있다
            let playerLayer = AVPlayerLayer(player: player)
         
            //layer는 오토레이아웃 설정이 불가능함
            MovieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = MovieContainer.bounds
            
                self.player?.play()
        }
    }
    
    @IBAction func play(_ sender: Any) {

        self.player?.play()


    }
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
