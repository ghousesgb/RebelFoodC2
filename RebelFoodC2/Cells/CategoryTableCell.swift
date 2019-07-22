//
//  CategoryTableCell.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 20/07/19.
//

import UIKit

class CategoryTableCell: UITableViewCell {

    @IBOutlet weak var headlingLabel: UILabel!
    @IBOutlet weak var categoryCollection: CategoryCollection!
    @IBOutlet weak var seeAllButton: UIButton!
    
    var seeAllButtonCliked: ((_ buttonTag: Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func seeAllButtonAction(_ sender: UIButton) {
        if let buttonClicked = seeAllButtonCliked {
            buttonClicked(sender.tag)
        }
    }
}
