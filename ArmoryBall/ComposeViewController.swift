


//
//  ComposeViewController.swift
//  SwifferApp
//
//  Created by Kareem Khattab on 11/8/14.
//  Copyright (c) 2014 Kareem Khattab. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate{

    @IBOutlet var sweetTextView: UITextView! = UITextView()
    @IBOutlet var charRemainingLabel: UILabel! = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        sweetTextView.layer.borderWidth = 0.5
        sweetTextView.layer.cornerRadius = 5
        sweetTextView.delegate = self
        //Open the keyboard when user hits the TextView
        sweetTextView.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendSweet(sender: AnyObject) {
        
        if sweetTextView.text == "" {
            let alert = UIAlertView()
            alert.title = "Warning"
            alert.message = "Feild Cannot Be Blank"
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
        else{
        let sweet:PFObject = PFObject(className: "Sweets")
        sweet["content"] = sweetTextView.text
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.saveInBackgroundWithTarget(nil , selector: nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    func textView(textView: UITextView,
        shouldChangeTextInRange range: NSRange,
        replacementText text: String) -> Bool{
            let newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
            let remainingChar:Int = 140 - newLength
            
            charRemainingLabel.text = "\(remainingChar)"
            
            return (newLength > 140) ? false : true
            
        
    }
    
    @IBAction func PopView(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
