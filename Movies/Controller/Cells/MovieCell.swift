//
//  MovieCell.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 28.07.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak private var poster: UIImageView!
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUpCell(movie: Results) {
        
        poster.image = Network.shared.getImage(path: movie.poster_path)
        poster.layer.cornerRadius = 10
        title.text = movie.title
        overview.text = movie.overview
    }
    
}
