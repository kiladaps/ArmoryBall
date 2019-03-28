//
//  SignupViewController1.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 2/27/15.
//  Copyright (c) 2015 ArmoryBall. All rights reserved.
//

import UIKit

class SignupViewController1: UIViewController {
    
    var recievedusername: String = ""
    var recievedpassword: String = ""
    var atspot=0

    @IBOutlet weak var Email1: UITextField!
    
    @IBOutlet weak var Email2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NextViewController: SignupViewController2 = segue.destinationViewController as! SignupViewController2
        NextViewController.recievedusername = recievedusername
        NextViewController.recievedpassword = recievedpassword
        NextViewController.recievedemail = Email1.text!
        NextViewController.recievedataspot = atspot-1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PopView(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func CheckBeforeMoving(sender: AnyObject) {
        var atcheck=0
        var sizecheck=0
        var samecheck=0
        var rpicheck=0
        var emailcheck = []
        var emailsize = Email1.text!.characters.count
        var email: String = Email1.text!
        let emailchar = Array(email.characters)
        for(var i=0;i<emailsize;i++){
            if(emailchar[i]=="@"){
                atspot=i
                atcheck=1
                if(emailsize == i+8){
                    sizecheck=1
                    if(Email1.text==Email2.text){
                        samecheck=1
                        if(emailchar[i+1]=="r" && emailchar[i+2]=="p" && emailchar[i+3]=="i" && emailchar[i+4]=="." && emailchar[i+5]=="e" && emailchar[i+6]=="d" && emailchar[i+7]=="u" ){
                            rpicheck=1;
                        }
                    }
                }
                
                
            }
        }
        if(atcheck==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Not a Valid Email"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else if(rpicheck==0 && sizecheck==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Must Enter A Valid RPI Email"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else if(samecheck==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Email Adresses Do Not Match"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }

        else{
            self.performSegueWithIdentifier("Signin1-2", sender: nil)

        }
    }


}
