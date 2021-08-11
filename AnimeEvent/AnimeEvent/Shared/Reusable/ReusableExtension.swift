//
//  ReusableExtension.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import UIKit

protocol Reusable {
}

extension Reusable {
    static var nib: UINib {
        let name = String(describing: Self.self)
        guard let reference = self as? AnyClass else {
            fatalError("Error getting the class implementing Reusable protocol")
        }
        let bundle = Bundle(for: reference)
        return UINib(nibName: name, bundle: bundle)
    }
    
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UITableViewCell: Reusable { }
