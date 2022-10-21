//
//  ViewController.swift
//  ToastMessage
//
//  Created by Satyabrata on 12/10/22.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    var buttonpressed = 0
    let customView = ChangesGetView().loadNib()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func changeSetResultDone(_ sender: UIButton) {
        buttonpressed = 1
        showToast()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
//        coordinator.animate(alongsideTransition: nil){ [self] (context) in
//            let orientation = UIDevice.current.orientation
            let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
//            print(orientation)
            if buttonpressed == 1{
                switch deviceIdiom{
                case .pad:
                    ipadPortrait(cView: customView)
                    
                case .phone:
                    if UIDevice.current.orientation.isLandscape {
                                landScape(cView: customView)
                            } else {
                                portrait(cView: customView)
                            }
                    
                default:
                    print("nothing")
                    
                }
                
                
                
//            }
        }
            
            
        
    }
    func getDeviceOrientation() -> Bool {
        return UIDevice.current.orientation.isValidInterfaceOrientation
                        ? UIDevice.current.orientation.isLandscape
                        : UIApplication.shared.statusBarOrientation.isLandscape
    }

    
    //Loads tost message from another UiView on same View Controller
    func showToast() {
        view.addSubview(customView)
        customView.layer.cornerRadius = 7
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        switch (deviceIdiom) {
        case .pad:
            if buttonpressed == 1{
              ipadPortrait(cView: customView)
            }
        case .phone:
            if buttonpressed == 1{
                if getDeviceOrientation() {
                    landScape(cView: customView)
                }
                else{
                    portrait(cView: customView)
                }
            }
        default:
            print("another")
        }
        
        
    }
        
    func portrait(cView:UIView){
        cView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 370).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -25).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 50).isActive = true
        }
        
    func landScape(cView:UIView){
            cView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 370).isActive = true
            NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -25).isActive = true
            NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 50).isActive = true
        }
    func ipadPortrait(cView:UIView){
        cView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 370).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -50).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 70).isActive = true
            }
//    func ipadLandscape(cView:UIView){
//        cView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 360).isActive = true
//        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -360).isActive = true
//        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -50).isActive = true
//        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 70).isActive = true
//
//    }
       
        
        
        
        
    
}

