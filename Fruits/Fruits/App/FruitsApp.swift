//
//  FruitsApp.swift
//  Fruits
//
//  Created by 이윤식 on 2021/11/30.
//

import SwiftUI

@main
struct FruitsApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else {
                ContentView()
            }
            
        }
    }
}


