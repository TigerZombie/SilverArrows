//
//  ContentView.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 15.08.22.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        
        CardView()
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           .preferredColorScheme(.dark)
    }
}
