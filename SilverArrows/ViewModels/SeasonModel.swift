//
//  SeasonModel.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 21.08.22.
//

import Foundation

class SeasonModel: ObservableObject {
    
    @Published var seasons = [Season]()
    
    init() {
        
        // Parse local json file
        
        // url path to json file
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
       
        if let path = pathString {
            
        // Create url object
        let url = URL(fileURLWithPath: path)
        
        
        do {
            // Create data object
            let data = try Data(contentsOf: url)
            
            // Decode data
            let decoder = JSONDecoder()
            
            do {
                let seasonData = try decoder.decode([Season].self, from: data)
                self.seasons = seasonData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
            
        }
        
    }
}
