//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var F1season = SeasonModel()

    
    var body: some View {
        
        ZStack {
            CustomColors.overallBackground
                .edgesIgnoringSafeArea(.all)
            ScrollView (showsIndicators: false) {
                VStack{
                Image("LogoAMGPetronas")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260)
                    .padding(.bottom, 16)
                
                    
                    ForEach (F1season.seasons) { s in
                     
                        ZStack {
                           
                        ZStack (alignment: .leading){
                        
                        HStack (spacing: 0){
                        RoundedCornersLeft()
                                .foregroundColor(.white)
                                .frame(width: 132)
                                .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                            ZStack{
                            RoundedCornersRight()
                                    .fill(CustomColors.cardBackground)
                                    .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                            VStack {
                                Text(s.name)
                                    .font(.customFontTitle)
                                    .foregroundColor(CustomColors.cardText)
                                    
                                Text("\(s.season) season")
                                    .font(.customFontBody)
                                    .foregroundColor(CustomColors.cardText)
                            }
                            }
                                
                                .frame(width: 198)
                        }
                        .frame(height: 95)
                        
                            
                            Image("\(s.season) \(s.name)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 132, height: 95)
                                .clipShape(RoundedCornersLeft())
                                .shadow(color: .black, radius: 4, x: 4)
                                    .mask(Rectangle().padding(.trailing, -10))
                    }
                        
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                      
                    }
                    
                    
                }
                }
            }
        }
            
    
//    init() {
//        for family in UIFont.familyNames {
//            print(family)
//            for fontname in UIFont.fontNames(forFamilyName: family) {
//                print("--\(fontname)")
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          .preferredColorScheme(.dark)
    }
}
