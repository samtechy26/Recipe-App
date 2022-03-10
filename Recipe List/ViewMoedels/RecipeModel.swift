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
    
    static func getPortion(ingredient:Ingredients, recipeServing:Int, targetServing:Int)->String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortion = 0
        
        if ingredient.num != nil {
        // Get a single serving size by multiplying denominator by the recipe servings
        denominator *= recipeServing
        //Get a target portion by multiplying numerator by target servings
        numerator *= targetServing
        //Reduce fraction by greatest common divider
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
        //Get the whole portion if numerator > denominator
            if numerator >= denominator{
                
                //calculated the whole portion and the remainder
                wholePortion = numerator/denominator
                numerator = numerator % denominator
                //Assign to portion string
                portion += String(wholePortion)
            }
            if numerator > 0{
        
        //Express the remainder as a fraction
                portion += wholePortion > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        if var unit = ingredient.unit{
           
            
            if wholePortion > 1 {
            //calculate appropriate suffix
            if unit.suffix(2) == "ch"{
                unit += "es"
            }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else{
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        return portion
    }
}
