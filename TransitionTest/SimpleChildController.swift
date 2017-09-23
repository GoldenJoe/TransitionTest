//
//  SimpleChildController.swift
//  TransitionTest
//
//  Created by Joseph Falcone on 9/22/17.
//  Copyright © 2017 Joseph Falcone. All rights reserved.
//

import UIKit

class SimpleChildController : UIViewController
{
    let label_Title = UILabel()
    let button_Next = UIButton()
    let button_Prev = UIButton()
    
    public var action_prev: () -> () = {
        // Does nothing on its own
    }
    public var action_next: () -> () = {
        // Does nothing on its own
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //safearealayoutguide
        // +
        //layoutmargin
        
        label_Title.backgroundColor = .white
        label_Title.numberOfLines = 0
        button_Prev.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        button_Next.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        button_Prev.setTitle("PREV", for: .normal)
        button_Next.setTitle("NEXT", for: .normal)
        
        button_Prev.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        button_Next.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(label_Title)
        view.addSubview(button_Next)
        view.addSubview(button_Prev)
        
        label_Title.constrain_centerX(to: view)
        label_Title.constrain_top(to: view)
        label_Title.constrain_height(60)
        
        button_Next.constrain_width(100)
        button_Next.constrain_height(60)
        button_Next.constrain_right(to: self.view, offset: -20)
        button_Next.constrain_bottom(to: self.view, offset: -20)
        
        button_Prev.constrain_width(100)
        button_Prev.constrain_height(60)
        button_Prev.constrain_left(to: self.view, offset: 20)
        button_Prev.constrain_bottom(to: self.view, offset: -20)
        
//        view.constrain_stack([button_Prev, button_Next], axis: .horizontal, alignment: .bottom, spacing: 10, insets: UIEdgeInsetsMake(0, 20, 10, 20))
//        [button_Prev, button_Next].constrain_width()
    }
    
    @objc func buttonPressed(sender: UIButton) {
        if sender == button_Prev {
            action_prev()
        }
        if sender == button_Next {
            action_next()
        }
    }
}
