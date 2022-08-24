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
        
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    posterImage.image = image
                }
            }
        }
        posterImage.layer.cornerRadius = 20
        titleLabel.text = movie.title
    }

    
}
