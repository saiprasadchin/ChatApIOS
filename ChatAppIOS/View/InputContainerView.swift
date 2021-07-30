//
//  InputContainerView.swift
//  ChatAppIOS
//
//  Created by saiprasad chindam on 25/07/21.
//

import UIKit

class InputContainerView: UIView {
    
    init(image: UIImage, textField: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        backgroundColor = UIColor.clear
        
        let iv = UIImageView(image: image)
        iv.tintColor = .white
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(left: leftAnchor, paddingTop: 8)
        iv.setDimensions(height: 24, width: 24)
        
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(left: iv.rightAnchor, right: rightAnchor, paddingLeft: 8)
    
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,  height: 0.8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
