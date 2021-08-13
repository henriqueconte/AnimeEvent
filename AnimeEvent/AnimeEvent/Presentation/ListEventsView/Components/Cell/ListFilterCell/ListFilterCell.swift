//
//  ListFilterCell.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 10/08/21.
//

import UIKit

class ListFilterCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var buttonsStack: UIStackView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    func setupNews() {
        titleLabel.text = "Notícias"
        buttonsStack.isHidden = true
        searchBar.isHidden = true
    }
}
