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
    var apiKey = "4ef04d6dfd0046f70e881d4423868e5b"
    var dataLoaded = false // set to true when data is loaded
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "In Theaters"
        
        fetchMovies(page: pageNumber)
        
    }
    
    func fetchMovies(page: Int) {
                guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=\(page)") else {fatalError("Cant convert to url")}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                self.decodeJson(data: data)
            }
        }
        
        task.resume()
    }
    
    func decodeJson(data: Data) {
        let decoder = JSONDecoder()
        
        if let fetchedMovies = try? decoder.decode(Movie.self, from: data) {
            self.movies.append(contentsOf: fetchedMovies.results)
            
            self.dataLoaded = true
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataLoaded {
            return movies.count
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? MovieCollectionCell {
            cell.setUpCell(movie: movies[indexPath.row])
            cell.backgroundColor = .systemGray
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
