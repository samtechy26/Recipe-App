//
//  RecipeTabView.swift
//  Recipe List
//
//  Created by Sam Tech on 3/9/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            FeaturedRecipeView().tabItem{
                VStack{
                    Text("Featured")
                    Image(systemName: "star.fill")
                }
            }
            RecipeListView().tabItem{
                VStack{
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
            
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
