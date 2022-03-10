//
//  FeaturedRecipeView.swift
//  Recipe List
//
//  Created by Sam Tech on 3/10/22.
//

import SwiftUI

struct FeaturedRecipeView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var detailViewIsShowing = true
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top,40)
                
                .font(.largeTitle)
                
                
            GeometryReader{geo in
                
            TabView{
                ForEach(0..<model.recipes.count){ index in
                    if model.recipes[index].featured == true{
                        Button(action: {
                            self.detailViewIsShowing = true
                        }, label: {
                            
                            ZStack{Rectangle().foregroundColor(.white)
                                VStack{
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                        .padding(.bottom,10)
                                }
                            }
                        }).sheet(isPresented: $detailViewIsShowing, content: {
                            RecipeDetail(recipe: model.recipes[index])
                        })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5),radius: 10, x: -5, y: 5)

                        
                            
                    
                    }
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .bold()
                    .font(.subheadline)
                Text("1 hour")
                Text("Highlights")
                    .bold()
                    .font(.subheadline)
                Text("Healthy, Hearty")
            }.padding([.leading, .bottom])
            
        }
    }
}

struct FeaturedRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedRecipeView().environmentObject(RecipeModel())
    }
}
