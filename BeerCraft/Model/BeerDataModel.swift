//
//  BeerDataModel.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation
import ObjectMapper

typealias Beers = BeerData

struct BeerData: Mappable {
    public var id:Int = 0
    public var abv:String?
    public var ibu:String?
    public var name:String?
    public var style:String?
    public var ounces:Double?
    public var cost:String = String(Int.random(in: 200..<1000))
    
    
    init?(map: Map) {
        
    }
    
    init?() {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        abv <- map["abv"]
        ibu <- map["ibu"]
        name <- map["name"]
        style <- map["style"]
        ounces <- map["ounces"]
    }
    
    
}
