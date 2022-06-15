//
//  CookTableViewCell.swift
//  CookPad
//
//  Created by Prana Apsara Wijaya on 15/6/22.
//

import UIKit

class CookTableViewCell: UITableViewCell {

    @IBOutlet weak var cookTitle: UILabel!
    @IBOutlet weak var cookDesc: UILabel!
    @IBOutlet weak var cookImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
