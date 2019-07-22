//
//  CategoryCollection.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 20/07/19.
//

import UIKit

class CategoryCollection: UICollectionView {
    var categoryList = [Result]() {
        didSet{
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        self.dataSource = self
    }
}

extension CategoryCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
        cell.configure = categoryList[indexPath.row]
        cell.layoutSubviews()
        return cell
    }
    
    
}
