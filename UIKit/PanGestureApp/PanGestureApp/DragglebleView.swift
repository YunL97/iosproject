//
//  DragglebleView.swift
//  PenGestureApp
//
//  Created by 이윤식 on 2021/12/24.
//

import UIKit

class DraggbleView: UIView {
    
    var dragType = DragType.none

    //직접 코드로 인스턴스를 만드는 경우 실행
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging(pan:)));
       
        self.addGestureRecognizer(pan) //뷰가 펜 드레그 가능하게된다
        
    }
    
    //스토리보드나 xib 같이 인터페이스 빌더로 만들때
    required init?(coder: NSCoder) {
        
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging(pan:)));
       
        self.addGestureRecognizer(pan) //뷰가 펜 드레그 가능하게된다
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
//        print(dragType)
        //pan.state: 상태
        switch pan.state {
        case .began:  //눌르는 순간
              print("begen")  //움직일떄
            
        case .changed:
            
            //view가 얼만큼 움직였는가, 현재손가락으로 드래그 해서 끌어온 위치의 벡터를 나타낸다
            //손사락을 빠르게 멀리 움직이면 translation 값 증가
            let delta =  pan.translation(in: self.superview)
            //뷰 센터 좌표
            var myPostion = self.center

            if dragType == .x {
                myPostion.x += delta.x
            }else if dragType == .y {
                myPostion.y += delta.y
            }else {
                myPostion.x += delta.x
                myPostion.y += delta.y

            }
            
            self.center = myPostion
            
            //CGPoint.zero를 하는이유, 0,0을 호출해서UIPanGestureRecognizer 에게 새로운 드래그 동작을 시작할 것임을 알기위해
            pan.setTranslation(CGPoint.zero, in: self.superview)
//            print(self.frame.origin.x)
        case .ended, .cancelled:
            print("ended cancelled")
            
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            if let hasSuperView = self.superview {
            if self.frame.maxX > hasSuperView.frame.maxX {
                    
                self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
            
        default:
            break
        }
        
        
    }
}
