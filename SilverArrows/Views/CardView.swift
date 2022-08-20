//
//  CardView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 20.08.22.
//

import SwiftUI

struct CardView: View {
    
    @Binding var carName: String
    @Binding var season: String
    
    var body: some View {
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
                Text(carName)
                    .font(.customFontTitle)
                    .foregroundColor(CustomColors.cardText)
                    
                Text("\(season) season")
                    .font(.customFontBody)
                    .foregroundColor(CustomColors.cardText)
            }
            }
                
                .frame(width: 198)
        }
        .frame(height: 95)
        
            
            Image("2010 MGP W01")
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(carName: .constant("MGP W01"), season: .constant("2010"))
    }
}
