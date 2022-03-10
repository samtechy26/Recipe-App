//
//  Recipes.swift
//  Recipe List
//
//  Created by Sam Tech on 3/7/22.
//

import Foundation

class Recipe: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredients]
    var directions:[String]
    
    
}

class Ingredients: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
