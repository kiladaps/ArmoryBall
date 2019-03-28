//
//  ScheduleViewController.swift
//  ArmoryBall
//
//  Created by PJ Spadalik on 1/3/15.
//  Copyright (c) 2015 ArmoryBall. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var Schedule: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url : NSURL! = NSURL(string: "http://www.fhsaslhonorsociety.com/2014_15_Building_Schedule.pdf")
        Schedule.loadRequest(NSURLRequest(URL: url))


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func PopView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
