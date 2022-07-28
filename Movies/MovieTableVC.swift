//
//  MovieTableVC.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 28.07.2022.
//

import UIKit

class MovieTableVC: UITableViewController {
    
    var movies: [Results]!
    var apiKey = "4ef04d6dfd0046f70e881d4423868e5b"
    var dataLoaded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMovies()
    }
    
    func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {fatalError("Cant convert to url")}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                if let fetchedMovies = try? decoder.decode(Movie.self, from: data) {
                    self.movies = fetchedMovies.results
                    
                    self.dataLoaded = true
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
        task.resume()
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataLoaded {
            return movies.count
        } else {
            return 0
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataLoaded {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
                cell.setUpCell(movie: movies[indexPath.row])
                return cell
            }
        }
        
        //if data is not loaded
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        return cell
    }
    
}
