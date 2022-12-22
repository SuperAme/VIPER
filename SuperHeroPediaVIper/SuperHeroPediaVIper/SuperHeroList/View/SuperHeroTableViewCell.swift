//
//  SuperHeroTableViewCell.swift
//  SuperHeroPediaVIper
//
//  Created by Américo MQ on 22/12/22.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heroImage.layer.borderColor = UIColor.systemGray.cgColor
        heroImage.layer.borderWidth = 1
        heroImage.layer.cornerRadius = 35
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
}
