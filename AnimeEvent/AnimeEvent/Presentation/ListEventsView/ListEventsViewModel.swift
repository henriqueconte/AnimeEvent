//
//  ListEventsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import Foundation

class ListEventsViewModel {
    
    private let showOnlyFavorite: Bool
    
    var eventList: [Event] {
        if showOnlyFavorite {
            return EventsMock.eventList.filter({
                UserDefaults.standard.bool(forKey: $0.title)
            })
        } else {
            return EventsMock.eventList
        }
        
    }
    
    var uniqueCellsCount: Int {
        return 2
    }
    
    var numberOfRows: Int {
        return uniqueCellsCount + eventList.count
    }
    
    init(showOnlyFavorite: Bool) {
        self.showOnlyFavorite = showOnlyFavorite
    }
}
