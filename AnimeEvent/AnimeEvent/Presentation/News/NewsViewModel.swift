//
//  NewsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 13/08/21.
//

import Foundation

class NewsViewModel {
    var newsList: [Event] {
        return EventsMock.newsList
    }
    
    var uniqueCellsCount: Int {
        return 2
    }
    
    var numberOfRows: Int {
        return uniqueCellsCount + newsList.count
    }
}
