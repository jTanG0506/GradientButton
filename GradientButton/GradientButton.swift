//
//  GradientButton.swift
//  GradientButton
//
//  Created by Jonathan Tang on 10/04/2018.
//  Copyright © 2018 jtang0506. All rights reserved.
//  Source: http://github.com/jTanG0506/GradientButton
//

import UIKit

@IBDesignable
class GradientButton: UIButton {
  
  // Default gradient is horizontal.
  @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5)
  @IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5)
  
  // Allow selection from predefined directions.
  // See documentation for more details.
  @IBInspectable var usePrefinedDirection: Bool = false
  @IBInspectable var direction: Int = 0
  
  @IBInspectable var startColour: UIColor?
  @IBInspectable var endColour: UIColor?
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if let startColour = startColour, let endColour = endColour {
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [startColour.cgColor, endColour.cgColor]
      gradientLayer.frame = self.bounds
      
      if usePrefinedDirection {
        switch direction {
        case 1:
          gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
          gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        case 2:
          gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
          gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        case 3:
          gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
          gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        default:
          gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
          gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
      } else {
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
      }

      self.layer.insertSublayer(gradientLayer, at: 0)
    }
  }
  
}
