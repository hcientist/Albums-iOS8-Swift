//
//  AssetsLibrary.swift
//  Albums
//
//  Created by Michael Stewart on 10/27/14.
//  Copyright (c) 2014 iOS in Action. All rights reserved.
//

import UIKit
import AssetsLibrary

class AssetsLibrary: ALAssetsLibrary {
   
    class var singelton : AssetsLibrary {
        struct Static {
            static let instance : AssetsLibrary = AssetsLibrary()
        }
        return Static.instance
    }
    
}
