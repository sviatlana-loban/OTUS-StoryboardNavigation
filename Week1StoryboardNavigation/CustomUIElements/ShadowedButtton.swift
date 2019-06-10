//
//  DesignableButtton.swift
//  Week1StoryboardNavigation
//
//  Created by Admin on 6/1/19.
//  Copyright © 2019 SLoban. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowedButtton: UIButton {
    @IBInspectable
    var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity/100
        }
    }

}
