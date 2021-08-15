//
//  ListFilterCell.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 10/08/21.
//

import UIKit

protocol SearchDelegate: AnyObject {
    func textDidChange(newText: String)
}

class ListFilterCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var buttonsStack: UIStackView!
    @IBOutlet weak private var searchBar: UISearchBar!
    weak var delegate: SearchDelegate?
    
    override func awakeFromNib() {
        searchBar.delegate = self
    }
    
    func simpleCell(title: String) {
        titleLabel.text = title
        buttonsStack.isHidden = true
        searchBar.isHidden = true
    }
}

extension ListFilterCell: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.textDidChange(newText: searchBar.text ?? "")
    }
}
