//
//  MyFriendsTableViewCell.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/1/20.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myFriendsImage: UIImageView!
    
    @IBOutlet weak var myFriendsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
