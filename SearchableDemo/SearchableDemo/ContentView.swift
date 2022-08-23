//
//  ContentView.swift
//  SearchableDemo
//
//  Created by lidongxi on 2022/8/23.
//

import SwiftUI

// 从List列表中进行搜索 iOS15以上
struct ContentView: View {
    
    private var foods = ["Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread","Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread","Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread","Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread","Chicken Chop", "Fish n Chip", "Fried Noodle", "Fried Rice", "Bread"]
    
    @State private var searchFood = ""
    
    var searchResults: [String] {
        return searchFood.isEmpty ? foods : foods.filter { $0.contains(searchFood) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { food in
                    Text(food)
                }
            }
            .navigationBarTitle(Text("Foods"))
//            .searchable(text: $searchFood) // 默认隐藏,下拉显示,跟app系统设置类似
//            .searchable(text: $searchFood, placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always))
//            .searchable(text: $searchFood, placement: SearchFieldPlacement.toolbar) //滚动时隐藏Searchable
            .searchable(text: $searchFood, prompt: Text("Search food")) { //prompt: 设置占位符
                
                // 如果为空,则显示列表
                // 默认搜索时候显示列表,进入搜索模式时显示他们而不显示所有列表
//                Text("Chicken Chop").searchCompletion("Chicken Chop")
//                Text("Fish n Chip").searchCompletion("Fish n Chip")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
