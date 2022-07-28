//
//  MovieCell.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 28.07.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        }

    func setUpCell(movie: Results) {
        //poster image load
        title.text = movie.title
        overview.text = movie.overview
    }

}
