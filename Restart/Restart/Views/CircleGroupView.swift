//
//  CircleGroupView.swift
//  Restart
//
//  Created by 이윤식 on 2021/11/14.
//

import SwiftUI
import UIKit
struct CircleGroupView: View {
    
    @State var ShapeColor:Color
    @State var ShapeOpacity:Double
    @State private var isAnimaging: Bool = false
    
    var body: some View {
        ZStack{
                    Circle()
                        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                        .frame(width: 260, height: 260, alignment: .center)
                    Circle()
                        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                        .frame(width: 260, height: 260, alignment: .center)
            
        }//: ZSTACK.
        .blur(radius: isAnimaging ? 0 : 10) //흐림 흐림 10 에서 0이 될때까지 3초걸린다
        .opacity(isAnimaging ? 1 : 1) //불투명
        .scaleEffect(isAnimaging ? 1 : 0.5)  //크기
        .animation(.easeOut(duration: 3), value: isAnimaging)
        .onAppear(perform: {
            isAnimaging = true // false가 true로 바뀔때 3초동안 바뀐다
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}

//----------




