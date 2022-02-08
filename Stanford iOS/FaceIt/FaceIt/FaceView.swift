//
//  FaceView.swift
//  FaceIt
//
//  Created by 이윤식 on 2022/02/08.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.90
 
    //기울기 완전찡그림 -1 , 웃음 1
    var mouthCurvature: Double = 1.0
    //bounds는 초기화중에 사용할 수 없기 때문에 이러게 함
    //상위 뷰에서 위치 시키기 떄문에 상위뷰에서 설정한 좌표를 가져와야함
    var skullRadius:CGFloat{
           return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    var skullCenter: CGPoint{
            return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    
    
    private struct Ratios {
        static let SkullRadiusToEyeOffset: CGFloat = 3
        static let SkullRadiusToEyeRadius: CGFloat = 10
        static let SkullRadiusToMouthWidth: CGFloat = 1
        static let SkullRadiusToMouthHeight: CGFloat = 3
        static let SkullRadiusToMouthOffset: CGFloat = 3

    }
    
    enum Eye {
        case Left
        case Right
    }
    
    //원그리기
    func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius:CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: withRadius, startAngle: 0.0, endAngle: Double(2 * M_PI), clockwise: false)
        
        path.lineWidth = 5.0
        return path
    }
    
    //눈 좌표
    private func getEyeCenter(eye: Eye) -> CGPoint {
        let eyeOffset = skullRadius / Ratios.SkullRadiusToEyeOffset
        
        var eyeCenter = skullCenter
        eyeCenter.y -= eyeOffset
        switch eye {
        case .Left: eyeCenter.x += eyeOffset
        case .Right: eyeCenter.x -= eyeOffset
        }
        return eyeCenter
    }
    //눈그리기
    private func pathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye: eye)
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
    }
    
    //입그리기
    private func pathForMouth() -> UIBezierPath {
        let mouthWidth = skullRadius / Ratios.SkullRadiusToMouthWidth
        let mouthHeight = skullRadius / Ratios.SkullRadiusToMouthHeight
        let mouthOffset = skullRadius / Ratios.SkullRadiusToMouthOffset
        
        let mouthRect = CGRect(x: skullCenter.x - mouthWidth / 2, y: skullCenter.y + mouthOffset, width: mouthWidth, height: mouthHeight)
        
        
        
        let smileOffset = CGFloat(max(-1 , min(mouthCurvature, 1))) * mouthRect.height
        let start = CGPoint(x: mouthRect.minX, y: mouthRect.minY)
        let end = CGPoint(x: mouthRect.maxX, y: mouthRect.minY)
        
        // 1/3 지점
        let cp1 = CGPoint(x: mouthRect.minX + mouthRect.width / 3, y: mouthRect.minY + smileOffset)
        let cp2 = CGPoint(x: mouthRect.maxX - mouthRect.width / 3, y: mouthRect.minY + smileOffset)
       
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = 5.0
        
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        
        
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
        pathForMouth().stroke()
        
        
    }
    
    

}
