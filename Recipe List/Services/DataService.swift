//
//  DataService.swift
//  Recipe List
//
//  Created by Sam Tech on 3/7/22.
//

import Foundation

class DataService{
    static func getLocalData()->[Recipe]{
        //parse local json file
        
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else{
            return [Recipe]()
        }
        //vreate a url object
        
        let url = URL(fileURLWithPath: pathString!)
        //create a data object
        
        do{ let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do{ let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData{
                    r.id = UUID()
                }
                return recipeData
            }
            catch{
                print(error)
            }
            
        }catch{
            print(error)
            
        }
        return [Recipe]()
        //decode the data with a JSON decoder
        //Add the unique ID's
        //Return the recipes
    }
    
}
