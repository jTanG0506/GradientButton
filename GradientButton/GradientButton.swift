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
  
  @IBInspectable var startColour: UIColor?
  @IBInspectable var endColour: UIColor?
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    if let startColour = startColour, let endColour = endColour {
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = [startColour.cgColor, endColour.cgColor]
      gradientLayer.frame = self.bounds
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
      self.layer.insertSublayer(gradientLayer, at: 0)
    }
  }
  
}
