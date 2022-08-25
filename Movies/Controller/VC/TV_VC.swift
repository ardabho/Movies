//
//  TV_VC.swift
//  Movies
//
//  Created by Arda Büyükhatipoğlu on 25.08.2022.
//

import UIKit

class TV_VC: UIViewController {
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    
    var onTheAir = [TvResult]()
    var popular = [TvResult]()
    var topRated = [TvResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.backgroundColor = .darkGray
        title = "Tv"
        
        DispatchQueue.global(qos: .userInteractive).async {
            Network.shared.fetchTvData(page: 1, contentType: "tv", category: "on_the_air") { results in
                self.onTheAir = results
            }
            Network.shared.fetchTvData(page: 1, contentType: "tv", category: "popular") { results in
                self.popular = results
            }
            Network.shared.fetchTvData(page: 1, contentType: "tv", category: "top_rated") { results in
                self.topRated = results
            }
            
            DispatchQueue.main.async {
                self.collectionView1.reloadData()
                self.collectionView2.reloadData()
                self.collectionView3.reloadData()
            }
        }
    }
    
}


extension TV_VC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView1 {
            return onTheAir.count
        } else if collectionView == collectionView2 {
            return popular.count
        } else if collectionView == collectionView3 {
            return topRated.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvCell", for: indexPath) as? TvCell {
            if collectionView == collectionView1{
                
                cell.setUpCell(serie: onTheAir[indexPath.row],cellCategory: 1)
                return cell
                
            } else if collectionView == collectionView2{
                
                cell.setUpCell(serie: popular[indexPath.row], cellCategory: 2)
                return cell
                
            } else if collectionView == collectionView3{
                
                cell.setUpCell(serie: topRated[indexPath.row], cellCategory: 3)
                return cell
                
            }
        }
        
        return UICollectionViewCell()
    }
    
    
}
