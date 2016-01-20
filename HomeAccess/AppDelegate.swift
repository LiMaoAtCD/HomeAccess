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
    
    var mainBottomVC: ECSlidingViewController! = {
        let viewcontroller = ECSlidingViewController.initialFromStoryBoard() as! ECSlidingViewController
    
        return viewcontroller
    }()
    
    var loginNavigationController: LoginNavigationController! = {
        let loginVC = LoginViewController.initialFromStoryBoard() as! LoginViewController
        let loginNavigationController = LoginNavigationController(rootViewController: loginVC)
        return loginNavigationController
    }()

    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if UserCenter.login() {
            
            self.window?.rootViewController = self.mainBottomVC
        } else{
            
            window?.rootViewController = loginNavigationController
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchLoginVCToMainVC", name: kViewControlerFromLoginToMain, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchMainVCToLoginVC", name: kViewControlerFromMainToLogin, object: nil)

        }
        
       mainBottomVC.anchorRightPeekAmount = kLeftMenuWidth;

       self.window?.makeKeyAndVisible()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        return true
    }
    
    func switchLoginVCToMainVC() {
        self.window?.rootViewController = self.mainBottomVC
    }
    
    func switchMainVCToLoginVC() {
        self.window?.rootViewController = self.loginNavigationController
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

