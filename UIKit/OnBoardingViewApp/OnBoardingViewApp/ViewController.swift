//
//  ViewController.swift
//  onBoardingViewApp
//
//  Created by 이윤식 on 2022/01/03.
//

import UIKit

class ViewController: UIViewController {

    

   
    //var didShowOnboardingView = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.object(forKey: "kk") == nil {
            UserDefaults.standard.set(false, forKey: "kk")
            
        }
    }
       
    
    
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
            //didShowOnboardingView == false
        
   
        
        var user = UserDefaults.standard.bool(forKey: "kk")
        print(user)
        if user == false {
        let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            
        //전체화면
        pageVC.modalPresentationStyle = .fullScreen
        self.present(pageVC, animated: true, completion: nil)
//            didShowOnboardingView = true
            
        }
}
}
    
