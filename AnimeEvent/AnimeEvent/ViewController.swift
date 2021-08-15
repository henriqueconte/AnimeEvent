//
//  ViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 08/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let listEventsVC: ListEventsViewController = ListEventsViewController()
        listEventsVC.setup(viewModel: ListEventsViewModel(showOnlyFavorite: false))
        show(listEventsVC, sender: nil)
    }


}

