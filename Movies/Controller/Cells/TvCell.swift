//
//  TvCell.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 25.08.2022.
//

import UIKit

class TvCell: UICollectionViewCell {
    @IBOutlet weak private var posterImage: UIImageView!
    @IBOutlet weak private var PopularImageView: UIImageView!
    @IBOutlet weak private var TopRatedImageView: UIImageView!
    
    func setUpCell(serie: TvResult, cellCategory: Int) {
        switch cellCategory {
        case 1:
            posterImage.image = Network.shared.getImage(path: serie.poster_path)
            posterImage.layer.cornerRadius = 10
        case 2:
            PopularImageView.image = Network.shared.getImage(path: serie.poster_path)
            PopularImageView.layer.cornerRadius = 10
        case 3:
            TopRatedImageView.image = Network.shared.getImage(path: serie.poster_path)
            TopRatedImageView.layer.cornerRadius = 10
        default:
            return
        }
    }
    
}
