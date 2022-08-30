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
            
            // Background Color
            CustomColors.overallBackground
                .edgesIgnoringSafeArea(.all)
            
            // Scrollview on top of background color, hidden indicators
            ScrollView (showsIndicators: false) {
                
                // Stack of logo and cards
                VStack{
                Image("LogoAMGPetronas")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260)
                    .padding(.bottom, 16)
                
                    // List of cards
                    ForEach (F1season.seasons) { s in
                     
                        ZStack {
                           
                        ZStack (alignment: .leading){
                        
                            
                        HStack (spacing: 0){
                            
                            // invisible background item on left side, to align the right side item (the part with text). Also: Will provide the shadow below the picture.
                        RoundedCornersLeft()
                                .foregroundColor(.white)
                                .frame(width: 132)
                                .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                           
                            
                            ZStack{
                                
                                // the part of the card with text
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
                            
                            // Height of complete card
                        .frame(height: 95)
                        
                            // Image with shadow only to the right side (cropped with mask modifier)
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
            
    // to check the font names
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
