//
//  Gradient.swift
//  NuclearSocialNetwork
//
//  Created by Hellizar on 10/8/20.
//

import UIKit


@IBDesignable class LDGradientView: UIView {
    
    let view = UIView()
    let gradient = CAGradientLayer()
    override func draw(_ rect: CGRect) {
        gradient.colors = [UIColor.yellow.cgColor , UIColor.black.cgColor]
        gradient.locations = [0 as NSNumber, 1 as NSNumber]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        view.layer.addSublayer(gradient)
        gradient.frame = view.bounds
    }
    
    
}
