//
//  SubCategoryTableCell.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 22/07/19.
//

import UIKit

class SubCategoryTableCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainHeadingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    
    var configureSubCell: Result? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        if let imagePath = configureSubCell?.artworkUrl100, let imageURL = URL.init(string: imagePath) {
            mainHeadingLabel.text = configureSubCell?.artistName
            subHeadingLabel.text = configureSubCell?.name
            ImageLoader.image(for: imageURL) {[weak self] (image) in
                guard let self = self else { return }
                if let _ = image {
                    self.mainImageView.image = image
                }else {
                    self.mainImageView.image = nil
                }
            }
        }
    }

}
