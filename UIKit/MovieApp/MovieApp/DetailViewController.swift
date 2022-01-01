//
//  DetailViewController.swift
//  MovieApp
//
//  Created by 이윤식 on 2022/01/01.
//

import UIKit

class DetailViewController: UIViewController {

    var movieModel: MovieModel?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
