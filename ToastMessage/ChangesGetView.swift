//
//  ChangesGetView.swift
//  ToastMessage
//
//  Created by Satyabrata on 14/10/22.
//

import UIKit

class ChangesGetView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var changesTextLabel: UILabel!
    
    @IBAction func getChangesAction(_ sender: Any) {
    }
  
}

extension UIView {
    //Loads Instance from nib of same UiView
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
