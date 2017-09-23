//
//  HeaderController.swift
//  TransitionTest
//
//  Created by Joseph Falcone on 9/22/17.
//  Copyright © 2017 Joseph Falcone. All rights reserved.
//

import UIKit

class HeaderController: UIViewController
{
    let label_Title = UILabel()
    var heightConstraint : NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1)
        label_Title.text = "HEADER"
        label_Title.textAlignment = .center
        label_Title.textColor = .white
        
        self.view.addSubview(label_Title)
        label_Title.constrain_edges(to: self.view)
        heightConstraint = label_Title.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.isActive = true
    }

    func setHeight(_ height : CGFloat)
    {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1.0, delay: 0, options: [], animations: {
            self.heightConstraint.constant = height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
