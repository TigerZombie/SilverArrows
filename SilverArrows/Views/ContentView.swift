//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var season = SeasonModel()
    
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
                
                    
                    ForEach (season.seasons) { s in
                        Text(s.name)
                        
                    }
                    
                    //CardView(carName: s.name, season: s.season)
                    
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
