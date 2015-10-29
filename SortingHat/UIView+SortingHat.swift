//
//  UIView+SortingHat.swift
//  SortingHat
//
//  Created by Charles Hart on 10/20/15.
//  Copyright © 2015 busybusy. All rights reserved.
//

import UIKit


extension UILabel {
    class func potterStyledLabel(house:HogwartsHouse) -> UILabel {
        let label = UILabel()
        
        label.textAlignment = .Center
        label.textColor = house.houseColor()
        label.font = UIFont(name: "Futura-Medium", size: 24)
        
        return label
    }
}


extension UIView {
    
    func explosionRemove(height:CGFloat, classToExplode:AnyClass) -> Bool {
        if height < 100 {
            
            for sub:UIView in self.subviews {
                if sub.isKindOfClass(classToExplode) {
                    let randomTime = Double(Int(arc4random_uniform(UInt32(12))))
                    let randomXDirection = Int(arc4random_uniform(UInt32(2)))
                    let randomYDirection = Int(arc4random_uniform(UInt32(2)))
                    UIView.animateWithDuration(randomTime * 0.15, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                        
                        sub.frame = CGRectMake(randomXDirection == 0 ? sub.frame.origin.x + self.frame.size.width : sub.frame.origin.x - self.frame.size.width , randomYDirection == 0 ? sub.frame.origin.y + self.frame.size.height : sub.frame.origin.y - self.frame.size.height, sub.frame.size.width, sub.frame.size.height)
                        
                        if randomYDirection == 0 {
                            sub.frame = CGRectMake(sub.frame.origin.x, sub.frame.origin.y + self.frame.size.height, sub.frame.size.width, sub.frame.size.height)
                            
                        } else {
                            sub.frame = CGRectMake(sub.frame.origin.x, sub.frame.origin.y - self.frame.size.height, sub.frame.size.width, sub.frame.size.height)
                            
                        }
                        }, completion: { (success:Bool) -> Void in
                            sub.removeFromSuperview()
                            
                    })
                }
            }
            return true
        }
        
        return false
    }
    
    
}