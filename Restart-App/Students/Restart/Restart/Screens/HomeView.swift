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

    
  
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 20){
            //MARK: - HEADER
            //MARK: - CENTER
            //MARK: - FOOTER
            Text("Home")
                .font(.largeTitle)
            Button(action: {
                //Some action
                isOnboardingViewActive = true
            }){
                Text("restart")
            }
        }
    }
}

//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

