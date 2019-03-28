//
//  SignupViewController2.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 2/28/15.
//  Copyright (c) 2015 ArmoryBall. All rights reserved.
//

import UIKit

class SignupViewController2: UIViewController {
    
    var recievedusername: String = ""
    var recievedpassword: String = ""
    var recievedemail: String = ""
    var recievedataspot: Int = 0

    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PopView(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    
    @IBAction func CheckBeforeMoving(sender: AnyObject) {
        let emailchar = Array(recievedemail.lowercaseString.characters)
        let firstnamechar = Array(firstname.text!.lowercaseString.characters)
        let lastnamechar = Array(lastname.text!.lowercaseString.characters)
        var fncheck = 0
        var lncheck = 0
        var fnchecksize = 0
        var lnchecksize = 0
        let fnsize = firstname.text!.characters.count
        let lnsize = lastname.text!.characters.count
        while(emailchar[recievedataspot]=="0" || emailchar[recievedataspot]=="1" || emailchar[recievedataspot]=="2" || emailchar[recievedataspot]=="3" || emailchar[recievedataspot]=="4" || emailchar[recievedataspot]=="5" || emailchar[recievedataspot]=="6" || emailchar[recievedataspot]=="7" || emailchar[recievedataspot]=="8" || emailchar[recievedataspot]=="9"){
            recievedataspot-=1
        }
        if(emailchar[0]==lastnamechar[0]){
            lncheck=1
        }
        if(emailchar[recievedataspot]==firstnamechar[0]){
            fncheck=1
        }
        if(fnsize>=2){
            fnchecksize=1
        }
        if(lnsize>=2){
            lnchecksize=1
        }
        if(fncheck==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "First Name Does Not Match Email"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else if(lncheck==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Last Name Does Not Match Email"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else if(fnchecksize==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "First Name must Be At Least 2 Characters"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else if(lnchecksize==0){
            let alert1 = UIAlertView()
            alert1.title = "Warning"
            alert1.message = "Last Name must Be At Least 2 Characters"
            alert1.addButtonWithTitle("Try Again")
            alert1.show()
        }
        else{
            //go to next vc
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
