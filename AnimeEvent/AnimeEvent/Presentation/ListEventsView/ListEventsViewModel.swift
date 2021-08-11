//
//  ListEventsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 09/08/21.
//

import Foundation

class ListEventsViewModel {
    
    var eventList: [Event] {
        return EventsMock.eventList
    }
    
    var uniqueCellsCount: Int {
        return 2
    }
    
    var numberOfRows: Int {
        return uniqueCellsCount + eventList.count
    }
}
