//
//  ViewController.swift
//  MenuApp
//
//  Created by Teja on 3/15/18.
//  Copyright © 2018 Teja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menuisOpen:Bool = false
  
    
    
    @IBOutlet weak var menuWidth: NSLayoutConstraint!
    
    @IBOutlet weak var leadingSpaceForMenuView: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    
    @IBAction func toggleMenu(_ sender: Any) {
                toggleMenuView()
            }
    
    private func toggleMenuView(){
    
        menuisOpen = !menuisOpen
        if menuisOpen == true {
            menuView.isHidden = false
            leadingSpaceForMenuView.constant = 0
           
        }else{
            
            self.leadingSpaceForMenuView.constant = -menuWidth.constant
    
        }

        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        { (completion) in
            if self.menuisOpen == false{
                self.menuView.isHidden = true
            }else{
                self.menuView.isHidden = false
            }
        }
            
        }
        
        
    
    
    
    
    
    
    @IBAction func showVC1(_ sender: Any) {
        removeChildViewController()
        self.addViewControllerAsChildViewController(childViewController: ViewC1)
        toggleMenuView()
    }
    
  
    @IBAction func showVC2(_ sender: Any) {
        removeChildViewController()
        self.addViewControllerAsChildViewController(childViewController: ViewC2)
        toggleMenuView()
    }
    
    @IBAction func showVC3(_ sender: Any) {
        removeChildViewController()
        self.addViewControllerAsChildViewController(childViewController: ViewC3)
        toggleMenuView()
    }
    
    
    
    
    
    lazy var ViewC1:VC1 = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "VC1") as! VC1
        //self.addViewControllerAsChildViewController(childViewController: vc)
        return vc
    }()
    
    lazy var ViewC2:VC2 = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "VC2") as! VC2
        //self.addViewControllerAsChildViewController(childViewController: vc)
        return vc
    }()
    
    lazy var ViewC3:VC3 = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "VC3") as! VC3
        //self.addViewControllerAsChildViewController(childViewController: vc)
        return vc
    }()
    
    
    
    
    
    
    @IBOutlet weak var  vc1Button:UIButton!
    
    @IBOutlet weak var vc2Button:UIButton!
    
    @IBOutlet weak var  vc3Button:UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addViewControllerAsChildViewController(childViewController: ViewC1)
        
        self.leadingSpaceForMenuView.constant = -menuWidth.constant
        self.menuView.layer.shadowColor = UIColor.black.cgColor
        self.menuView.layer.shadowOffset = CGSize(width: 4, height: 2)
        self.menuView.layer.shadowRadius = 6
        self.menuView.layer.shadowOpacity = 0.7
        self.menuView.isHidden = true
        
    }

    
    
    
    
    
    private func addViewControllerAsChildViewController(childViewController : UIViewController)
    {
        self.addChildViewController(childViewController)
        self.view.insertSubview(childViewController.view, at: 0)
        childViewController.view.frame = self.view.bounds
        childViewController.view.autoresizingMask = [UIViewAutoresizing.flexibleHeight,UIViewAutoresizing.flexibleWidth]
        childViewController.didMove(toParentViewController: self)
        
    }

    
    private func removeChildViewController(){
        
        for child in childViewControllers
        {
            //child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            //child.removeFromParentViewController()
        }
    }
    
    
    
    
    
    
    
    

}

