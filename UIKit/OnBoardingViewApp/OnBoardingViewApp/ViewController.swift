//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by 이윤식 on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    

    

   
    //var didShowOnboardingView = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.object(forKey: "ff") == nil {
            UserDefaults.standard.set(false, forKey: "ff")
            
        }
    }
       
    
    
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
            //didShowOnboardingView == false
        
   
        
        var user = UserDefaults.standard.bool(forKey: "ff")
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
    

