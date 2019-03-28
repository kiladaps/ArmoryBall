//
//  PickupViewController.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 12/1/14.
//  Copyright (c) 2014 ArmoryBall. All rights reserved.
//

import UIKit

class PickupViewController: UIViewController {

    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let width : CGFloat = view.frame.width
        let height2 : CGFloat = view.frame.height/2
        let height : CGFloat = view.frame.height
        //bkg img
        if height == 480 {
            let imageView = UIImageView(frame: CGRectMake(0,0,view.frame.width+2,view.frame.height+88))
            let image = UIImage(named: "choose.png");
            imageView.image = image;
            self.view.addSubview(imageView)
        }
        else{
            let imageView = UIImageView(frame: CGRectMake(0,0,view.frame.width+2,view.frame.height))
            let image = UIImage(named: "choose.png");
            imageView.image = image;
            self.view.addSubview(imageView)
        }
        //backbutton
        let backbutton = UIButton(type: UIButtonType.Custom)
        let back = UIImage(named: "backbutton.png") as UIImage!
        backbutton.setImage(back, forState: .Normal)
        backbutton.frame = CGRectMake(40,10, height*(45/410),height*(45/401))
        backbutton.addTarget(self, action: "backpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backbutton)
        self.view.bringSubviewToFront(backbutton)
        //backbutton



        
    }
    
    func backpress(sender: UIButton!) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : HomeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        self.presentViewController(vc, animated: true, completion: nil)

    }

    
    func nopickuppress(sender: UIButton!) {

    }
    
    func pickuppress(sender: UIButton!) {

    }


}
