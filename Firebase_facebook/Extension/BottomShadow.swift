//
//  BottomShadow.swift
//  Firebase_facebook
//
//  Created by IPS-149 on 16/03/23.
//


import UIKit
//
//@IBDesignable
//class ShadowView: UIView {
//
//    @IBInspectable var shadowColor: UIColor = UIColor.black {
//        didSet {
//            layer.shadowColor = shadowColor.cgColor
//        }
//    }
//
//    @IBInspectable var shadowOpacity: Float = 0.5 {
//        didSet {
//            layer.shadowOpacity = shadowOpacity
//        }
//    }
//
//    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 2.0) {
//        didSet {
//            layer.shadowOffset = shadowOffset
//        }
//    }
//
//    @IBInspectable var shadowRadius: CGFloat = 2.0 {
//        didSet {
//            layer.shadowRadius = shadowRadius
//        }
//    }
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//            didSet {
//                layer.cornerRadius = cornerRadius
//            }
//        }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//
//    private func setup() {
//        layer.masksToBounds = false
//        layer.borderColor = UIColor.black.cgColor
//        layer.borderWidth = 0
//    }
//
//}

class BottomShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ininitalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ininitalSetup()
    }
    private func ininitalSetup(){
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.cornerRadius = 20
    }
}
