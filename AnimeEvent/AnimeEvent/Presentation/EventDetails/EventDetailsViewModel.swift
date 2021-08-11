//
//  EventDetailsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 11/08/21.
//

import Foundation

class EventDetailsViewModel {
    
    private let event: Event
    
    var eventTitle: String {
        return event.title
    }
    
    var eventDescription: String {
        return event.description
    }
    
    var isFavorite: Bool {
        return event.isFavorite
    }
    
    var eventImagePath: String {
        return event.locationPhotoPath
    }
    
    var eventInscriptionInstructions: String {
        return event.inscriptionInstructions
    }
    
    var eventHour: String {
        return event.hour
    }
    
    var eventRoom: String {
        return event.room
    }
    
    init(event: Event) {
        self.event = event
    }
}
