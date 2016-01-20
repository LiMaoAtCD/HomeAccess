//
//  SetViewController.swift
//  HomeAccess
//
//  Created by AlienLi on 16/1/20.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

    var dynamicTransitionPanGesture: UIPanGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "个人设置"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configureGesture()
    }
    
    func configureGesture() {
        
        let dynamicTransition = self.slidingViewController().delegate
        
        if dynamicTransition is MEDynamicTransition {
            if let _ = dynamicTransitionPanGesture {
            } else {
                dynamicTransitionPanGesture = UIPanGestureRecognizer(target: dynamicTransition, action: "handlePanGesture:")
            }
            
            self.navigationController?.view.removeGestureRecognizer(self.slidingViewController().panGesture)
            self.navigationController?.view.addGestureRecognizer(dynamicTransitionPanGesture!)
        } else {
            self.navigationController?.view.removeGestureRecognizer(dynamicTransitionPanGesture!)
            self.navigationController?.view.addGestureRecognizer(self.slidingViewController().panGesture)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
