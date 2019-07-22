//
//  ViewController.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 19/07/19.
//

import UIKit

class HomeScreen: UIViewController {
    let homeScreenVM = HomeScreenViewModel()
    @IBOutlet weak var homeScreenTableView: UITableView!
    
    var categoryAllListResults = [String: [Result]]() {
        didSet {
            DispatchQueue.main.async {[unowned self] in
                self.homeScreenTableView.reloadData()
            }
        }
    }
    
    func showSubCategory(_ tag: Int) {
        let subCategoryVC = SubCategory()
        subCategoryVC.subCategoryList = categoryAllListResults[Categories[tag]]!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreenTableView.dataSource = self
        fetchList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == seeAllSegue {
            if let subCategoryVC = segue.destination as? SubCategory, let tag = sender as? Int {
                let categoryName = Categories[tag]
                subCategoryVC.subCategoryList = categoryAllListResults[categoryName]!
                subCategoryVC.categoryName = categoryName
            }
        }
    }

    func fetchList() {
        homeScreenVM.fetchTopMusicListDetails { (musicList) in
            if let musicList = musicList {
                    self.categoryAllListResults[Categories[0]] =  musicList
            }
        }
        
        homeScreenVM.fetchTopMoviesListDetails { (movieList) in
            if let movieList = movieList {
                self.categoryAllListResults[Categories[1]] = movieList
            }
        }
        
        homeScreenVM.fetchTopTVShowsListDetails { (tvshowList) in
            if let tvshowList = tvshowList {
                self.categoryAllListResults[Categories[2]] = tvshowList
            }
        }
        
        homeScreenVM.fetchTopBooksListDetails { (booksList) in
            if let booksList = booksList {
                self.categoryAllListResults[Categories[3]] = booksList
            }
        }
    }
}

extension HomeScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableCell", for: indexPath) as! CategoryTableCell
        cell.headlingLabel.text = Categories[indexPath.row]
        cell.seeAllButton.tag = indexPath.row
        if let sourceList = categoryAllListResults[Categories[indexPath.row]] {
            if sourceList.count > 0 {
                cell.categoryCollection.categoryList = sourceList
            }
        }
        cell.seeAllButtonCliked = {[unowned self] tag in
            self.performSegue(withIdentifier: seeAllSegue, sender: tag)
        }
        return cell
    }
}

