//
//  ExpandedCardView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 03.09.22.
//

import SwiftUI

struct ExpandedCardView: View {
    
    @ObservedObject var F1season = SeasonModel()
    @Binding var s: Season
    
    @State private var pictureWidthUnselected: CGFloat = 132
    @State private var pictureHeightUnselected: CGFloat = 95
    @State private var pictureWidthSelected: CGFloat = 330
    @State private var pictureHeightSelected: CGFloat = 129
    
    var body: some View {
        
        ZStack (alignment: .top){
            
            
            VStack (spacing: 0){
                
                // invisible background item on left side, to align the right side item (the part with text). Also: Will provide the shadow below the picture.
                RoundedCornersTop()
                    .foregroundColor(.white)
                    .frame(width: pictureWidthSelected, height: pictureHeightSelected)
                    .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                
                
                ZStack {
                    
                    // the part of the card with text
                    RoundedCornersBottom()
                        .fill(CustomColors.cardBackground)
                        .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
                    VStack  {
                        // Centering the car name and season
                        HStack {
                            Spacer()
                            VStack {
                                Text(s.name)
                                    .font(.customFontTitle)
                                    .foregroundColor(CustomColors.cardText)
                                
                                Text("\(s.season) season")
                                    .font(.customFontBody)
                                    .foregroundColor(CustomColors.cardText)
                            }
                            Spacer()
                        }
                        HStack {
                            
                            VStack (alignment: .leading) {

                                
                                HStack {
                                    Text("Drivers:")
                                    ForEach (s.drivers, id: \.self) { driver in
                                        Text("\(driver)")
                                    }
                                }
                                .font(.customFontBody)
                                .foregroundColor(CustomColors.cardText)
                                
                                HStack {
                                    Text("Championship Points:")
                                    Text(s.championshipPoints)
                                }
                                .font(.customFontBody)
                                .foregroundColor(CustomColors.cardText)
                                
                                if s.teamChampionship == true {
                                    HStack {
                                        Text("Team Championship")
                                        Image(systemName: "rosette")
                                            .foregroundColor(Color.yellow)
                                    }
                                    .font(.customFontBody)
                                    .foregroundColor(CustomColors.cardText)
                                }
                                
                                if s.driversChampionship == true {
                                    HStack {
                                        Text("Driver Champion: \(s.driverChampion)")
                                        Image(systemName: "rosette")
                                            .foregroundColor(Color.yellow)
                                    }
                                    .font(.customFontBody)
                                    .foregroundColor(CustomColors.cardText)
                                    
                                }
                                
                                
                            }
                            
                            // Pushing the text to the leading edge
                            Spacer()
                        }
                        .padding(.top, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    .padding(.horizontal)
                    // Next padding will define the bottom part of the card, automatically adjusting it to what is needed by the VStack (text)
                    .padding([.top, .bottom])
                    
                }
                .frame(width: pictureWidthSelected)
            }
            
            
            // Image with shadow only to the right side (cropped with mask modifier)
            Image("\(s.season) \(s.name)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: pictureWidthSelected, height: pictureHeightSelected)
                .clipShape(RoundedCornersTop())
                .shadow(color: .black, radius: 4, x: 0, y: 4)
                .mask(Rectangle().padding(.bottom, -14))
            
            
        }
        
        
    }
}

//struct ExpandedCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpandedCardView()
//    }
//}
