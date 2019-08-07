//
//  CartViewController.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 30/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartListView: UITableView!
    
    @IBOutlet weak var checkoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartListView.register(UINib(nibName: "BeerCartCell", bundle: nil), forCellReuseIdentifier: "BeerCartCell")
        checkoutBtn.layer.giveShadowToTableViewCell(layer: checkoutBtn.layer, Bounds: checkoutBtn.bounds, cornerRadius: 10.0)

    }
}


extension CartViewController :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Global.sharedInstance.cart.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCartCell", for: indexPath) as! BeerCartCell
        
        cell.beerData = Global.sharedInstance.cart[indexPath.section]
        
        cell.layer.cornerRadius = 10.0
        
        cell.addItem.addTarget(self, action: #selector(bookbtn1(_:)), for: .touchUpInside)
        cell.removeItem.addTarget(self, action: #selector(bookBtn2(_:)) , for: .touchUpInside)
        
        return cell
    }
}


extension CartViewController{
    
    @objc func bookbtn1(_ sender : UIButton){
        guard let cell = sender.superview?.superview?.superview as? BeerCartCell else {
            return
        }
        let indexPath = cartListView.indexPath(for: cell)
       
        
        if let index = indexPath?.section{
            let oldQty = Int(Global.sharedInstance.cart[index].qty!)!
            if oldQty >= 10{
                print("Max limit reached")
            } else{
                let cost = Int(Global.sharedInstance.cart[index].cost)!
                Global.sharedInstance.cart[(indexPath?.section)!].qty = String(oldQty + 1)
                Global.sharedInstance.cart[(indexPath?.section)!].totalCost = String((oldQty + 1) * cost)
            }
        }
        cartListView.reloadData()
        
    }
    
    @objc func bookBtn2(_ sender : UIButton){
        guard let cell = sender.superview?.superview?.superview as? BeerCartCell else {
            return
        }
        let indexPath = cartListView.indexPath(for: cell)
        
        if let index = indexPath?.section{
            let oldQty = Int(Global.sharedInstance.cart[index].qty!)!
            if oldQty == 0{
                Global.sharedInstance.cart.remove(at: index)
            } else{
                let cost = Int(Global.sharedInstance.cart[index].cost)!
                Global.sharedInstance.cart[(indexPath?.section)!].qty = String(oldQty - 1)
                Global.sharedInstance.cart[(indexPath?.section)!].totalCost = String((oldQty - 1) * cost)
            }
        }
        cartListView.reloadData()
    }
    
}
