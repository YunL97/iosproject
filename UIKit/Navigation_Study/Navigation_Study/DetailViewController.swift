//
//  DetaikViewController.swift
//  Navigation_Study
//
//  Created by 이윤식 on 2022/01/10.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.navigationBar.backgroundColor = .yellow
        
        
        
        self.statusBar?.backgroundColor = .yellow
    }
    
}

extension UIViewController {
    var statusBar: UIView? {
        //status bar design  scene는 싱글톤 느낌으로 같이 사용가능
        //scenedelegate 접근
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        
        let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
        
        
        //윈도우에 올리면 다른 뷰컨트롤러에 가도 설정되어 있음
        //한번만 해주면 됨
        if let hasStatusBar = sceneDelegate?.statusBarView {
        window?.addSubview(hasStatusBar)
//            self.view.addSubview(hasStatusBar)
        }
        return sceneDelegate?.statusBarView
    
    }
}
