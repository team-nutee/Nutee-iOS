//
//  Util.swift
//  Nutee
//
//  Created by Junhyeon on 2020/01/06.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import Foundation
import UIKit

class LoadingHUD: NSObject {
    private static let sharedInstance = LoadingHUD()
    
    private var backgroundView: UIView?
    private var popupView: UIImageView?
    private var loadingLabel: UILabel?
    
    class func hide() {
        if let popupView = sharedInstance.popupView,
            let loadingLabel = sharedInstance.loadingLabel,
        let backgroundView = sharedInstance.backgroundView {
            popupView.stopAnimating()
            backgroundView.removeFromSuperview()
            popupView.removeFromSuperview()
            loadingLabel.removeFromSuperview()
        }
    }

    class func show() {
        let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        let popupView = UIImageView()//= UIImageView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 500))
        popupView.contentClippingRect
        popupView.animationImages = LoadingHUD.getAnimationImageArray()
        popupView.animationDuration = 0.8
        popupView.animationRepeatCount = 0
        
        let loadingLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        loadingLabel.text = "Loading ..."
        loadingLabel.font = UIFont.boldSystemFont(ofSize: 20)
        loadingLabel.textColor = .black
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backgroundView)
            window.addSubview(popupView)
            window.addSubview(loadingLabel)
            
            backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
            backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            
            popupView.frame = CGRect(x: 0, y: 0,width: window.frame.maxX, height: window.frame.maxY)
            popupView.startAnimating()
            
            loadingLabel.layer.position = CGPoint(x: window.frame.midX, y: popupView.frame.maxY + 10)
            
            sharedInstance.backgroundView?.removeFromSuperview()
            sharedInstance.popupView?.removeFromSuperview()
            sharedInstance.loadingLabel?.removeFromSuperview()
            sharedInstance.backgroundView = backgroundView
            sharedInstance.popupView = popupView
            sharedInstance.loadingLabel = loadingLabel
        }
    }

    public class func getAnimationImageArray() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "nuteeLoading_00")!)
        animationArray.append(UIImage(named: "nuteeLoading_01")!)
        animationArray.append(UIImage(named: "nuteeLoading_02")!)
        animationArray.append(UIImage(named: "nuteeLoading_03")!)
        animationArray.append(UIImage(named: "nuteeLoading_04")!)
        animationArray.append(UIImage(named: "nuteeLoading_05")!)
        animationArray.append(UIImage(named: "nuteeLoading_06")!)
        animationArray.append(UIImage(named: "nuteeLoading_07")!)
        animationArray.append(UIImage(named: "nuteeLoading_08")!)
        animationArray.append(UIImage(named: "nuteeLoading_09")!)
        return animationArray
    }
}