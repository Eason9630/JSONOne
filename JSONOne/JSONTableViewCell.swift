//
//  JSONTableViewCell.swift
//  JSONOne
//
//  Created by 林祔利 on 2023/4/19.
//

import UIKit

class JSONTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
