//
//  XIBView.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 08/08/21.
//

import UIKit

class XIBView: UIView {
    
    // MARK: - Public Properties
    override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Private Properties
    private var contentView: UIView
    
    // MARK: - Inits
    public override init(frame: CGRect) {
        self.contentView = UIView()
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.contentView = UIView()
        super.init(coder: aDecoder)
        setup()
    }
}

// MARK: - Private Methods

extension XIBView {
    private func setup() {
        guard type(of: self) != type(of: XIBView.self) else {
            debugPrint("You must subclass FSView. Don't use it directly.")
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let className = String(describing: type(of: self))
        contentView = Bundle(for: type(of: self)).loadNibNamed(className, owner: self, options: nil)?.first as! UIView
        contentView.frame = self.bounds
        addSubview(contentView)
        contentView.pinEdges(to: self)
    }
}
