//
//  MultipleFieldFormCell.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 01/08/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import UIKit

class MultipleFieldFormCell: UITableViewCell {

    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!

    @IBOutlet weak var tf1: UITextField!
    
    @IBOutlet weak var tf2: UITextField!
    
    
    var formData:[String] = []{
        didSet{
            if formData.count > 0{
                let data = formData[0].components(separatedBy: "|")
                
                if data.count>0{
                    lbl1.text = data[0]
//                    tf1.attributedPlaceholder = NSAttributedString(
//                                                    string: data[0],
//                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                    tf1.addLine(color: .white, width: 0.3)
                }
                
                if data.count>1{
                    lbl2.text = data[1]
//                    tf2.attributedPlaceholder = NSAttributedString(
//                                                    string: data[1],
//                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                    tf2.addLine(color: .white, width: 0.3)
                }
            }
        }
    }
}
