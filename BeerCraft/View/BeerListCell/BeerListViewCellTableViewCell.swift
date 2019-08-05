//
//  BeerListViewCellTableViewCell.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class BeerListViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var beerName: UILabel!
    
    @IBOutlet weak var beerStyle: UILabel!
    
    @IBOutlet weak var ABV: UILabel!
    
    @IBOutlet weak var beerPrice: UILabel!
    
    var beerData:Beers?{
        didSet{
            if let beerDetails = beerData{
                
                if let name = beerDetails.name{
                    beerName.text = name
                }
                
                if let abv = beerDetails.abv{
                    if abv.count>0{
                        ABV.text = "ABV: \(abv)"
                    } else{
                        ABV.text = "ABV: NA"
                    }
                }
                let currencySymbol = getCurrencySymbol()
                beerPrice.text = "\(currencySymbol) \(beerDetails.cost)"
                
                if let style = beerDetails.style{
                    beerStyle.text = style
                }
                
            }
        }
    }
    
}



