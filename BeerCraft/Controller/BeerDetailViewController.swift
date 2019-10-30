//
//  BeerDetailViewController.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var itemCounterLBL: UILabel!
    
    
   open var beerDetail = Beers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = BeerDetailView().loadNib() as! BeerDetailView
        customView.frame = CGRect(x: 0, y: 0, width: detailView.frame.width, height: detailView.frame.height)
        customView.beerData = beerDetail
        self.detailView.addSubview(customView)
        setupViews()
        if let name = beerDetail?.name{
            let cartItem = Global.sharedInstance.cart.filter { ($0.name?.contains(name))!}
            if cartItem.count>0{
                itemCounterLBL.text = cartItem[0].qty
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let name = beerDetail?.name{
            let cartItem = Global.sharedInstance.cart.filter { ($0.name?.contains(name))!}
            if cartItem.count>0{
                itemCounterLBL.text = cartItem[0].qty
            }
        }
    }
    
    
    func setupViews(){
        detailView.layer.giveShadowToTableViewCell(layer: detailView.layer, Bounds: detailView.bounds, cornerRadius: 10.0)
        
        addToCartBtn.layer.giveShadowToTableViewCell(layer: addToCartBtn.layer, Bounds: addToCartBtn.bounds, cornerRadius: 10.0)
        
        cartBtn.layer.cornerRadius = cartBtn.bounds.width/2
    }
    
    @IBAction func viewCartBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func addToCartBtnAction(_ sender: Any) {
        
        var item = BeerCart()
        
        if let name = beerDetail?.name{
            let cartItem = Global.sharedInstance.cart.filter { ($0.name?.contains(name))!}
           
            if cartItem.count>0{
                let index = Global.sharedInstance.cart.firstIndex { (item1) -> Bool in
                    item1.name == name
                }
                
             Global.sharedInstance.cart[(index)!].qty = itemCounterLBL.text
                
            } else if Int(itemCounterLBL.text!)! > 0{
        
            if let name = beerDetail?.name{
                item?.name = name
            }
            if let style = beerDetail?.style{
                item?.style = style
            }
        
            item?.qty = itemCounterLBL.text
        
            if let id = beerDetail?.id{
                item?.id = id
            }
        
            if let cost = beerDetail?.cost{
                item?.cost = cost
                if let qty = Int(itemCounterLBL.text!){
                    item?.totalCost = String(Int(cost)! * qty)
                }
            }
             Global.sharedInstance.cart.append(item!)
             self.showAlertWithForSucess("Success", message: "Beers added succesfully")
        }
    }
}
    
    @IBAction func increaseCount(_ sender: Any) {
        if let item = itemCounterLBL.text{
            if Int(item)! >= 10{
                print("Max limit reached")
            } else{
                itemCounterLBL.text = String(Int(item)! + 1)
            }
        }
    }
    
    @IBAction func decreaseCount(_ sender: Any) {
        if let item = itemCounterLBL.text{
            if Int(item)! == 0{
                print("Max limit reached")
            } else{
                itemCounterLBL.text = String(Int(item)! - 1)
            }
        }
    }
    
    
}
