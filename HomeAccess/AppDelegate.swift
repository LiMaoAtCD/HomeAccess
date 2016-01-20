//
//  AppDelegate.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/8.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var mainBottomVC: ECSlidingViewController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setupSlidingViewController()

        let login = UserCenter.login()
        if login {

            self.window?.rootViewController = self.mainBottomVC
        } else{
            
            let loginVC = LoginViewController.initialFromStoryBoard() as! LoginViewController
            let loginNavigationController = LoginNavigationController(rootViewController: loginVC)
            
            window?.rootViewController = loginNavigationController
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchLoginVCToMain", name: UserCenter.kSwitchFromLoginVCToMainVC(), object: nil)
        }
       self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func setupSlidingViewController() {
        
//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        
//        let viewController = MainViewController.initialFromStoryBoard() as! MainViewController
//
//        
//        let leftButton = UIButton(type: .Custom)
//        leftButton.setTitle("Left", forState: .Normal)
//        leftButton.setTitleColor(UIColor.redColor(), forState: .Normal)
//        leftButton.addTarget(self, action: "archorLeft", forControlEvents: .TouchUpInside)
//        leftButton.frame = CGRectMake(0, 0, 40, 30)
//        let leftBarItem = UIBarButtonItem(customView: leftButton)
//
//        viewController.navigationItem.title = "云门"
//        viewController.navigationItem.leftBarButtonItem  = leftBarItem
//        viewController.view.backgroundColor = UIColor.whiteColor()
//        
//        
//        let navigationController = MainPageNavigationController(rootViewController: viewController)

    //        mainBottomVC = ECSlidingViewController.slidingWithTopViewController(navigationController)
//        mainBottomVC.underLeftViewController  = MenuViewController.initialFromStoryBoard()
//        
//        // enable swiping on the top view
//        navigationController.view.addGestureRecognizer(self.mainBottomVC.panGesture)
//        
//        // configure anchored layout
//        mainBottomVC.anchorRightPeekAmount  = 100.0
//        mainBottomVC.anchorLeftRevealAmount = 250.0
        
        mainBottomVC = ECSlidingViewController.initialFromStoryBoard() as! ECSlidingViewController
    }
    
    func archorLeft() {
        self.mainBottomVC.anchorTopViewToRightAnimated(true)
    }
    
    func switchLoginVCToMain() {
        self.window?.rootViewController = self.mainBottomVC
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

