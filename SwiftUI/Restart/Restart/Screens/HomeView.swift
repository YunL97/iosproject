//
//  HomeView.swift
//  Restart
//
//  Created by 이윤식 on 2021/11/11.
//

import SwiftUI

struct HomeView: View {
    //MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    
  
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 20){
            //MARK: - HEADER
            
            Spacer()
            
            ZStack {
                
                CircleGroupView(ShapeColor: .blue, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 :  -35)
                .animation(
                            .easeInOut(duration: 4)
                            .repeatForever()
                            ,value: isAnimating
                )
                
            }
            
            //MARK: - CENTER
            
            Text("the time that leads to mastery is dependent on the intensity of focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - FOOTER
            
            Spacer()
            
            

            Button(action: {
                //Some action
                withAnimation{
                isOnboardingViewActive = true
                    playSound(sound: "success", type: "m4a")
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
            }//: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {//지연이 발생되게 하려면 메인쓰레드를 사용해야한다. 메인스레드나 백그라운드 스레드에서 실행 o
                isAnimating = true
                
            
            })
        })
    }
}

//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
 
