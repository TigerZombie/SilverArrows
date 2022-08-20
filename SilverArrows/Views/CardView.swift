//
//  CardView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 20.08.22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            
            CustomColors.overallBackground
        
        ZStack (alignment: .leading){
        
        HStack (spacing: 0){
        RoundedCornersLeft()
                .foregroundColor(.white)
                .frame(width: 132)
        RoundedCornersRight()
                .fill(CustomColors.cardBackground)
                .frame(width: 198)
        }
        .frame(height: 95)
        .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
            
            Image("2010 MGP W01")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 132, height: 95)
                .clipShape(RoundedCornersLeft())
                .shadow(color: .black, radius: 4, x: 4)
                    .mask(Rectangle().padding(.trailing, -10))
    }
        
        .padding(.horizontal)
    }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
