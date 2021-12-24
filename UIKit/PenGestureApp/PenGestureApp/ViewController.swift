//
//  ViewController.swift
//  PenGestureApp
//
//  Created by 이윤식 on 2021/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        let myView = DraggbleView()
        
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.backgroundColor = .red
        
        self.view.addSubview(myView)
    }


}

