//
//  ForeCastTableViewCell.swift
//  20200206_foreCast
//
//  Created by Dustin park on 2020/02/06.
//  Copyright © 2020 Dustin park. All rights reserved.
//

import UIKit

class ForeCastTableViewCell: UITableViewCell {
    
    static let identifier = "ForeCastTableViewCell"

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var temperatrueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
