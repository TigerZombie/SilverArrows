//
//  RoundedCornersBottom.swift
//  SilverArrows
//
//  Created by Hendrik Jahns on 30.08.22.
//

import SwiftUI

struct RoundedCornersBottom: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(bezierPath.cgPath)
    }
    
    
}

struct RoundedCornersBottom_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornersBottom()
    }
}
