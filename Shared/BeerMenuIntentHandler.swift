//
//  BeerMenuIntentHandler.swift
//  IntentKit
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation
import Intents



public class BeerMenuIntentHandler: NSObject, ShowBeerMenuIntentHandling{
    public func handle(intent: ShowBeerMenuIntent, completion: @escaping (ShowBeerMenuIntentResponse) -> Void) {
        completion(ShowBeerMenuIntentResponse(code: .success, userActivity: nil))
    }
}

