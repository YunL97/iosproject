//
//  ViewController.swift
//  PanGestureApp
//
//  Created by 이윤식 on 2021/12/25..
//

import UIKit

enum DragType{
    case x
    case y
    case none
}


class ViewController: UIViewController {

    let myView = DraggbleView()
    var dragType = DragType.none

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
                
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        myView.dragType = .x
        myView.backgroundColor = .red
        
                    //자식뷰
        self.view.addSubview(myView)
    }

    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("x")
            dragType = .x
            
        case 1:
            print("y")
            dragType = .y
            
        case 2:
            print("xy")
            dragType = .none
        
        default:
            break
        }
        
        myView.dragType = self.dragType
        print("aa \(myView.dragType.self)")
        
    }
    }
    



