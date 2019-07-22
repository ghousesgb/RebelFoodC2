//
//  CategoryCollectionCell.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 20/07/19.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        contentView.layer.cornerRadius = 2.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }

    var configure: Result? {
        didSet {
            configureCell()
        }
    }
    
    func configureCell() {
        if let imagePath = configure?.artworkUrl100, let imageURL = URL.init(string: imagePath) {
            ImageLoader.image(for: imageURL) {[weak self] (image) in
                guard let self = self else { return }
                if let _ = image {
                    self.thumbnailImageView.image = image
                    self.thumbnailImageView.layer.cornerRadius = 5
                    self.thumbnailImageView.layer.masksToBounds = true
                }else {
                    self.thumbnailImageView.image = nil
                }
            }
        }
    }
}
