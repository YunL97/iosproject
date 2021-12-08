//
//  ContentView.swift
//  Fruits
//
//  Created by 이윤식 on 2021/11/30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)){
                        FruitRowView(fruit: item)
                            .padding(.vertical, 5)
                        
                    }
                    
                }
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
        
    }
}
