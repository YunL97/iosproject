//
//  FaceView.swift
//  FaceIt
//
//  Created by 이윤식 on 2022/02/08.
//

import UIKit

class FaceView: UIView {

    var scale: CGFloat = 0.90
 
    //bounds는 초기화중에 사용할 수 없기 때문에 이러게 함
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
    
    func pathForCircleCenteredAtPoint(midPoint: CGPoint, withRadius:CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: withRadius, startAngle: 0.0, endAngle: Double(2 * M_PI), clockwise: false)
        
        path.lineWidth = 5.0
        return path
    }
    
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
    
    private func pathForEye(eye: Eye) -> UIBezierPath {
        let eyeRadius = skullRadius / Ratios.SkullRadiusToEyeRadius
        let eyeCenter = getEyeCenter(eye: eye)
        return pathForCircleCenteredAtPoint(midPoint: eyeCenter, withRadius: eyeRadius)
    }
    
    override func draw(_ rect: CGRect) {
        
        
        
        UIColor.blue.set()
        pathForCircleCenteredAtPoint(midPoint: skullCenter, withRadius: skullRadius).stroke()
        pathForEye(eye: .Left).stroke()
        pathForEye(eye: .Right).stroke()
        
        
    }
    
    

}
