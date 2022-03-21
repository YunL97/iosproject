//
//  ViewController.swift
//  FirebaseRESTAPI
//
//  Created by 이윤식 on 2022/03/15.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    lazy var rootRef = Database.database().reference()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let itemRef = rootRef.child("list")
                itemRef.setValue("가나다")
    }


}

