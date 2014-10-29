//
//  IAAssetsLibrary.swift
//  Albums
//
//  Created by Michael Stewart on 10/28/14.
//  Copyright (c) 2014 iOS in Action. All rights reserved.
//

import UIKit
import AssetsLibrary

class IAAssetsLibrary: ALAssetsLibrary {
    
    class var defaultInstance : IAAssetsLibrary {
        struct Static {
            static let instance : IAAssetsLibrary = IAAssetsLibrary()
        }
        return Static.instance
    }
   
}
