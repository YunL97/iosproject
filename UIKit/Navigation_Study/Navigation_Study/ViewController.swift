//
//  ViewController.swift
//  Navigation_Study
//
//  Created by 이윤식 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNaviTitleImage()
        makeRightAlarmButton()

        
        
    }
    
    //화면이 나올때마다 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeBackButton()
        navibackgroundDesign()
        

    }
    
    func makeRightAlarmButton() {
        let image = UIImage(systemName: "alarm.fill")?.withRenderingMode(.alwaysOriginal)
//        self.navigationItem.rightBarButtonItem
        
       let rightItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(rightItemClick))
        
        let image2 = UIImage(systemName: "alarm")?.withRenderingMode(.alwaysOriginal)
//        self.navigationItem.rightBarButtonItem
        
       let rightItem2 = UIBarButtonItem(image: image2, style: .done, target: self, action: #selector(rightItemClick2))
        
        //프로퍼티 간격 설정
        rightItem2.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
//        self.navigationItem.rightBarButtonItems = [rightItem,rightItem2]
        
        //---------------------------
        //커스텀
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(systemName: "alarm", withConfiguration: config)?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn1.addTarget(self, action: #selector(rightItemClick), for: .touchUpInside)
        
        let btn2 = UIButton()
        btn2.addTarget(self, action: #selector(rightItemClick), for: .touchUpInside)
        btn2.setImage(UIImage(systemName: "alarm")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [btn1,btn2])
        
        //방향설정
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .equalSpacing
        
     let customItem = UIBarButtonItem(customView: stackView)
    
        self.navigationItem.rightBarButtonItem = customItem
        
        
       
    }
    
    @objc func rightItemClick() {
        print("right")
//        guard  let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") else {
//            return
//        }
//        self.present(detailVC, animated: true)
        
    }
   
    @objc func rightItemClick2() {
        print("right")
        
        
    }
    
    func navibackgroundDesign() {
//        let apperance = UINavigationBarAppearance()
//        self.navigationController?.navigationBar.standardAppearance = apperance
////        그라데이션으로 나옴
//        self.navigationController?.navigationBar.scrollEdgeAppearance = apperance
//        self.navigationController?.navigationBar.backgroundColor = .blue
//
     
        
        //---------------------------
        
//        //status bar design  scene는 싱글톤 느낌으로 같이 사용가능
//        //scenedelegate 접근
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//
//        sceneDelegate?.statusBarView.backgroundColor = .red
//
//
//
//        let window = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
//
//
//        //윈도우에 올리면 다른 뷰컨트롤러에 가도 설정되어 있음
//        //한번만 해주면 됨
//        if let hasStatusBar = sceneDelegate?.statusBarView {
//        window?.addSubview(hasStatusBar)
////            self.view.addSubview(hasStatusBar)
//        }
//
//
        self.statusBar?.backgroundColor = .red
    }
    
    
    func makeBackButton() {
        self.navigationItem.backButtonTitle = "뒤로"
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        
        //네비게이션바 < 표시 접근
//        var backImage = UIImage(systemName: "backward.fill")
//        backImage = backImage?.withRenderingMode(.alwaysOriginal)
        
        //항상 원본으로 나오게 하는 코드
        //40 x 40 하면 120픽셀 x 120픽셀하면됨
//        var backImage = UIImage(named: "arrowR")?.withRenderingMode(.alwaysOriginal)
        
        guard  let backImage = UIImage(named: "blueCircleArrowR")?.withRenderingMode(.alwaysOriginal ) else {
            print("a1111111")
            return
        }
        
        //코드로 실제이미지 조절
        let newImage = resizeImage(image: backImage, newWidth: 20, newHeight: 20)
//
        //backIndicatorImage,backIndicatorTransitionMaskImage 두개다 설정해줘야지 이미지가 바뀐다
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.tintColor = .orange
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationItem.backButtonTitle = ""
    }
    
    //코드로 실제 이미지 조절
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight:CGFloat) ->UIImage {
        //--------------------------- 코딩으로 이미지 사이즈 줄이는법
        //큰이미지 설정하늡법
        let newWidth = newWidth
        let newHeight = newHeight
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        //빈도화지를 만든다
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        
          UIGraphicsEndImageContext()
        //---------------------------
        
        return newImage!
    }
    @objc func testAcction() {
        print("test")
    }
    
    func setNaviTitleImage() {
        //self.title = "메인화면"
//        self.navigationItem.title = "메인화면"
//        let logo = UIImageView(image: UIImage(named: "logoSample.jpg"))
//
//        logo.contentMode = .scaleToFill
//        logo.widthAnchor.constraint(equalToConstant: 120).isActive = true
//
//        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        navigationItem.titleView = logo

        
        let btn = UIButton()
        btn.setTitle("btn", for: .normal)
        btn.backgroundColor = .orange
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 90).isActive = true
        btn.addTarget(self, action: #selector(testAcction), for: .touchUpInside)
        self.navigationItem.titleView = btn
        
    }

}


