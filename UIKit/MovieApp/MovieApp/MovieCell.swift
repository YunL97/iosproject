//
//  MovieCell.swift
//  MovieApp
//
//  Created by 이윤식 on 2021/12/31.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.font = .systemFont(ofSize: 13, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        }
    }
    @IBOutlet weak var priceLabel: UILabel!{
        didSet{
            priceLabel.font = .systemFont(ofSize: 14, weight: .bold)
        }
    }
    
    @IBOutlet weak var movieimageView: UIImageView!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
