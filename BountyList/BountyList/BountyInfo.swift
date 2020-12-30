//
//  BountyInfo.swift
//  BountyList
//
//  Created by Noah on 2020/12/23.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int

    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
