//
//  ViewController.swift
//  FirstAnimation
//
//  Created by lumanxi on 15/10/16.
//  Copyright © 2015年 fanfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var sun: UIImageView!
    
    
    @IBOutlet var cloudBig: UIImageView!
    
    
    @IBOutlet var username: UITextField!
    
    
    @IBOutlet var password: UITextField!
    
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ///背景
        imageView.frame = view.bounds;
        view.addSubview(imageView)
        
        //太阳
        sun.frame = CGRectMake(40, 20, 60, 60)
        view.addSubview(sun)
        
        //云
        cloudBig.frame = CGRectMake(230, 20, 120, 60)
        view.addSubview(cloudBig)
        
        
        ///用户名
        
        
        username.leftView = UIImageView(image: UIImage(named: "FirstAnimation-UserName"))
        username.leftViewMode = UITextFieldViewMode.Always;
        username.frame = CGRectMake(10, view.bounds.height - 360, view.bounds.width - 20, 40)
        view.addSubview(username)
        
        //密码
        password.leftView = UIImageView(image: UIImage(named: "FirstAnimation-Password"))
        password.leftViewMode = UITextFieldViewMode.Always;
        password.frame = CGRectOffset(username.frame, 0, 50);
        view.addSubview(password)
        
        //登陆
        loginButton.center = CGPointMake(view.center.x, 430);
        view.addSubview(loginButton)
        
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        self.loginButton.center.y += 30
        self.loginButton.alpha = 0
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
//        delay：顾名思义，动画迟延执行的时间。
//        options：自定义动画的一些效果，比如重复动画、前后运动等。这个参数在后面的文章中会说明。
//        completion：也是一个闭包，当动画执行完之后会执行该闭包中的逻辑，可以用来连接动画，或者是在动画结束后你需要做一些清理工作等。

        
        let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI))
        UIView.animateWithDuration(1, animations: {
            self.sun.transform = rotation
        })
        
        /*
        位置和大小
        
        bounds：改变视图内容的位置和尺寸大小的属性。
        frame：改变视图的位置和尺寸大小的属性。
        center：改变视图位置的属性。
        外观
        
        backgroundColor：改变背景色时，UIKit会线性的从原始颜色转变为目标颜色。
        alpha：改变透明度，UIKit会创建淡入淡出的效果。
        转换
        
        transform属性的类型为CGAffineTransform，它是一个结构体，CoreGraphics中有若干方法可生成不同的CGAffineTransform结构，使视图旋转、按比例缩放、翻转等，我们来看看它如何使用。在viewDidAppear()方法中添加如下代码：
        */
        //首先创建了一个旋转的结构，参数是一个CGFloat类型的角度，这里我们使用预定义好的常量比如M_PI代表3.14...，也就是旋转一周、M_PI_2代表1.57...，也就是旋转半周等。
        

        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(1, animations: {
            self.cloudBig.transform = scale
        })
        
        UIView.animateWithDuration(0.5, animations: {
            self.username.center.x += self.view.bounds.width
//            self.password.center.x += self.view.bounds.width
        })
        
//        UIView.animateWithDuration(0.5, delay: 0.3, options: .AllowUserInteraction, animations: {
//            self.password.center.x += self.view.bounds.width
//        }, completion: nil)
        
        
        //重复类
            
//            .Repeat：该属性可以使你的动画永远重复的运行。
//            .Autoreverse：该属性可以使你的动画当运行结束后按照相反的行为继续运行回去。该属性只能和.Repeat属性组合使用。
        
        //可以看到密码输入框不停的从左向右滑入。大家可以自己试试.Autoreverse的效果或者[.Repeat, .Autoreverse]组合效果。
//        UIView.animateWithDuration(0.5, delay: 0.3, options: [.Repeat, .Autoreverse], animations: {
//            self.password.center.x += self.view.bounds.width
//        }, completion: nil)
        
        
        /*
        动画缓冲
        
        在现实生活中，几乎没有什么东西可以突然开始运动，然后突然停止一动不动。可以运动的物体基本都是以较慢的速度启动，逐渐加速，达到一个稳定的速度，然后当要停止时，会逐渐减速，最后停止。所以要使动画更加逼真，也可以采用这种方式，那就是ease-in和ease-out。
            
            .CurveLinear ：该属性既不会使动画加速也不会使动画减速，只是做以线性运动。
                .CurveEaseIn：该属性使动画在开始时加速运行。
                .CurveEaseOut：该属性使动画在结束时减速运行。
                .CurveEaseInOut：该属性结合了上述两种情况，使动画在开始时加速，在结束时减速。
        */
        
    
        UIView.animateWithDuration(0.5, delay: 0.3, options: [.Repeat, .Autoreverse, .CurveEaseOut], animations: {
            self.password.center.x += self.view.bounds.width
        }, completion: nil)
        
        
        
        //usingSpringWithDamping：弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
       // initialSpringVelocity：弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
        
        
        //大家需要注意的一点是，弹簧动画并不只作用于位置的变化，它可以作用于所有动画属性的变化，比如我们在animations的闭包中除了位置的变化外，还有透明度的变化，它也同样有弹簧动画的效果，只不过它没有位置变化那么明显和贴近真实，它会表现出一闪一闪的效果：
        UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 20, options: .AllowUserInteraction, animations: {
            self.loginButton.center.y -= 30
            self.loginButton.alpha = 1
        }, completion: nil)

    }
    
    
    
    
    @IBAction func login(sender: UIButton) {
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            self.loginButton.bounds.size.width += 25
        }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            self.loginButton.center.y += 10
        }, completion: nil)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    


}

