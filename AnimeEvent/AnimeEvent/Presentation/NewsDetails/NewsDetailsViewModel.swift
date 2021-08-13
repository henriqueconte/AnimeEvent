//
//  NewsDetailsViewModel.swift
//  AnimeEvent
//
//  Created by Henrique Conte on 13/08/21.
//

import Foundation

class NewsDetailsViewModel {
    
    private let news: Event
    
    var newsTitle: String {
        return news.title
    }
    
    var newsPhotoPath: String {
        return news.locationPhotoPath
    }
    
    var newsDescription: String {
        return news.description
    }
    
    init(news: Event) {
        self.news = news
    }
}
