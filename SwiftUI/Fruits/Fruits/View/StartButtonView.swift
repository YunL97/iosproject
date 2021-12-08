//
//  StartButtonView.swift
//  Fruits
//
//  Created by 이윤식 on 2021/11/30.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            isOnboarding = false
            withAnimation(.easeOut(duration: 0.5)){
                isAnimating = true
            }
        }){
            HStack(spacing: 8) {
                Text("Stsrt")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(Image.Scale.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 2)
                
            )
            
        }//: Button
        .accentColor(.orange)
        .scaleEffect(isAnimating ? 1.0 : 0.5)
        
        
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            
    }
}
