//
//  TextField.swift
//  FirstAnimation
//
//  Created by lumanxi on 15/10/16.
//  Copyright © 2015年 fanfan. All rights reserved.
//

import UIKit

class TextField: UITextField {


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        super.drawRect(rect)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillEllipseInRect(context, CGRectMake(0, self.bounds.height - 1, self.bounds.width, 1));
    }


}
