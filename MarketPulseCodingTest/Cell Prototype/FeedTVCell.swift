//
//  FeedTVCell.swift
//  MarketPulseCodingTest
//
//  Created by Ganesh Prasad on 22/12/19.
//  Copyright © 2019 MarketPulse. All rights reserved.
//

import UIKit

class FeedTVCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var descLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
