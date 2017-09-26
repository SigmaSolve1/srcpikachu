//
//  UIButton+RoundedCorner.swift
//  Welatte
//
//  Created by Akash on 07/04/16.
//  Copyright © 2016 Akash. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIView {
    
    func showLoader() {
        if !UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.beginIgnoringInteractionEvents()
        }
        SVProgressHUD.show(withStatus: "Loading")
    }
    
    func hideLoader() {
        if UIApplication.shared.isIgnoringInteractionEvents {
            UIApplication.shared.endIgnoringInteractionEvents()
        }
        SVProgressHUD.dismiss()
    }
    
    func addShadowin_All_Side() {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    func corner(_ radius: CGFloat, borderColor: UIColor? = nil, borderWidth: CGFloat? = nil) {
        var layer = CALayer()
        layer = self.layer
        layer.masksToBounds = true
        
        // Corner Radius
        layer.cornerRadius = radius
        
        // Border Color
        if let borderColor = borderColor {
            layer.borderColor = borderColor.cgColor
        }
        
        // Border Width
        if let borderWidth = borderWidth {
            layer.borderWidth = borderWidth
        }
    }
    
    
    func addDropShadowToView(){
        self.layer.masksToBounds =  false
        self.layer.shadowColor = UIColor.blue.cgColor;
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
    }
    
    func dropShadow() {
        var viewLayer = CALayer()
        viewLayer = self.layer
        viewLayer.shadowColor = UIColor.lightGray.cgColor
        viewLayer.shadowOpacity = 0.8;
        viewLayer.shadowOffset = CGSize.zero
        viewLayer.shadowRadius = 3.0;
    }
    
    func applyPlainShadow() {
        let layer = self.layer
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 8.0
        layer.cornerRadius = self.frame.size.height/2
        layer.masksToBounds = false
    }
    
    enum viewBorderMain: String {
        case Left = "borderLeft"
        case Right = "borderRight"
        case Top = "borderTop"
        case Bottom = "borderBottom"
    }
    
    func addBorder(_ vBorder: viewBorderMain, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.name = vBorder.rawValue
        switch vBorder {
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: Screen.width - width, y: 0, width: width, height: self.frame.size.height)
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: Screen.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: Screen.width, height: width)
        }
        self.layer.addSublayer(border)
    }
    
    func removeBorder(_ border: viewBorderMain , view : UIView) {
        var layerForRemove: CALayer?
        for layer in view.layer.sublayers! {
            if layer.name == border.rawValue {
                layerForRemove = layer
            }
        }
        if let layer = layerForRemove {
            layer.removeFromSuperlayer()
        }
    }
}
