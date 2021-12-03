//
//  FruitCardView.swift
//  Fruits
//
//  Created by 이윤식 on 2021/11/30.
//

import SwiftUI

struct FruitCardView: View {
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                //FRUIT: IMAGE
                Image("blueberry")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.95), radius: 8, x: 6,y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.1)
                     
                //FRUIT: TITLE
                Text("Blueberry")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(Font.Weight.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.95), radius: 8, x: 2,y: 2)
                    
                //FRUIT: HEADLINE
                Text("Blueberries are sweet, nutritious and wildly popular fruit all over the world")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                
                //BUTTON: START
                StartButtonView()
                    .scaleEffect(isAnimating ? 1.0 : 0.1)
            } //: VSTACK
        }//: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.9)){
                isAnimating = true // false 에서 true가 0.9초 걸쳐서 일어난다
            }
                }
    
        .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"),Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}


// MARK: - PREVIEW
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView()
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
