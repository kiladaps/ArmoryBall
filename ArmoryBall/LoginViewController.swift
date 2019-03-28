//
//  LoginViewController.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 11/12/14.
//  Copyright (c) 2014 ArmoryBall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    var Usernamefield: UITextField = UITextField()
    var Passwordfield: UITextField = UITextField()


 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Background image
        let imageView = UIImageView(frame: CGRectMake(0,0,view.frame.width,view.frame.height));
        let image = UIImage(named: "background_signup.png");
        imageView.image = image;
        self.view.addSubview(imageView)
        // Background image
        //Username txtfield
        Usernamefield.frame = (frame: CGRectMake(view.frame.width/4.4,(view.frame.height/3.2), view.frame.width/1.8,view.frame.height/25));
        Usernamefield.returnKeyType = UIReturnKeyType.Done
        Usernamefield.delegate = self;
        Usernamefield.textColor=UIColor.whiteColor()
        let attributesDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor().colorWithAlphaComponent(7/10)]
        Usernamefield.attributedPlaceholder = NSAttributedString(string: "Username", attributes: attributesDictionary)
        self.view.addSubview(Usernamefield)
        //Username txtfield
        //Password txtfield
        Passwordfield.frame = (frame: CGRectMake(view.frame.width/4.4,(view.frame.height/2.655), view.frame.width/1.8,view.frame.height/25));
        Passwordfield.returnKeyType = UIReturnKeyType.Done
        Passwordfield.delegate = self;
        Passwordfield.textColor=UIColor.whiteColor()
        let attributesDictionary2 = [NSForegroundColorAttributeName: UIColor.whiteColor().colorWithAlphaComponent(7/10)]
        Passwordfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributesDictionary2)
        self.view.addSubview(Passwordfield)
        Passwordfield.secureTextEntry = true
        //Password txtfield
        //create account button
        let signupbutton = UIButton(type: UIButtonType.Custom)
        let signup = UIImage(named: "createaccount.png") as UIImage!
        signupbutton.setImage(signup, forState: .Normal)
        signupbutton.frame = CGRectMake((view.frame.width/2)-(194/2),(view.frame.height/1.35), 194,94.5)
        
        signupbutton.addTarget(self, action: "accountfunc:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signupbutton)
        self.view.bringSubviewToFront(signupbutton)

        //create account button
        //login button
        let loginbutton = UIButton(type: UIButtonType.Custom)
        let login = UIImage(named: "login.png") as UIImage!
        loginbutton.setImage(login, forState: .Normal)
        loginbutton.frame = CGRectMake((view.frame.width/2)-(view.frame.width/3.3),(view.frame.height/2.4), view.frame.width/1.65,view.frame.height/6)
        
        loginbutton.addTarget(self, action: "loginfunc:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(loginbutton)
        self.view.bringSubviewToFront(loginbutton)
        //login button
        
    }
    
    func accountfunc(sender: UIButton!) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : SignupViewController0 = storyboard.instantiateViewControllerWithIdentifier("SignupViewController0") as! SignupViewController0
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    func loginfunc(sender: UIButton!) {
        if Usernamefield.text == "" || Passwordfield.text == "" {
            let alert = UIAlertView()
            alert.title = "Invalid Input"
            alert.message = "Please fill out both fields"
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
        else{
            PFUser.logInWithUsernameInBackground(Usernamefield.text, password:Passwordfield.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                //login successfull
                let viewController:HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
                self.presentViewController(viewController, animated: true, completion: nil)
                let userDefaults = NSUserDefaults.standardUserDefaults()
                print(self.Usernamefield.text)
                userDefaults.setObject(self.Usernamefield.text, forKey: "username")
                userDefaults.setObject(self.Passwordfield.text, forKey: "password")
                userDefaults.synchronize()
            } else {
                //login failed
                let alert = UIAlertView()
                alert.title = "Warning"
                alert.message = "Username or Password is Incorrect"
                alert.addButtonWithTitle("Try Again")
                alert.show()
            }
        }
        }
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
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
