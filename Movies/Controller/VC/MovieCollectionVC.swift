//
//  MovieCollectionVC.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 24.08.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MovieCollectionVC: UICollectionViewController {

    var movies = [Results]()
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "In Theaters"
        Network.shared.fetchData(page: pageNumber, contentType: "movie" ,category: categories.nowPlaying.rawValue) { results in
            self.movies = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? MovieCollectionCell {
            cell.setUpCell(movie: movies[indexPath.row])
            cell.backgroundColor = .systemGray4
            cell.layer.cornerRadius = 20
            
            return cell
        }
    
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? MovieDetailVC {
        vc.movie = movies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
