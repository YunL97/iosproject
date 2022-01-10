//
//  RotateButton.swift
//  Custom_RotateButton
//
//  Created by 이윤식 on 2022/01/08.
//

import UIKit

enum RotateType {
    case up
    case down
}

//class MyButton {
//
//    //convenence: init 값이 들어오지 않으면 임의 값이 설정
//    convenience init() {
//        self.init(frame: CGRect.zero)
//    }
//
//    init(frame: CGRect){
//
//    }
//}
//
//class CustomButton: MyButton {
//
//    //부모 init도 정의해줘야함 여기선 convenience 안됨, override 하면 가능
//     init() {
//
//        super.init(frame: .zero)
//    }
//
//}


class RotateButton: UIButton {
    
    //버튼호출됐을 때 무조건 실행 되게 하기
    //일반코드로 실행했을때 실행됨
    init() {
        super.init(frame: .zero)
        configure()

    }
    
    //xib 연결되었을 때 실행
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        configure()
    }
    
    var isUp = RotateType.down {
        didSet {
            changeDesign()
        }
    }
    
    //이벤트 클로저
//    var selectCallback = { (a:Bool) in }
    //위와같음
//    var selectTypeCallback:(Bool) -> Void = { _ in }
    var selectTypeCallback:((RotateType) -> Void)?

    
    //init 에 들어가기 때문에 전역
    private func configure() {
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    //외부에서 접근할 일이 없어서 private
    @objc private func selectButton() {
        if isUp == .up {
            isUp = .down
        }else {
            isUp = .up
        }
        selectTypeCallback?(isUp)
    }
    
    
    
    private func changeDesign() {
        
        DispatchQueue.main.async {
        UIView.animate(withDuration: 0.3) {
            if self.isUp == .up{
                //이미지 돌리기
                self.imageView?.transform = CGAffineTransform(rotationAngle: -179 * CGFloat.pi / 180)
                
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
            }else {
                //원래상태로 돌아간다
                self.imageView?.transform = .identity
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }

        }
        }
    }

}

