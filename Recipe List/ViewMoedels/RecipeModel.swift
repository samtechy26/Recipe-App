//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Sam Tech on 3/7/22.
//

import Foundation


class RecipeModel: ObservableObject{
    @Published var recipes = [Recipe]()
    init(){
        
        
        self.recipes = DataService.getLocalData()
        
    }
}
