//
//  ProductListTableViewCell.swift
//  AlamoFireExample
//
//  Created by Yogesh Rathore on 06/03/19.
//  Copyright © 2019 Yogesh Rathore. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var releaseDateUrl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var productId: UILabel!
    @IBOutlet weak var starRatinglbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
