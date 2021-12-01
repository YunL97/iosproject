//
//  StartButtonView.swift
//  Fruits
//
//  Created by 이윤식 on 2021/11/30.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            print("Exit the onboarding")
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
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
