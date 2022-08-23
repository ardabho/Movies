//
//  MovieDetailVC.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 23.08.2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet weak private var poster: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!
    
    var movie: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poster.layer.cornerRadius = 20
        
        loadElements(with: movie)
        
    }
    
    func loadElements(with movie: Results?) {
        guard let movie = movie else {
            return
        }
        
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    poster.image = image
                }
            }
        }
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
    }
    
    
    
    
}
