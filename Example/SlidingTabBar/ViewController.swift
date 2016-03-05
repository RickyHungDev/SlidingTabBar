//
//  ViewController.swift
//  SlidingTabBar
//
//  Created by Adam Bardon on 03/03/2016.
//  Copyright (c) 2016 Adam Bardon. All rights reserved.
//

import UIKit
import SlidingTabBar

class ViewController: UITabBarController, SlidingTabBarDataSource, SlidingTabBarDelegate, UITabBarControllerDelegate {
    
    var tabBarView: SlidingTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tabBar.hidden = true
        
        let tabBarFrame = self.tabBar.frame
        self.selectedIndex = 1
        
        tabBarView = SlidingTabBar(frame: tabBarFrame, initialTabBarItemIndex: 1)
        tabBarView.tabBarBackgroundColor = UIColor(rgba: "#39434E")
        tabBarView.tabBarItemTintColor = UIColor(rgba: "#6F8595")
        tabBarView.selectedTabBarItemTintColor = UIColor(rgba: "#FDFCFA")
        tabBarView.selectedTabBarItemColors = [UIColor(rgba: "#D93434"), UIColor(rgba: "#81DB34"), UIColor(rgba: "#25BCEE"), UIColor(rgba: "#F8C60D"), UIColor(rgba: "#F59618")]
        tabBarView.slideAnimationDuration = 0.6
        tabBarView.datasource = self
        tabBarView.delegate = self
        tabBarView.setup()
        
        // UITabBarControllerDelegate, for animationControllerForTransitionFromViewController
        self.delegate = self
        
        self.view.addSubview(tabBarView)
    }
    
    // MARK: - SlidingTabBarDataSource
    
    func tabBarItemsInSlidingTabBar(tabBarView: SlidingTabBar) -> [UITabBarItem] {
        return tabBar.items!
    }
    
    // MARK: - SlidingTabBarDelegate
    
    func didSelectViewController(tabBarView: SlidingTabBar, atIndex index: Int) {
        self.selectedIndex = index
    }
    
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return SlidingTabAnimatedTransitioning(transitionDuration: 0.6)
    }
}

