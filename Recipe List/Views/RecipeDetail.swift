//
//  RecipeDetail.swift
//  Recipe List
//
//  Created by Sam Tech on 3/7/22.
//

import SwiftUI

struct RecipeDetail: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                //MARK: Recipe Image
                
                Image(recipe.image).resizable()
                    .scaledToFill()
                
                //MARK: Recipe Name
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                 
                //MARK: Setting the picker
                VStack(alignment: .leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                Picker("", selection:$selectedServingSize){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.font(Font.custom("Avenir", size: 15))
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width:160)
                }.padding()
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients){
                        item in
                        Text("•" + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServing: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal, 10.0)
                Divider()
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id:\.self){ index in
                        Text(String(index + 1) + "." + recipe.directions[index]).font(Font.custom("Avenir", size: 15))
                        
                    }
                }
                .padding(.horizontal, 10.0)
            }
            
        }
        
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe and pass it into the detail view to have a preview
        let model = RecipeModel()
        RecipeDetail(recipe: model.recipes[0])
    }
}

