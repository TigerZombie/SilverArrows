//
//  RoundedCornersRight.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 18.08.22.
//

import SwiftUI

struct RoundedCornersRight: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomRight, .topRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(bezierPath.cgPath)
    }
    
    
}

struct RoundedCornersRight_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersRight()
    }
}
