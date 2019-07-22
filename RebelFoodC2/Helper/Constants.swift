//
//  Constants.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 19/07/19.
//

import Foundation

enum TopList: String {
    case movies =  "https://rss.itunes.apple.com/api/v1/in/movies/top-movies/all/10/explicit.json"
    case music =  "https://rss.itunes.apple.com/api/v1/in/apple-music/hot-tracks/all/10/explicit.json"
    case tvshow =  "https://rss.itunes.apple.com/api/v1/us/tv-shows/top-tv-episodes/all/10/explicit.json"
    case books = "https://rss.itunes.apple.com/api/v1/in/books/top-free/all/10/explicit.json"
}

let Categories = ["Trending Music",  "Top Movies", "TV Series", "Books"]

let seeAllSegue = "seeAllSegue"
