//
//  GeneralViewController.swift
//  Setting_Clone_App
//
//  Created by 이윤식 on 2021/12/21.
//

import UIKit

//테이블 위에 cell이 올려져 있기 때문에 register이 필요없음
class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet {
            rightImageView.image = UIImage.init(systemName: "chevron.right")
        }
    }
    @IBOutlet weak var leftLabel: UILabel!
}

struct GeneralModel {
    var leftTitle = ""
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = [[GeneralModel]]()
    
    //row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        
        return cell
    }
    

    @IBOutlet weak var generalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        self.view.backgroundColor =  UIColor(white: 245/255, alpha: 1)
        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        // Do any additional setup after loading the view.
        
        model.append([GeneralModel(leftTitle: "About")])
        
        model.append([GeneralModel(leftTitle: "ketboard"),
        GeneralModel(leftTitle: "Game Controller"),
        GeneralModel(leftTitle: "Fonts"),
        GeneralModel(leftTitle: "Language & Region"),
        GeneralModel(leftTitle: "Dictionary")]
        )
        model.append([GeneralModel(leftTitle: "Reset")])
        
        model.append([GeneralModel(leftTitle: "Reset")])
        
    }
    



}
