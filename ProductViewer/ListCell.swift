//
//  ListCell.swift
//  ProductViewer
//
//  Created by Royce Reynolds on 4/7/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit


class ListCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var circleView: CircleView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        picture.image = nil
    }
    

}
