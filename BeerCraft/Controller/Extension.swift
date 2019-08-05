//
//  ViewController+Extension.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 27/07/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorAlertWithTitle(_ title:String?, message:String) {
        
        let alertController = UIAlertController(title: title ?? "", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    /** Get currency symbol as per locale. **/
    func getCurrencySymbol() -> String {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        return  currencySymbol
    }
    
    func addLine(color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
    }
}

extension CALayer{
    
    func giveShadowToTableViewCell(layer:CALayer,Bounds:CGRect , cornerRadius:CFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowRadius = 12.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: Bounds, cornerRadius: CGFloat(cornerRadius)).cgPath
    }
    
}


