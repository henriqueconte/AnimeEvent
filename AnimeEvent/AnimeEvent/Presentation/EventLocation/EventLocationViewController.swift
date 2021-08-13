//
//  EventLocationViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 13/08/21.
//

import UIKit

class EventLocationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.ANIME.customRed
        title = "Local"
    }
    
}
