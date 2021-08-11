//
//  EventCellView.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak private var favoriteButton: UIButton!
    @IBOutlet weak private var leftColorView: UIView!
    @IBOutlet weak private var rightColorView: UIView!
    @IBOutlet weak private var eventImage: UIImageView!
    @IBOutlet weak private var eventTitleLabel: UILabel!
    @IBOutlet weak private var eventSubtitleLabel: UILabel!
    @IBOutlet weak private var eventHourLabel: UILabel!
    @IBOutlet weak private var eventRoomLabel: UILabel!
    @IBOutlet weak private var blankView: UIView!
    
    func setup(event: Event) {
        favoriteButton.setImage(UIImage(named: "heart.fill"), for: .selected)
        favoriteButton.isSelected = event.isFavorite
        eventImage.image = UIImage(named: event.locationPhotoPath)
        eventTitleLabel.text = event.title
        eventSubtitleLabel.text = event.subtitle
        eventHourLabel.text = event.hour
        eventRoomLabel.text = event.room
        blankView.rotate(angle: 8.0)
        leftColorView.backgroundColor = UIColor.ANIME.customPurple
        rightColorView.backgroundColor = UIColor.ANIME.customPurple
    }
}
