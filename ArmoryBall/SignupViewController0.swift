//
//  SignupViewContoller0.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 2/27/15.
//  Copyright (c) 2015 ArmoryBall. All rights reserved.
//

import UIKit

class SignupViewController0: UIViewController {
 
    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password1: UITextField!
    
    @IBOutlet weak var Password2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NextViewController: SignupViewController1 = segue.destinationViewController as! SignupViewController1
        NextViewController.recievedusername = Username.text!
        NextViewController.recievedpassword = Password1.text!
    }

    
    @IBAction func PopView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func CheckBeforeMoving(sender: AnyObject) {
        var check1: Int = 0
        let user : String = Username.text!.lowercaseString
        let pass : String = Password1.text!
        let usersize = user.characters.count
        if(usersize>=6){
        if(Password1.text==Password2.text && pass.characters.count>=6){
            let query : PFQuery = PFUser.query()
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if !(error != nil) {
                    var i=0;
                    while((i<objects.count) && check1==0){
                        let object=objects[i] as! PFObject;
                        let name = object.objectForKey("username") as! String;
                        if(name==user){
                            check1=1
                        }
                        i++;
                        
                    }
                    if(check1==1){
                        let alert = UIAlertView()
                        alert.title = "Warning"
                        alert.message = "User Already Exists"
                        alert.addButtonWithTitle("Try Again")
                        alert.show()
                    }
                    else{
                        self.performSegueWithIdentifier("Signin0-1", sender: nil)

                    }
                }

            }
        
        }
        else{
            let alert1 = UIAlertView()
            if(pass.characters.count<=6){
                alert1.title = "Warning"
                alert1.message = "Enter A Password That Is At Least 6 Characters Long"
                alert1.addButtonWithTitle("Try Again")
                alert1.show()
            }
            else{
            alert1.title = "Warning"
            alert1.message = "Passwords Do Not Match"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        }

    }
        else{
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Username Must Be At Least 6 Characters Long"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
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


}