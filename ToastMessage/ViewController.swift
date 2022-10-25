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
        if buttonpressed == 1{
            showToast()
        }
    }
    
    
    //Check Transition of the device
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
            if buttonpressed == 1{
                addConstraintCheckDeviceType()
        }
    }
    
    
    //Loads tost message from another UiView on same View Controller
    func showToast() {
        view.addSubview(customView)
        customView.layer.cornerRadius = 7
        addConstraintCheckDeviceType()
    }
    
    
     //Create Iphone Constraints
    func iphoneConstrainst(cView:UIView){
        cView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 370).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -25).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 50).isActive = true
        }
    
    
    //Create Ipad Constraints
    func ipadConstraint(cView:UIView){
        cView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 370).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -50).isActive = true
        NSLayoutConstraint(item: cView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 70).isActive = true
            }
    
    //Add constraint on the view after checking device type
    func addConstraintCheckDeviceType(){
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        switch (deviceIdiom) {
        case .pad:
            ipadConstraint(cView: customView)
        case .phone:
            iphoneConstrainst(cView: customView)
        default:
            print("another")
        }
    }
}

