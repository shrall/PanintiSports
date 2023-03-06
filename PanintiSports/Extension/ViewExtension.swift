//
//  ViewExtension.swift
//  PanintiSports
//
//  Created by Marshall Kurniawan on 06/03/23.
//

import Foundation
import SwiftUI

extension View {
    func expandable () -> some View {
        ZStack {
            Color.clear
            self
        }
    }
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
