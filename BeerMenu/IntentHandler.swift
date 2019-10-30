//
//  IntentHandler.swift
//  BeerMenu
//
//  Created by Siddhant Mishra on 19/10/19.
//  Copyright © 2019 Siddhant Mishra. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"
import IntentKit
import Intents
import os.log

class IntentHandler: INExtension {
    
   override func handler(for intent: INIntent) -> Any {
        os_log("TK421: IntentHandler called!")
        if intent is ShowBeerMenuIntent {
            return BeerMenuIntentHandler()
        }
        
        else if intent is SelectBeerIntent{
            return SelectBeerIntentHandler()
        }

        fatalError("Unhandled intent type: \(intent)")
    }
    
    
}
