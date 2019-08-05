//
//  BeerCartCell.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 30/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class BeerCartCell: UITableViewCell {

    @IBOutlet weak var itemIcon: UIImageView!
    
    @IBOutlet weak var beerName: UILabel!
    
    @IBOutlet weak var beerStyle: UILabel!
    
    @IBOutlet weak var beerPrice: UILabel!
    
    @IBOutlet weak var itemQty: UILabel!
    
    @IBOutlet weak var removeItem: UIButton!
    
    @IBOutlet weak var addItem: UIButton!
    
    
    var beerData:BeerCart?{
        didSet{
            if let beerDetails = beerData{
            
                removeItem.layer.borderColor = #colorLiteral(red: 0.9382782578, green: 0.725286305, blue: 0.2363438904, alpha: 1)
                removeItem.layer.cornerRadius = 5.0
                
                addItem.layer.borderColor = #colorLiteral(red: 0.9382782578, green: 0.725286305, blue: 0.2363438904, alpha: 1)
                addItem.layer.cornerRadius = 5.0
            
                
                if let name = beerDetails.name{
                    beerName.text = name
                }
                
                if let style = beerDetails.style{
                    beerStyle.text = style
                }
                let currencySymbol = getCurrencySymbol()
                beerPrice.text = "\(currencySymbol)\(beerDetails.totalCost)"
                
                itemQty.text = beerDetails.qty
            }
        }
    }
}
