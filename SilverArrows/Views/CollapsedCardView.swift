//
//  CollapsedCardView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 03.09.22.
//

import SwiftUI

struct CollapsedCardView: View {
    
    let s: Season
    
    @State private var pictureWidthUnselected: CGFloat = 132
    @State private var pictureHeightUnselected: CGFloat = 95
    @State private var pictureWidthSelected: CGFloat = 330
    @State private var pictureHeightSelected: CGFloat = 129
    
    var body: some View {
        
        
        ZStack (alignment: .leading){
            
            
            HStack (spacing: 0){
                
                // invisible background item on left side, to align the right side item (the part with text). Also: Will provide the shadow below the picture.
                RoundedCornersLeft()
                    .foregroundColor(.white)
                    .frame(width: pictureWidthUnselected)
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
            .frame(height: pictureHeightUnselected)
            
            
            // Image with shadow only to the right side (cropped with mask modifier)
            Image("\(s.season) \(s.name)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: pictureWidthUnselected, height: pictureHeightUnselected)
                .clipShape(RoundedCornersLeft())
                .shadow(color: .black, radius: 4, x: 4)
                .mask(Rectangle().padding(.trailing, -10))
        }
        
    }
}

//struct CollapsedCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollapsedCardView()
//    }
//}
