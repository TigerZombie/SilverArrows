//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
  @State var carName = "MGP W01"
  @State var season = "2010"
    
    var body: some View {
        
        CardView(carName: $carName, season: $season)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    init() {
        for family in UIFont.familyNames {
            print(family)
            for fontname in UIFont.fontNames(forFamilyName: family) {
                print("--\(fontname)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
         //  .preferredColorScheme(.dark)
    }
}
