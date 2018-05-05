//
//  TrendTableViewCell.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 4..
//  Copyright © 2018년 swift. All rights reserved.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var contentText: UITextView!
    @IBOutlet var languageLbl: UILabel!
    @IBOutlet var starLbl: UILabel!
    @IBOutlet var porkLbl: UILabel!
    @IBOutlet var todayLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
