//
//  SearchResults.swift
//  PhotosLibrary
//
//  Created by Алексей Пархоменко on 18/08/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKing.RawValue:String]
    
    
    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}


