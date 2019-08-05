//
//  CheckoutViewController.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 02/08/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    var formArr = [[String]]()
    
    @IBOutlet weak var checkoutAddressFormListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       checkoutAddressFormListView.register(UINib(nibName: "MultipleFieldFormCell", bundle: nil), forCellReuseIdentifier: "MultipleFieldFormCell")
        
        checkoutAddressFormListView.register(UINib(nibName: "SingleFieldFormCell", bundle: nil), forCellReuseIdentifier: "SingleFieldFormCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var personalDetailArr = [String]()
        var deliveryArr = [String]()
        
        personalDetailArr.append("First Name")
        personalDetailArr.append("Mobile|Last Name")
        
        deliveryArr.append("House No|Apartment")
        deliveryArr.append("Street details")
        deliveryArr.append("Area")
        deliveryArr.append("City|Pincode")
        
        formArr.append(personalDetailArr)
        formArr.append(deliveryArr)
    }
}


extension CheckoutViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return formArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formArr[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        if section == 0 {
            let label = UILabel()
            label.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
            label.textColor = .black
            label.text = "Personal Details"
            return label
        } else{
            let label = UILabel()
            label.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
            label.textColor = .black
            label.text = "Address Details"
            return label
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arr = formArr[indexPath.section]
        
        if arr[indexPath.row].contains("|"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "MultipleFieldFormCell", for: indexPath) as! MultipleFieldFormCell
            
            cell.formData = [arr[indexPath.row]]
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldFormCell", for: indexPath) as! SingleFieldFormCell
            
            cell.formData = [arr[indexPath.row]]
            return cell
        }
    }
}


extension CheckoutViewController:UITextFieldDelegate{

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
}
