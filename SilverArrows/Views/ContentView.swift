//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        
        ZStack {
            
            CustomColors.overallBackground
        
        ZStack (alignment: .leading){
        
        HStack (spacing: 0){
        RoundedCornersLeft()
                .foregroundColor(.white)
                .frame(width: 160)
        RoundedCornersRight()
                .fill(CustomColors.cardBackground)
        }
        .frame(height: 120)
        .shadow(color: CustomColors.cardShadow, radius: 4, x: 4, y: 4)
            
            Image("2010 MGP W01")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 120)
                .clipShape(RoundedCornersLeft())
                .shadow(color: .black, radius: 4, x: 4)
                    .mask(Rectangle().padding(.trailing, -10))
    }
        
        .padding(.horizontal)
    }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           .preferredColorScheme(.dark)
    }
}
