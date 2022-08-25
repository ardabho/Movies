//
//  TvSerie.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 25.08.2022.
//

import Foundation

struct TvSerie: Codable {
    var results: [TvResult]
}

struct TvResult: Codable {
    var name: String
    var poster_path: String
    var vote_average: Float
}
