//
//  Event.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 08/08/21.
//

import Foundation

struct Event {
    var title: String
    var subtitle: String
    var description: String
    var shortDescription: String?
    var inscriptionInstructions: String
    var hour: String
    var room: String
    var locationPhotoPath: String
    var participant: [Participant]
    var isFavorite: Bool
}
