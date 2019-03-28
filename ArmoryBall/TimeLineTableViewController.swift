//
//  TimeLineTableViewController.swift
//  SwifferApp
//
//  Created by Kareem Khattab on 11/8/14.
//  Copyright (c) 2014 Kareem Khattab. All rights reserved.
//

import UIKit

class TimeLineTableViewController: UITableViewController {
    var timelineData = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    @IBAction func loadData(){
        timelineData.removeAll(keepCapacity: false)
        
            let findTimelineData:PFQuery = PFQuery(className:"Sweets")
            findTimelineData.findObjectsInBackgroundWithBlock
                {
                    (objects:[AnyObject]! , error:NSError!) -> Void in
                    if error == nil
                    {
                        self.timelineData = Array(objects.reverse()) as! [PFObject]
                        
                        
                        //let array:NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                    
                        print(objects)
                    
                       // self.timelineData = array as NSMutableArray
                    
                    
                        self.tableView.reloadData()
                    
                }
            }
        self.refreshControl?.endRefreshing()
    }

    
/*
    @IBAction func loadData()
    {
        timelineData.removeAllObjects()
        
        var findTimelineData : PFQuery = PFUser.query()
        findTimelineData.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]!, error: NSError!)-> Void in
            if error == nil
            {
                println("No error")
                
                if let objects = objects as? [PFObject!]
                {
                    for object in objects
                    {
                        self.timelineData.addObject(object)
                    }
                }
                
                let array : NSArray = self.timelineData.reverseObjectEnumerator().allObjects
                self.timelineData = array as NSMutableArray
                
                self.tableView.reloadData()
            }
            
        }
    }

*/
    
    override func viewDidAppear(animated: Bool) {
        
        self.loadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

 override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
    let numberofrows : Int = timelineData.count
    if numberofrows > 35 {
        return 35}
    else{
        return numberofrows
    }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: SweetTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SweetTableViewCell
        
        let sweet: PFObject = self.timelineData[indexPath.row] as PFObject
        
        cell.sweetTextView.alpha = 0
        cell.timestampLabel.alpha = 0
        cell.usernameLabel.alpha = 0
        
        cell.sweetTextView.text = sweet.objectForKey("content") as! String
        
        
        
        let dataFormatter:NSDateFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "MMM-dd hh:mm a"
        cell.timestampLabel.text = dataFormatter.stringFromDate(sweet.createdAt)
        /*
        if view.frame.width == 320.0 {
            cell.bounds = CGRect(x: 19,y: 19,width: 100,height: 100)
            cell.timestampLabel.text = dataFormatter.stringFromDate(sweet.createdAt) + "____"}
        if view.frame.width == 375.0 {
            cell.bounds = CGRect(x: 5,y: 5,width: 100,height: 100)
            cell.timestampLabel.text = dataFormatter.stringFromDate(sweet.createdAt)}
        if view.frame.width == 414.0 {
            cell.bounds = CGRect(x: -12.5,y: -12.5,width: 100,height: 100)
            cell.timestampLabel.text = dataFormatter.stringFromDate(sweet.createdAt)}

        */
        
        let findSweeter: PFQuery = PFUser.query()
        findSweeter.whereKey("objectId", equalTo: sweet.objectForKey("sweeter").objectId)
        

        
        findSweeter.findObjectsInBackgroundWithBlock{
            (objects:[AnyObject]!, error:NSError!)->Void in
            if (error == nil){
                let user:PFUser = (objects as NSArray).lastObject as! PFUser
                cell.usernameLabel.text = user.username
                
                UIView.animateWithDuration(0.5, animations: {
                 cell.sweetTextView.alpha = 1
                 cell.timestampLabel.alpha = 1
                 cell.usernameLabel.alpha = 1 
                })
                
            }
        }
        return cell
    }
    
    
    @IBAction func PopView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
