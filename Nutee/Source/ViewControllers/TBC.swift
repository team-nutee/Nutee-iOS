//
//  TBC.swift
//  Nutee
//
//  Created by Junhyeon on 2020/02/04.
//  Copyright © 2020 S.OWL. All rights reserved.
//

import UIKit

class TBC: UITabBarController {
    
    //    let addBtn = UIButton.init(type: .custom)
    //    let menuButton = UIButton(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setupMiddleButton()
        //        menuButton.addTarget(self, action: #selector(toPost), for: .touchUpInside)
    }
    
    //    func setupMiddleButton() {
    //        let numberOfItems = CGFloat(tabBar.items!.count)
    //        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
    //        menuButton.frame = CGRect(x: 0, y: 0, width: tabBarItemSize.width, height: tabBar.frame.size.height)
    //        var menuButtonFrame = menuButton.frame
    //        menuButtonFrame.origin.y = self.view.bounds.height - menuButtonFrame.height - self.view.safeAreaInsets.bottom
    //        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
    //        menuButton.frame = menuButtonFrame
    ////        menuButton.backgroundColor = UICo
    //        self.view.addSubview(menuButton)
    //        self.view.layoutIfNeeded()
    //    }
    //
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        menuButton.frame.origin.y = self.view.bounds.height - menuButton.frame.height - self.view.safeAreaInsets.bottom
    //    }
    
    
    @objc func toPost() {
        //        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostVC") as! PostVC
        //        vc.modalPresentationStyle = .fullScreen
        //
        //        self.present(vc, animated: true, completion: nil)
        self.selectedIndex = 2
    }
    //        addBtn.setTitle("add", for: .normal)
    //        addBtn.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
    ////        addBtn.backgroundColor = .nuteeGreen
    //        addBtn.layer.borderWidth = 0.5
    //        addBtn.layer.borderColor = UIColor.nuteeGreen.cgColor
    //        self.tabBar.addSubview(addBtn)
    //    }
    //
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        addBtn.frame = CGRect.init(x: self.tabBar.center.x - 32, y: self.view.bounds.height - 10, width: 40, height: 40)
    //        addBtn.layer.cornerRadius = 20
    //    }
    
}

extension TBC : UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2{
            print("3")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostVC") as! PostVC
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
        } else {
            
        }
    }
}


