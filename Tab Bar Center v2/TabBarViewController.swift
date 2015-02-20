//
//  TabBarViewController.swift
//  Tab Bar Center v2
//
//  Created by Jorge Crisóstomo Palacios on 2/20/15.
//  Copyright (c) 2015 videmor. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCenterButtonWithImage(UIImage(named: "camera_button_take.png")!, highlightImage: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCenterButtonWithImage(buttonImage: UIImage, highlightImage: UIImage?){
        let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.autoresizingMask = UIViewAutoresizing.FlexibleRightMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleBottomMargin | UIViewAutoresizing.FlexibleTopMargin
        
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height)
        button.setBackgroundImage(buttonImage, forState: UIControlState.Normal)
        button.setBackgroundImage(highlightImage, forState: UIControlState.Highlighted)
        button.addTarget(self, action: "buttonEvent", forControlEvents: UIControlEvents.TouchUpInside)
        
        var heightDifference: CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        
        if (heightDifference < 0){
            button.center = self.tabBar.center
        }else{
            var center: CGPoint = self.tabBar.center
            center.y = center.y - heightDifference/2.0
            button.center = center
        }
        
        
        self.view.addSubview(button)
        
    }

    func buttonEvent() {
        self.selectedIndex = 1
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
