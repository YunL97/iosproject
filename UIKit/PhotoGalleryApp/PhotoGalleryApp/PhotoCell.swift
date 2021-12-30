//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by 이윤식 on 2021/12/29.
//

import UIKit
import PhotosUI


class PhotoCell : UICollectionViewCell {
    
    func loadImage(asset: PHAsset) {
        //PHImageManager: 이미지로 변형해서 가져오는 함수
        let imageManager = PHImageManager()
   
        let scale = UIScreen.main.scale
        
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        let options = PHImageRequestOptions()
        
        //.fastFormat: 저화질
        //.opportunistic: 오토로
        options.deliveryMode = .opportunistic
        
        //기존 이미지를 없애고 새로 넣는다
        self.photoImageView.image = nil
        
        //option nil 하면 처음 저화질 주고 그다음 고화질로 가져온다
        //
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
        
            //PHImageResultIsDegradedKey 0 일때 고화질 false
            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
                //저화질
                self.photoImageView.image = image
            }else{
                //고화질
                self.photoImageView.image = image

            }
            
            //사이즈를 작은거를 먼저 가져오고 원본을 그다음에 가져온다 그래서 2개씩 들어가짐
//            self.photoImageView.image = image
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!{
        didSet{
            photoImageView.contentMode = .scaleAspectFill
        }
    }
    
    
}
