//
//  EventDetailsViewController.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 11/08/21.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak private var eventTitleLabel: UILabel!
    @IBOutlet weak private var eventDescriptionView: UIView!
    @IBOutlet weak private var favoriteButton: UIButton!
    @IBOutlet weak private var eventImage: UIImageView!
    @IBOutlet weak private var eventDescriptionLabel: UILabel!
    @IBOutlet weak private var eventInscriptionLabel: UILabel!
    @IBOutlet weak private var eventHourLabel: UILabel!
    @IBOutlet weak private var eventRoomLabel: UILabel!
    @IBOutlet weak private var eventLocationImage: UIImageView!
    
    private var viewModel: EventDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
    }
    
    func setup(viewModel: EventDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        eventTitleLabel.text = viewModel?.eventTitle
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.isSelected = UserDefaults.standard.bool(forKey: viewModel?.eventTitle ?? "")
        eventImage.image = UIImage(named: viewModel?.eventImagePath ?? "")
        eventDescriptionLabel.text = viewModel?.eventDescription
        eventInscriptionLabel.text = viewModel?.eventInscriptionInstructions
        eventHourLabel.text = viewModel?.eventHour
        eventRoomLabel.text = viewModel?.eventRoom
        
        if viewModel?.eventImagePath == "cosplayPoster" {
            eventImage.image = UIImage(named: "cosplayPoster_big")
        }
    }
    
    @IBAction func favoriteButtonTouched(_ sender: Any) {
        favoriteButton.isSelected.toggle()
        UserDefaults.standard.setValue(favoriteButton.isSelected, forKey: eventTitleLabel.text ?? "")
    }
    
}
