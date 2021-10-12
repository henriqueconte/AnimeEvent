//
//  ListEventsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import Foundation

class ListEventsViewModel {
    
    private let showOnlyFavorite: Bool
    var textSearched: String = ""
    
    var eventList: [Event] {
        if showOnlyFavorite {
            return EventsMock.eventList.filter({
                UserDefaults.standard.bool(forKey: $0.title)
            })
        } else {
            if textSearched.isEmpty {
                return EventsMock.eventList
            } else {
                return EventsMock.eventList.filter({ $0.title.lowercased().contains(textSearched.lowercased()) })
            }
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
