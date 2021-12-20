//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by 이윤식 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    var settingModel = [[SettingModel]]()
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append([SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to yout iPhone", subTitle: "Set up icloud, the App Store, and more", rightImageName: "chevron.right")])
        
        settingModel.append([SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        //cell xib 가져오기
        let pronib = UINib(nibName: "ProfileCell", bundle: nil)//nib를 가져옴 xib를 바이너리화 한게 nib
        let menib = UINib(nibName: "MenuCell", bundle: nil)
         
        //table view에 cell 가져올 때 사용
        settingTableView.register(pronib, forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(menib, forCellReuseIdentifier: "MenuCell")
        makeData()
        
    
}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    // indexPath: 셀의 순서를 정해서 보여주는 함수, 순서적인 개념
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
             return cell
        }
        
                            //셀을 사용하는데 재사용하는 형태로 사용하겠다
       let cell =  tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! Menucell
        
        cell.leftImageView.image = UIImage(systemName:
                                            settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.middleTitle.text =
settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName:
                                            settingModel[indexPath.section][indexPath.row].rightImageName ?? "")

        
        
        
        return cell
    }
    
    //셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
    

}
