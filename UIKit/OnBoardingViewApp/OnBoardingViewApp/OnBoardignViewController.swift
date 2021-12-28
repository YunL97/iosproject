//
//  OnBoardignViewController.swift
//  OnBoardingViewApp
//
//  Created by 이윤식 on 2021/12/27.
//

import UIKit

class OnBoardignViewController: UIViewController {

    var mainText = ""
    var subText = ""
    var topImage:UIImage? = UIImage()
    
    
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel!{
        didSet{
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        topImageView.image = topImage
        descriptionLabel.text = subText
        // Do any additional setup after loading the view.
    }




}
