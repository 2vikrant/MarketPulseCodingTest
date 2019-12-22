//
//  RequestModel.swift
//  MarketPulseCodingTest
//
//  Created by Ganesh Prasad on 22/12/19.
//  Copyright © 2019 MarketPulse. All rights reserved.
//

import Foundation



public struct FeedResponse: Codable {
    
    var id: Int? = .init()
    var name: String? = .init()
    var tag: String? = .init()
    var color: String? = .init()
    var criteria: [criteria]? = .init()
}



public struct criteria: Codable {
    
    var type: String? = .init()
    var text: String? = .init()
}
