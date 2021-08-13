//
//  NewsDetailsViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 13/08/21.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet weak private var newsTitleLabel: UILabel!
    @IBOutlet weak private var eventImage: UIImageView!
    @IBOutlet weak private var newsDescriptionLabel: UILabel!
    @IBOutlet weak private var newsLocationTitleLabel: UILabel!
    
    private var viewModel: NewsDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    func setup(viewModel: NewsDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        newsTitleLabel.text = viewModel?.newsTitle
        eventImage.image = UIImage(named: viewModel?.newsPhotoPath ?? "")
        newsDescriptionLabel.text = viewModel?.newsDescription
    }
    
}
