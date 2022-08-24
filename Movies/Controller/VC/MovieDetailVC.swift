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
        loadElements(with: movie)
        
    }
    
    func loadElements(with movie: Results?) {
        guard let movie = movie else {
            return
        }
        
        poster.image = Network.shared.getImage(path: movie.poster_path)
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
    }
    
}
