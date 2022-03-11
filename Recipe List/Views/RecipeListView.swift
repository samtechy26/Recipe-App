//
//  ContentView.swift
//  Recipe List
//
//  Created by Sam Tech on 3/7/22.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Text("All Recipes").bold()
                    
                    .padding(.top,40)
                
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment: .leading){
                        
                        ForEach(model.recipes){
                            r in
                            NavigationLink(destination: RecipeDetail(recipe: r), label: {
                                HStack(spacing: 20.0){
                                    Image(r.image).resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment:.center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading) {
                                        Text(r.name).foregroundColor(.black)
                                        RecipeHighlights(highlights: r.highlights)
                                    }.foregroundColor(.black)
                                }
                            })
                            
                        }
                    }
                }
                
            }.padding(.leading)
            
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
