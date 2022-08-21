//
//  SeasonModel.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 21.08.22.
//

import Foundation

class SeasonModel: ObservableObject {
    
    @Published var seasons = [SeasonJSON]()
    
    init() {
        
        self.seasons = DataService.getLocalData()
       
    }
    
   
}
