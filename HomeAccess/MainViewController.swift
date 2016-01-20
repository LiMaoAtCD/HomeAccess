//
//  MainViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/19.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let dynamicTransition = MEDynamicTransition()
    let zoomAnimationController = MEZoomAnimationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //选择动态还是缩放
        self.dynamicTransition.slidingViewController = self.slidingViewController()
        dynamicArchorLeftMenu()
//        zoomArchorLeftMenu()
        
        
        //设置页面通知
        setUpNotifications()
        
        self.title = "云门"
        
    }
    
    
    //Mark:
    func setUpNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotoSetting", name: kViewControllerFromMainVCToSetVC, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotoRecording", name: kViewControllerFromMainVCToRecordVC, object: nil)

    }
    
    func gotoSetting() {
        let setVC = SetViewController.initialFromStoryBoard() as! SetViewController
        self.navigationController?.pushViewController(setVC, animated: false)
    }
    
    func gotoRecording() {
        let recordVC = RecordViewController.initialFromStoryBoard() as! RecordViewController
        self.navigationController?.pushViewController(recordVC, animated: false)

    }
    
    //Mark: 左滑控制
    
    func dynamicArchorLeftMenu() {
        
        self.slidingViewController().delegate = dynamicTransition
        self.slidingViewController().topViewAnchoredGesture = [ECSlidingViewControllerAnchoredGesture.Tapping, ECSlidingViewControllerAnchoredGesture.Custom]
        self.slidingViewController().customAnchoredGestures = [self.dynamicTransitionPanGesture()]
        self.navigationController?.view.removeGestureRecognizer(self.slidingViewController().panGesture)
        self.navigationController?.view.addGestureRecognizer(self.dynamicTransitionPanGesture())
    }
    
    func zoomArchorLeftMenu() {
        
        self.slidingViewController().delegate = zoomAnimationController
        self.slidingViewController().topViewAnchoredGesture = [.Tapping,.Panning]
        self.slidingViewController().customAnchoredGestures = []
        self.navigationController?.view.removeGestureRecognizer(self.dynamicTransitionPanGesture())
        self.navigationController?.view.addGestureRecognizer(self.slidingViewController().panGesture)
    }
    
    func dynamicTransitionPanGesture() -> UIPanGestureRecognizer {
        let dynamicTransitionPanGesture = UIPanGestureRecognizer(target: self.dynamicTransition, action: "handlePanGesture:")
        return dynamicTransitionPanGesture
    }
    
    
    //Mark:
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
}
