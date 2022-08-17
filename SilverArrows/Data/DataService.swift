//
//  DataService.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 17.08.22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [SeasonJSON] {
        
        // Parse local json file
        
        // url path to json file
        let pathString = Bundle.main.path(forResource: "Season", ofType: "json")
        
        // check if pathString is not nil
        guard pathString != nil else {
            return [SeasonJSON]()
        }
        
        // Create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create data object
            let data = try Data(contentsOf: url)
            
            // Decode data
            let decoder = JSONDecoder()
            
            do {
                let seasonData = try decoder.decode([SeasonJSON].self, from: data)
                return seasonData
            }
        }
        catch {
            print(error)
        }
        
        return [SeasonJSON]()
        
    }
    
    
    
    
}
