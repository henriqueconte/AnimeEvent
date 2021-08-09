//
//  UIViewExtension.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 08/08/21.
//

import UIKit

extension UIView {
    /// Pins the view in a superview using autolayout.
    ///
    /// - Parameter parent: superview to pin the current view.
    func pinEdges(to parent: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
    
    func roundCorners(cornerRadius: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
