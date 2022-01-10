//
//  ViewController.swift
//  Custom_RotateButton
//
//  Created by 이윤식 on 2022/01/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customButton: RotateButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //구현부
        customButton.selectTypeCallback = { upDownType in
            print(upDownType)
            if upDownType == .up {
                
            }
            
        }
      

        
        
        
        
// MARK: - 코드로 화면에 올리기


//        let myButton = RotateButton()
//
//        myButton.backgroundColor = .blue
//
//        self.view.addSubview(myButton)
//

//        //프레임올리는방법
//        myButton.translatesAutoresizingMaskIntoConstraints = true
//
//        myButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)

        
        
//        //오토레이아웃을 위한 코딩
//        //오토레이아웃 설정은 버튼을 뷰에 올리고 나서 해야함
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        
//       
//        
//        //가로
////        myButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        //세로
//        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        
//        
//        myButton.setTitle("my Custom button", for: .normal)
//        myButton.setImage(UIImage(systemName: "arrowtriangle.down"), for: .normal)
//        myButton.layer.cornerRadius = self.preferredContentSize.height
    }


}

