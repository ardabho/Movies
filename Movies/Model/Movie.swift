//
//  Movie.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 28.07.2022.
//

import Foundation

struct Movie: Codable {
    var results: [Results]
}

struct Results: Codable {
    var overview: String
    var poster_path: String
    var title: String
}
