//
//  MovieCollectionCell.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 24.08.2022.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setUpCell(movie: Results) {
        
        posterImage.image = Network.shared.getImage(path: movie.poster_path)
        posterImage.layer.cornerRadius = 10
        titleLabel.text = movie.title
    }

    
}
