 //
//  NSUserActivity+IntentData.swift
//  IntentKit
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Foundation
import Intents

 extension NSUserActivity {
     
     public static let orderBeerActivityType = "com.sid.IntentKit.orderBeer"
     
     public static var orderBeerActivity: NSUserActivity {
         let userActivity = NSUserActivity(activityType: NSUserActivity.orderBeerActivityType)
         
        userActivity.title = "Show Beer Menu"
        userActivity.persistentIdentifier = NSUserActivityPersistentIdentifier(NSUserActivity.orderBeerActivityType)
         userActivity.isEligibleForPrediction = true
         userActivity.suggestedInvocationPhrase = "Order Beer"
         
         return userActivity
     }
 }
