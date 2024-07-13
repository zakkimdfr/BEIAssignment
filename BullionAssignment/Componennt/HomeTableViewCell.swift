//
//  HomeTableViewCell.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var hStack: UIStackView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var emailuser: UILabel!
    @IBOutlet weak var birthDataUser: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
