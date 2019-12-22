//
//  FeedDetailViewController.swift
//  MarketPulseCodingTest
//
//  Created by Ganesh Prasad on 22/12/19.
//  Copyright © 2019 MarketPulse. All rights reserved.
//

import UIKit


class FeedDetailViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var typeLB: UILabel!
    @IBOutlet weak var nameLB: UILabel!
    
    var selectedFeed = FeedResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLB.text = selectedFeed.criteria?.first?.text
        typeLB.text = selectedFeed.criteria?.first?.type
    }
    
    
}
