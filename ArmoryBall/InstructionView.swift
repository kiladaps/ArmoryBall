
import UIKit

class InstructionView: UIViewController
{
  
  var pageIndex : Int = 0
  var titleText : String = ""
  var imageFile : String = ""
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    //setting username and password to blank
    let userDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.setObject("", forKey: "username")
    userDefaults.setObject("", forKey: "password")
    userDefaults.synchronize()
    // code for tutorial
    view.backgroundColor = UIColor(patternImage: UIImage(named: imageFile)!)
    //will allow the tutorial to only show up once
    if pageIndex==0{
        let myint : Int = 1
        let bcolor : NSString = "ball.png"
        let Ad : NSString = "false"
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(myint, forKey: "alreadyopened")
        userDefaults.setObject(bcolor, forKey: "ballcolor")
        userDefaults.setObject(Ad, forKey: "pagead")
        userDefaults.synchronize()

    }
    //will bring up the button on the last tutorial screen
    if pageIndex==1 {
    let button = UIButton(type: UIButtonType.System)
    button.titleLabel!.font = UIFont(name: "Arial", size: 20)
    button.frame = CGRectMake(20, view.frame.height - 100, view.frame.width - 40, 50)
    button.setTitle(titleText, forState: UIControlState.Normal)
    button.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(button)
    }
  }
    //button that will send user to home screen that is in tutorial
    func pressed(sender: UIButton!) {
        let viewController:LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        self.presentViewController(viewController, animated: true, completion: nil)
    }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
}
