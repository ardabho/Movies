//
//  MovieTableVC.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 28.07.2022.
//

import UIKit

class MovieTableVC: UITableViewController {
    
    var movies = [Results]()
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Popular Movies"
        
        Network.shared.fetchData(page: pageNumber, contentType: "movie" , category: categories.popular.rawValue) { results in
            self.movies = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            cell.setUpCell(movie: movies[indexPath.row])
            return cell
        }
        return UITableViewCell()
}
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = movies.count - 1
        
        //If user reached bottom of page, load more items
        if indexPath.row == lastElement {
            pageNumber += 1
            Network.shared.fetchData(page: pageNumber, contentType: "movie" , category: categories.popular.rawValue) { results in
                self.movies.append(contentsOf: results)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? MovieDetailVC {
            vc.movie = movies[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
