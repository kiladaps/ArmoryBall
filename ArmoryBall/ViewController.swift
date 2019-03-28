
import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource
{
  //image arrays for tutorials with different ios screen sizes
  var pageViewController : UIPageViewController?
  var pageTitles : Array<String> = ["page1", "page2"]
  var pageImages4s : Array<String> = ["page14s.png", "page24s.png"]
  var pageImages5 : Array<String> = ["page15.png", "page25.png"]
  var pageImages6 : Array<String> = ["page16.png", "page26.png"]
  var pageImages6plus : Array<String> = ["page16plus.png", "page26plus.png"]


  var currentIndex : Int = 0
    
  override func viewDidLoad()
  {
    super.viewDidLoad()

    pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    pageViewController!.dataSource = self
    
    let startingViewController: InstructionView = viewControllerAtIndex(0)!
    let viewControllers: NSArray = [startingViewController]
    pageViewController!.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: false, completion: nil)
    pageViewController!.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    
    addChildViewController(pageViewController!)
    view.addSubview(pageViewController!.view)
    pageViewController!.didMoveToParentViewController(self)
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
  {
    var index = (viewController as! InstructionView).pageIndex
    
    if (index == 0) || (index == NSNotFound) {
      return nil
    }
    
    index--
    
    return viewControllerAtIndex(index)
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
  {
    var index = (viewController as! InstructionView).pageIndex
    
    if index == NSNotFound {
      return nil
    }
    
    index++
    
    if (index == self.pageTitles.count) {
      return nil
    }
    
    return viewControllerAtIndex(index)
  }
  
  func viewControllerAtIndex(index: Int) -> InstructionView?
  {
    if self.pageTitles.count == 0 || index >= self.pageTitles.count
    {
      return nil
    }
    let widthscreen : CGFloat = view.frame.height
    
    var check : Bool = false;
    // decides which images to used based on which ios device is running
    let pageContentViewController = InstructionView()
    if widthscreen == 480.0 {
        pageContentViewController.imageFile = pageImages4s[index]
        check=true}
    if widthscreen == 568.0 {
        pageContentViewController.imageFile = pageImages5[index]
        check=true}
    if widthscreen == 667.0 {
        pageContentViewController.imageFile = pageImages6[index]
        check=true}
    if widthscreen == 736.0 {
        pageContentViewController.imageFile = pageImages6plus[index]
        check=true}
    if check == false {
        pageContentViewController.imageFile = pageImages5[index]
    }
    pageContentViewController.titleText = pageTitles[index]
    pageContentViewController.pageIndex = index
    currentIndex = index
    
    return pageContentViewController
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
  {
    return self.pageTitles.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
  {
    return 0
  }
  
}
