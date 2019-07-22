//
//  SubCategory.swift
//  RebelFoodC2
//
//  Created by Ghouse Basha Shaik on 22/07/19.
//

import UIKit

class SubCategory: UIViewController {
    @IBOutlet weak var subCategoryTableView: UITableView!
    var categoryName: String?
    var subCategoryList = [Result?]() {
        didSet {
            DispatchQueue.main.async {
                if let _ = self.subCategoryTableView {
                    self.subCategoryTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = categoryName
    }
}

extension SubCategory: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCategoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryTableCell", for: indexPath) as! SubCategoryTableCell
        cell.configureSubCell = subCategoryList[indexPath.row]
        return cell
    }
    
    
}
