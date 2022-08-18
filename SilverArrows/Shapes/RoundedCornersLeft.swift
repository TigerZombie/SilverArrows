//
//  RoundedCornersLeft.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 18.08.22.
//

import SwiftUI

struct RoundedCornersLeft: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .topLeft], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(bezierPath.cgPath)
    }
    
    
}

struct RoundedCornersLeft_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersLeft()
    }
}
