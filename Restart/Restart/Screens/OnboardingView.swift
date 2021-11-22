//
//  OnboardingView.swift
//  Restart
//
//  Created by 이윤식 on 2021/11/11.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    @State private var size21: CGFloat = 8
    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(edges: .all)
            VStack(spacing:20){
            //MARK: - HEADER
            Spacer()
                ZStack{
                VStack(spacing:0){
                    Text("Share.")
                            .font(.system(size: 60))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        
                    Text("""
                        It`s not now much we give but
                    how much love we put into giving
                    """)
                        .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,10)
                }
                }
            
            //MARK: - CENTER
            
            ZStack{
//                ZStack{
//                    Circle()
//                        .stroke(.white.opacity(0.2), lineWidth: 40)
//                        .frame(width: 260, height: 260, alignment: .center)
//                    Circle()
//                        .stroke(.white.opacity(0.2), lineWidth: 80)
//                        .frame(width: 260, height: 260, alignment: .center)
//                }//: ZSTACK
                
                CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                Image("character-1")
                    .resizable()
                    .scaledToFit()
            }//: CENTER
            
            Spacer()
            
            //MARK: - FOOTER
            
            ZStack{
                //PARTS OF THE CUSTOM BUTTON
                
                //1. 정적배경
                Capsule()
                    .fill(Color.white.opacity(0.2))
                
                Capsule()
                    .fill(Color.white.opacity(0.2))
                    .padding(8)
                
                //2. 간단한 클릭 유도 텍스
                
                Text("Get Started")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x:20)
                //3. 캡슐모양, 사용자 드래그하면 모양너비 변
                
                HStack{
                    Capsule()
                        .fill(Color("ColorRed"))
                        .frame(width: buttonOffset + 80)
                    
                    Spacer()
                }
                //4. 쉐브론 기호가 있는 원모양의 실제 드래그
                
                
                HStack {
                    ZStack{
                    Circle()
                            .fill(Color("ColorRed"))
                        Circle()
                            .fill(.black.opacity(0.15))
                            .padding(size21)
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .foregroundColor(.white)
                .frame(width: 80,alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged{gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {//왼쪽에서 오른쪽으로만 이동 허용
                        
                               buttonOffset = gesture.translation.width
                               size21 += 0.1
                            }
                        }
                        .onEnded{ _ in
                            if buttonOffset > buttonWidth / 2 {
                                buttonOffset = buttonWidth - 80
                                isOnboardingViewActive = false
                            }else{
                                buttonOffset = 0//중간에 멈추면 처음으로
                            }
                            size21 = 8
                        }
                ) //: GESTURE
                    Spacer()
                }//:HSTACK
            }//: FOOTER
            .frame( width:buttonWidth,height:80, alignment: .center)
            .padding()
            
            
            
//            //VStack(spacing: 20)
//                {
//                Text("Onboarding")
//                    .font(.largeTitle)
//
//                Button(action: {
//                    //Some Action
//                    isOnboardingViewActive = false
//                }){
//                    Text("Start")
//                }
//            }
        } //:VSTACK
    }
}
                   }

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
