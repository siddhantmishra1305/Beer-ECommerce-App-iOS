//
//  IntentViewController.swift
//  BeerMenuUI
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import IntentsUI
import IntentKit

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        
        print(interaction.intentHandlingStatus)
        print(interaction.intentResponse as Any)
        if interaction.intentHandlingStatus == .success {
        
        if let _ = interaction.intentResponse as? ShowBeerMenuIntentResponse {
           let billView = BeerList()
                          view.addSubview(billView)
                          billView.translatesAutoresizingMaskIntoConstraints = false
                          NSLayoutConstraint.activate([
                              billView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                              view.trailingAnchor.constraint(equalTo: billView.trailingAnchor),
                              billView.topAnchor.constraint(equalTo: view.topAnchor),
                              ])
                          billView.setNeedsLayout()
                          billView.layoutIfNeeded()
            print(billView.frame.height)
            completion(true, parameters, CGSize(width: desiredSize.width, height: billView.frame.height))
            return
            }
            
//            if let _ = interaction.intentResponse as? SelectBeerAmountResolutionResult{
//
//            }
            
            
        }
            
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}

