//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by 이윤식 on 2021/12/27.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    var bottomButtonMargin: NSLayoutConstraint?
    
    var pageControl = UIPageControl()
    
    let startIndex = 0
    var currnetInex = 0 {
        didSet{
            pageControl.currentPage = currnetInex
        }
    }
    
    
    func makePageVC(){
        let itemVC1 =  OnBoardignViewController.init(nibName: "OnBoardignViewController", bundle: nil)
         itemVC1.mainText = "첫번째"
         itemVC1.subText = "11111"
         itemVC1.topImage = UIImage(named: "onboarding1")
        let itemVC2 =  OnBoardignViewController.init(nibName: "OnBoardignViewController", bundle: nil)
         itemVC2.mainText = "두번째"
         itemVC2.subText = "22222"
         itemVC2.topImage = UIImage(named: "onboarding2")

        let itemVC3 =  OnBoardignViewController.init(nibName: "OnBoardignViewController", bundle: nil)
         itemVC3.mainText = "세번째"
         itemVC3.subText = "33333"
         itemVC3.topImage = UIImage(named: "onboarding3")

         pages.append(itemVC1)
         pages.append(itemVC2)
         pages.append(itemVC3)
         
         //기본화면
         setViewControllers([itemVC1], direction: .forward, animated: false, completion: nil)
        
    
         self.dataSource = self
        self.delegate = self
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makePageVC()
        
        self.makeBottomButton()
        self.makePageControl()
        
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle(("확인"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        
        //버튼 이벤트 설정
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        //view에 추가
        self.view.addSubview(button)
        
        //오토레이아웃 설정하려면 이거를 false 해야함
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        //가운데 정렬
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        //왼쪽 앵커 0
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        // 오른쪽 앵커 0
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        //height 높이 equaltoConstant
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //하위 앵커 constant으로
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
        
        hideButton()
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        //선택한 점 컬러
        pageControl.currentPageIndicatorTintColor = .black
        //선택하지 않은 점 컬러
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        //점 눌러서 이동하는거 없앨 때 사용
//        pageControl.isUserInteractionEnabled = false
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
       
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currnetInex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        }else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        
        //***
        self.currnetInex = sender.currentPage
        
        buttonPresentationStyle()
       
    }
    
    @objc func dismissPageVC(){
        print("clickbutton")
        UserDefaults.standard.set(true, forKey: "gg")
        self.dismiss(animated: true, completion: nil)
    }

}

//현재 페이지 어디인지 알려주는 기능
extension OnBoardingPageViewController:UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("1")
        guard let currentVC = pageViewController.viewControllers?.first else {
            print("3")
            return
        }
        print("5")
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            print("4")
            return
        }
        self.currnetInex = currentIndex
        
        buttonPresentationStyle()
    }
    
    func buttonPresentationStyle() {
        if currnetInex == pages.count - 1 {
            //show button
            print("1")
            showButton()
            
        }else{
            print("2")
            //hide button
            hideButton()
         
        }
        
//        UIView.animate(withDuration: 0.5) {
        //view 레이아웃 즉시 업데이트
//            self.view.layoutIfNeeded()
//        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.allowAnimatedContent], animations: {
            self.view.layoutIfNeeded()
        },  completion: nil)
    }
    
    
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }

}

//현재페이지 기준 앞뒤 페이지 세팅
extension OnBoardingPageViewController:
    UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
//        self.currnetInex = currentIndex
        if currentIndex == 0 {
            return pages.last
        }else {
            return pages[currentIndex - 1]
            }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
    }
//        self.currnetInex = currentIndex

        if currentIndex == pages.count - 1 {
//            bottomButtonMargin?.constant = 0
            return pages.first
        }else {
//            bottomButtonMargin?.constant = 100
        return pages[currentIndex + 1]
        }
    
        }
}


