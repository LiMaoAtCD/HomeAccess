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
//        dynamicArchorLeftMenu()
        zoomArchorLeftMenu()
        
    }
    
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
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
}
