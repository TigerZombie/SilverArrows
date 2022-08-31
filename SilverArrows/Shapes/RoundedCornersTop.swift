//
//  RoundedCornersTop.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 30.08.22.
//

import SwiftUI

struct RoundedCornersTop: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(bezierPath.cgPath)
    }
    
    
}

struct RoundedCornersTop_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersTop()
    }
}
