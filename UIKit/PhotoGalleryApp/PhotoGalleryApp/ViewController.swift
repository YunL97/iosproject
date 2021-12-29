//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by 이윤식 on 2021/12/28.
//

import UIKit
import PhotosUI


class ViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "PhotoGalleryApp"
        
        makeNavigationItem()
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 0.5, height: 200)
        
        //가로 방향 사이값 지정
        layout.minimumInteritemSpacing = 1
        //세로방향 사이값 지정
        layout.minimumLineSpacing = 1
        photoCollectionView.collectionViewLayout = layout
        

        photoCollectionView.dataSource = self
        
        
        //xib로 셀 가져오는법, 그래도 크기는 설정 안되네
        //photocell 이 xib 가 없고 mainstoryboard 안에 들어 있기 때문에 굳이 안가져 와도 된다
//        let cell2 = UINib(nibName: "PhotoCell2", bundle: nil)
//        photoCollectionView.register(cell2, forCellWithReuseIdentifier: "PhotoCell2")
        
        
    }

    
    
    func makeNavigationItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.rightBarButtonItem = photoItem
//        self.navigationController?.navigationBar.backgroundColor = .red
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        
        
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    //@objc: 런타임때 실행된다는 표시 오브젝트 c 사용
    //갤러리 사용가능 한지 물어보는 함수
    @objc func checkPermission() {
        // .authorized: 승인됐다, .denied: 거부, .limited: 선택한 몇개, .notDetermined: 아예 물어보지 않은 상태, .restructed: 특정한 상황이 생겨서 권한이 없어진 상태
       if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
           //허용된 상태
           DispatchQueue.main.async {
               self.showGallery()
           }
       }else if PHPhotoLibrary.authorizationStatus() == .denied{
           DispatchQueue.main.async {
               self.showAuthorizationAlert()
           }
       } else if PHPhotoLibrary.authorizationStatus() == .notDetermined{
           //notdetermined: 물어보지 않은 상태
           //info.plist에서 설정
           PHPhotoLibrary.requestAuthorization { status in
               //클로저 상태안에서 호출하면 쓰레드가 하나 생기는데 이쓰레드에서 checkPermission 호출하면 오류가 난다 그래서 dispatchqueue.main.async로 해야된다
               self.checkPermission()
           }
            
       }
    }
    
    func showAuthorizationAlert() {
        //허용안된 상태
        //alert 띄우기
        let alert = UIAlertController(title: "포토라이브러리 접근 권한을 활성화해주세요.", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            
            //갤러리 접근 권한이 없으면 내 앱에대한 설정으로 이동 코드
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            //열릴수 있나
            if  UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showGallery() {
        //shared(): 싱글톤
        let library = PHPhotoLibrary.shared()
        var configuration = PHPickerConfiguration(photoLibrary: library)
        
        //0: 무제한
        configuration.selectionLimit = 10
        
        var picker = PHPickerViewController(configuration: configuration)
    
        //viewController 에서 일어나는게 아닌 photoLibrary에서 하기때문에 여기에 해줘야함
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @objc func refresh() {
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
//        cell.photoImageView.image = xxxxx
        return cell
    }
    
    
}
extension ViewController: PHPickerViewControllerDelegate {
    
    //갤러리에서 add 눌렀을때 실행
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
//        results.map(\.assetIdentifier)
        
        let identifiers = results.map{$0.assetIdentifier ?? ""}
          
       let fetchAssets =  PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        fetchAssets.enumerateObjects{ asset, index, stop in
            
            //PHImageManager: 이미지로 변형해서 가져오는 함수
            let imageManager = PHImageManager()
       
            imageManager.requestimage
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

