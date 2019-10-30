//
//  SelectBeerIntentHandler.swift
//  BeerCraft
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation
import Intents

public class SelectBeerIntentHandler:NSObject, SelectBeerIntentHandling{
    public func resolveBeerName(for intent: SelectBeerIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        if intent.beerName == "beerName"{
            completion(INStringResolutionResult.needsValue())
        } else{
            completion(INStringResolutionResult.success(with: intent.beerName ?? ""))
        }
        
    }
    
    @available(iOSApplicationExtension 13.0, *)
    public func resolveAmount(for intent: SelectBeerIntent, with completion: @escaping (SelectBeerAmountResolutionResult) -> Void) {
       
        if intent.amount == 0{
            completion(SelectBeerAmountResolutionResult.needsValue())
        } else{
            completion(SelectBeerAmountResolutionResult.success(with: intent.amount as! Int))
        }
        
    }
    
    public func handle(intent: SelectBeerIntent, completion: @escaping (SelectBeerIntentResponse) -> Void) {
        
        print(intent.beerName!)
        print(intent.amount!)
        completion(SelectBeerIntentResponse.success(amount: intent.amount!, beerName: intent.beerName!))
    }
    

    
    
}
