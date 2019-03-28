//
//  HomeViewController.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 11/13/14.
//  Copyright (c) 2014 ArmoryBall. All rights reserved.
//

import UIKit
import MessageUI

let fullRotation = CGFloat(M_PI * 2)
let animation = CAKeyframeAnimation()
var refresher = UIImageView(frame: CGRectMake(0,0,0,0));
var totalatgym=0;


class HomeViewController: UIViewController , MFMailComposeViewControllerDelegate {
    var bannerView:GADBannerView?
    var interstitial:GADInterstitial?
    var timer:NSTimer?
    var loadRequestAllowed = true
    var bannerDisplayed = false
    var adcheck : Bool = false
    
    func GoogleAdRequestTimer() {
        if (!loadRequestAllowed) {
            print("load request not allowed")
            return
        }
        
        print("load request")
        bannerView?.loadRequest(GADRequest())
    }
    
    func AppBecomeActive() {
        print("received UIApplicationDidBecomeActiveNotification")
        loadRequestAllowed = true
    }
    
    func AppResignActive() {
        print("received UIApplicationWillResignActiveNotification")
        loadRequestAllowed = false
    }
    
    //Interstitial func
    func createAndLoadInterstitial()->GADInterstitial {
        print("createAndLoadInterstitial")
        let interstitial = GADInterstitial()
        interstitial.adUnitID = "ca-app-pub-4096710336898575/5568239049"
        interstitial.loadRequest(GADRequest())
        
        return interstitial
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //ads
        interstitial = createAndLoadInterstitial()
        bannerView = GADBannerView( frame: CGRect(x: 0,y: 0,width: view.frame.width,height: 50))
        bannerView?.adUnitID = "ca-app-pub-4096710336898575/3312776648"
        //bannerView?.delegate = self
        bannerView?.rootViewController = self
        bannerView?.loadRequest(GADRequest())
        
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(40, target: self, selector: "GoogleAdRequestTimer", userInfo: nil, repeats: true)

        //ads
        //precomputed
        let width : CGFloat = view.frame.width
        let width2 : CGFloat = view.frame.width/2
        let height : CGFloat = view.frame.height
        //4 and 4s fix
        var spacing : CGFloat = 4
        var spacing2 : CGFloat = 9
        if height == 480.0 {
            spacing = 15
            spacing2 = 12}
        //Background
        let imageView = UIImageView(frame: CGRectMake(0,0,view.frame.width,view.frame.height));
        let image = UIImage(named: "homebackground.jpg");
            imageView.image = image;
            self.view.addSubview(imageView)
        //background
        //computedsizes
        var fontsize : CGFloat = 0
        var xside : CGFloat = 0
        var yside : CGFloat = 0
        var widthfeild : CGFloat = 0
        var heightfeild : CGFloat = 0
        var refreshx : CGFloat = 0
        var refreshy: CGFloat = 0
        var refreshsize : CGFloat = 0
        var Totalx : CGFloat = 0
        var Totaly : CGFloat = 0
        var Totalwidth : CGFloat = 0
        var Totalheight : CGFloat = 0
        var Totalsize : CGFloat = 0


        //4s
        if height == 480.0 {
            refreshx=246
            refreshy=55
            refreshsize=70
            fontsize=130
            xside=80
            yside=110
            widthfeild=160
            heightfeild=120
            Totalx=5
            Totaly=70
            Totalwidth=160
            Totalheight=40
            Totalsize=40
            
        }
        //4s
        //5
        if height == 568{
            refreshx=246
            refreshy=52
            refreshsize=70
            xside=60
            yside=125
            widthfeild=200
            heightfeild=140
            fontsize=165
            Totalx=5
            Totaly=70
            Totalwidth=160
            Totalheight=40
            Totalsize=40
        }
        //5
        //6
        if height == 667{
            refreshx=300
            refreshy=52
            refreshsize=70
            xside=45
            yside=130
            widthfeild=290
            heightfeild=190
            fontsize=230
            Totalx=5
            Totaly=70
            Totalwidth=185
            Totalheight=50
            Totalsize=46
        }
        //6
        //6plus
        if height == 736{
            refreshx=300
            refreshy=55
            refreshsize=90
            xside=62
            yside=154
            widthfeild=290
            heightfeild=190
            fontsize=230
            Totalx=5
            Totaly=75
            Totalwidth=230
            Totalheight=55
            Totalsize=55
        }
        //6plus
        //test
        //refresh
        refresher = UIImageView(frame: CGRectMake(refreshx,refreshy,refreshsize,refreshsize));
        let refresh = UIImage(named: "refresh.png");
        refresher.image = refresh
        self.view.addSubview(refresher)
        animation.keyPath = "transform.rotation.z"
        animation.duration = 1
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = 2
        animation.values = [fullRotation*0, fullRotation, fullRotation*3/4, fullRotation]
        let RefreshPress = UIButton(type: UIButtonType.Custom)
        RefreshPress.frame = CGRectMake(refreshx,refreshy,refreshsize,refreshsize)
        let Pressedrefresh = UIImage(named: "Pressed.png") as UIImage!
        RefreshPress.setImage(Pressedrefresh, forState:  UIControlState.Highlighted)
        RefreshPress.addTarget(self, action: "refreshpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(RefreshPress)
        //refresh
        //mainnumber
        let PickupNumber: UITextField = UITextField(frame: CGRect(x: xside,y: yside,width: widthfeild,height: heightfeild));
        self.view.addSubview(PickupNumber)
        //PickupNumber.backgroundColor = UIColor.redColor()
        PickupNumber.textColor = UIColor(red: 0xf7/255, green: 0x7e/255, blue: 0x00/255, alpha: 1)
        PickupNumber.text="88";
        PickupNumber.font = UIFont (name: "Avenir-Black", size: fontsize)
        PickupNumber.textAlignment = .Center
        let PickupNumberButton = UIButton(type: UIButtonType.Custom)
        PickupNumberButton.frame = CGRectMake(xside,yside,widthfeild,heightfeild)
        let Pressed = UIImage(named: "Pressed.png") as UIImage!
        PickupNumberButton.setImage(Pressed, forState:  UIControlState.Highlighted)
        PickupNumberButton.addTarget(self, action: "ballpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(PickupNumberButton)
        //mainnumber
        //totalballing
        let TotalNumber: UITextField = UITextField(frame: CGRect(x: Totalx,y: Totaly,width: Totalwidth,height: Totalheight));
        self.view.addSubview(TotalNumber)
        //TotalNumber.backgroundColor = UIColor.redColor()
        TotalNumber.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        TotalNumber.text="Total:88";
        TotalNumber.font = UIFont (name: "Avenir-Black", size: Totalsize)
        let TotalNumberButton = UIButton(type: UIButtonType.Custom)
        TotalNumberButton.frame = CGRectMake(Totalx,Totaly,Totalwidth,Totalheight)
        let Pressed3 = UIImage(named: "Pressed.png") as UIImage!
        TotalNumberButton.setImage(Pressed, forState:  UIControlState.Highlighted)
        TotalNumberButton.addTarget(self, action: "refreshpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(TotalNumberButton)

        //totalballing
        //ballloader
        let ballloader = UIImageView(frame: CGRectMake(width2-height/8.2, height-(height/4.1)-6, height/4.1, (height/4.1)));
        let ball = UIImage(named: "ball.png");
        ballloader.image = ball;
        self.view.addSubview(ballloader)
        //ballloader
        //trophybutton
        let trophybutton = UIButton(type: UIButtonType.Custom)
        let trophy = UIImage(named: "Trophybutton.png") as UIImage!
        trophybutton.setImage(trophy, forState: .Normal)
        trophybutton.frame = CGRectMake(spacing, height/1.5, height*(7/41), (height*(7/41)))
        trophybutton.addTarget(self, action: "ballpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(trophybutton)
        self.view.bringSubviewToFront(trophybutton)
        //trophybutton
        //clockbutton
        let clockbutton = UIButton(type: UIButtonType.Custom)
        let clock = UIImage(named: "Clockbutton.png") as UIImage!
        clockbutton.setImage(clock, forState: .Normal)
        clockbutton.frame = CGRectMake(width-height*(7/41)-spacing, height/1.5, height*(7/41), (height*(7/41)))
        clockbutton.addTarget(self, action: "clockpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(clockbutton)
        self.view.bringSubviewToFront(clockbutton)
        //clockbutton
        //messagebutton
        let messagebutton = UIButton(type: UIButtonType.Custom)
        let message = UIImage(named: "Messagebutton.png") as UIImage!
        messagebutton.setImage(message, forState: .Normal)
        messagebutton.frame = CGRectMake(width/2-height*(57/820),height-(height/4.1)-height*(57/410)-15, height*(57/410),height*(57/401))
        messagebutton.addTarget(self, action: "messagepress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(messagebutton)
        self.view.bringSubviewToFront(messagebutton)
        //messagebutton
        //donatebutton
        let donatebutton = UIButton(type: UIButtonType.Custom)
        let donate = UIImage(named: "Donatebutton.png") as UIImage!
        donatebutton.setImage(donate, forState: .Normal)
        let donatewidth : CGFloat = width2-(height/8.2)-(height*(45/820))-spacing2
        donatebutton.frame = CGRectMake(donatewidth,height/2+height/20,height*(45/410),height*(45/401))
        donatebutton.addTarget(self, action: "ballpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(donatebutton)
        self.view.bringSubviewToFront(donatebutton)
        //donatebutton
        //emailbutton
        let emailbutton = UIButton(type: UIButtonType.Custom)
        let email = UIImage(named: "Emailbutton.png") as UIImage!
        emailbutton.setImage(email, forState: .Normal)
        let emailwidth : CGFloat = width2+(height/8.2)+spacing2-(height*(45/820))
        emailbutton.frame = CGRectMake(emailwidth,height/2+height/20, height*(45/410),height*(45/401))
        emailbutton.addTarget(self, action: "emailpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(emailbutton)
        self.view.bringSubviewToFront(emailbutton)
        //emailbutton
        //logoutbutton
        let logoutbutton = UIButton(type: UIButtonType.Custom)
        let logout = UIImage(named: "Logoutbutton.png") as UIImage!
        logoutbutton.setImage(logout, forState: .Normal)
        logoutbutton.frame = CGRectMake(width-height*(45/410)-3,height-height*(45/410)-3, height*(45/410),height*(45/401))
        logoutbutton.addTarget(self, action: "signoutpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(logoutbutton)
        self.view.bringSubviewToFront(logoutbutton)
        //logoutbutton
        

//button that will send user to home screen that is in tutorial
// Do any additional setup after loading the view.
        self.view.addSubview(bannerView!)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        //jgtcjkhgckhc
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        let Username : NSString = userDefaults.objectForKey("username")! as! NSString
        let Password : NSString = userDefaults.objectForKey("password")! as! NSString
        PFUser.logInWithUsernameInBackground(Username as String, password:Password as String) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                //login successfull
                activityView.stopAnimating()
                } else {
                //login failed
                let viewController:LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
                self.presentViewController(viewController, animated: true, completion: nil)
            }
        }

        
        let button = UIButton(type: UIButtonType.Custom)
        let Ballcolor : AnyObject = userDefaults.objectForKey("ballcolor")!
        let Ballcolorstring : NSString = Ballcolor as! NSString
        let ball = UIImage(named: Ballcolorstring as String) as UIImage!
        button.setImage(ball, forState: .Normal)
        button.frame = CGRectMake(view.frame.width/2-view.frame.height/8.2, view.frame.height-(view.frame.height/4.1)-6, view.frame.height/4.1, (view.frame.height/4.1))
        
        button.addTarget(self, action: "ballpress:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        self.view.bringSubviewToFront(button)
        }
    
    func ballpress(sender: UIButton!) {
        adcheck = true
        interstitial?.presentFromRootViewController(self)
        interstitial = createAndLoadInterstitial()
    }
    func messagepress(sender: UIButton!) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : TimeLineTableViewController = storyboard.instantiateViewControllerWithIdentifier("TimeLineTableViewController") as! TimeLineTableViewController
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    
    func clockpress(sender: UIButton!) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : ScheduleViewController = storyboard.instantiateViewControllerWithIdentifier("ScheduleViewController") as! ScheduleViewController
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)

    }
    
    func emailpress(sender: UIButton!) {
        let emailTitle = "Feedback"
        let messageBody = "Feature request or bug report?"
        let toRecipents = ["kiladaps@gmail.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }
        
    func refreshpress(sender: UIButton!) {
        refresher.layer.addAnimation(animation, forKey: "rotate")

    }
        
    func signoutpress(sender: UIButton!) {
        let createAccountErrorAlert: UIAlertView = UIAlertView()
        
        createAccountErrorAlert.delegate = self
        
        createAccountErrorAlert.title = "Sign Out"
        createAccountErrorAlert.message = "Are you sure you want to sign out?"
        createAccountErrorAlert.addButtonWithTitle("Logout")
        createAccountErrorAlert.addButtonWithTitle("Go Back")
        
        createAccountErrorAlert.show()
        
    }
    func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
        switch buttonIndex{
            
        case 1:
            break;
        case 0:
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setObject("", forKey: "username")
            userDefaults.setObject("", forKey: "password")
            userDefaults.synchronize()
            let viewController:LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
            self.presentViewController(viewController, animated: true, completion: nil)
            break;
        default:
            break;
            //Some code here..
            
        }
    }
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: %@", [error!.localizedDescription])
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }
    override func viewWillAppear(animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        if adcheck == true {
            let pviewController:PickupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PickupViewController") as! PickupViewController
            self.presentViewController(pviewController, animated: true, completion: nil)
        }
        
        

    }
    

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


