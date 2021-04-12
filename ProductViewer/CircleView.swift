//
//  CircleView.swift
//  ProductViewer
//
//  Created by Royce Reynolds on 4/8/21.
//  Copyright © 2021 Target. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = CAShapeLayer()
        let originX = self.bounds.origin.x
        let originY = self.bounds.origin.y
        layer.path = UIBezierPath(roundedRect: CGRect(x: originX, y: originY, width: self.bounds.size.width, height: self.bounds.size.height), cornerRadius: self.bounds.size.width/2).cgPath
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
        
        
    }
    
    

}
