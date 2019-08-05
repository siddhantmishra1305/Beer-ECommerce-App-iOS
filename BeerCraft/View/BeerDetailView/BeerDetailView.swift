//
//  BeerDetailView.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class BeerDetailView: UIView {

    @IBOutlet weak var beerPicture: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    
    @IBOutlet weak var canDisplayLBL: UILabel!
    @IBOutlet weak var abvDisplayLBL: UILabel!
    @IBOutlet weak var styleDisplayLBL: UILabel!
    @IBOutlet weak var ibuDisplayLBL: UILabel!
    
    @IBOutlet weak var canLBL: UILabel!
    @IBOutlet weak var abvLBL: UILabel!
    @IBOutlet weak var ibuLBL: UILabel!
    @IBOutlet weak var styleLBL: UILabel!
 
    
    var beerData:Beers?{
        didSet{
            if let beerDetails = beerData{
               
                if let name = beerDetails.name{
                    beerName.text = name
                }
            
                if let ounces = beerDetails.ounces{
                    canLBL.text = String(ounces)
                }
            
                if let ibu = beerDetails.ibu{
                    if ibu != "0.0"{
                        ibuLBL.text = ibu
                    } else{
                        ibuLBL.text = "NA"
                    }
                }
            
                if let abv = beerDetails.abv{
                    if abv != "0.0" {
                        abvLBL.text = abv
                    } else{
                        abvLBL.text = "NA"
                    }
                }
            
                if let style = beerDetails.style{
                    styleLBL.text = style
                }
                
            }
        }
    }
}
