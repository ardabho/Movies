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
    
    var screenWidth = UIScreen.main.bounds.width - 40
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setUpCell(movie: Results) {
        
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    poster.image = image
                }
            }
        }
        
        poster.layer.cornerRadius = 20
        title.text = movie.title
        overview.text = movie.overview
    }
    
}
