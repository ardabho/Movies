//
//  Network.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 24.08.2022.
//


import UIKit

enum categories: String {
    case popular = "popular"
    case nowPlaying = "now_playing"
}

final class Network {
    
    static let shared = Network()
    var apiKey = "4ef04d6dfd0046f70e881d4423868e5b"
    
    init() {
        
    }
    
    
    func fetchMovies(page: Int, category: String ,completion: @escaping ([Results])->(Void)) {
                guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(category)?api_key=\(apiKey)&language=en-US&page=\(page)") else {fatalError("Cant convert to url")}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                let decodedResults = self.decodeJson(data: data)
                completion(decodedResults)
            }
        }
        
        task.resume()
    }
    
    func decodeJson(data: Data) -> [Results] {
        let decoder = JSONDecoder()
        
        if let fetchedMovies = try? decoder.decode(Movie.self, from: data) {
            return fetchedMovies.results
        } else {
            print("Error while decoding JSON")
            return [Results]()
        }
        
    }
    
    func getImage(path: String) -> UIImage {
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(path)") {
            if let imageData = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: imageData) {
                    return image
                }
            }
        }
        return UIImage()
    }

}

