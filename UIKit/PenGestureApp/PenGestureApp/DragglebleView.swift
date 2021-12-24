//
//  DragglebleView.swift
//  PenGestureApp
//
//  Created by 이윤식 on 2021/12/24.
//

import UIKit

class DraggbleView: UIView {
    
    
    init() {
        
        super.init(frame: CGRect.zero)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging(pan:)));
       
        self.addGestureRecognizer(pan) //뷰가 펜 드레그 가능하게된다
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        print("aa")
        
        //pan.state: 상태
        switch pan.state {
        case .began:  //눌르는 순간
              print("begen")  //움직일떄
            
        case .changed:
            let delta =  pan.translation(in: self.superview) //절대좌표
            var myPostion = self.center
            
            myPostion.x += delta.x
            myPostion.y += delta.y
            
            self.center = myPostion
                                                //부모뷰
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            print("ended cancelled")
            
        default:
            break
        }
    }
}
