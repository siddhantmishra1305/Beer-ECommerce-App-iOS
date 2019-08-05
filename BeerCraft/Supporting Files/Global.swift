//
//  Global.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 30/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation

class Global {
    private init() { }
    static let sharedInstance = Global()
    var cart = [BeerCart]()
}
