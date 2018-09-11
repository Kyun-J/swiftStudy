//
//  CustomUIBarButtonItem.swift
//  test
//
//  Created by 황견주 on 2018. 9. 10..
//  Copyright © 2018년 Kyun Joo, Hwang. All rights reserved.
//

import UIKit

private var actionKey: Void?

extension UIBarButtonItem {
    
    private var _action: () -> () {
        get {
            return objc_getAssociatedObject(self, &actionKey) as! () -> ()
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    convenience init(title: String?, style: UIBarButtonItemStyle, action: @escaping () -> ()) {
        self.init(title: title, style: style, target: nil, action: #selector(pressed))
        self.target = self
        self._action = action
    }
    
    @objc private func pressed(sender: UIBarButtonItem) {
        _action()
    }
    
}
