//
//  JFConstriantsSimple.swift
//  AppleSupport_AutoLayoutCollectionView
//
//  Created by Joseph Falcone on 9/17/17.
//  Copyright © 2017 Joseph Falcone. All rights reserved.
//

import UIKit

// Stripped down version of an AutoLayout sugar class that I wrote. The "constrain" prefix makes it easier to read layouts in code.

public extension UIView
{
    public func constrain_edges(toSafeAreaLayoutGuideOf to: UIView, excludingEdge: UIRectEdge? = nil, insets: UIEdgeInsets = .zero)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if excludingEdge != .top {
            self.topAnchor      .constraint(equalTo: to.safeAreaLayoutGuide.topAnchor,      constant: insets.top)     .isActive = true
        }
        if excludingEdge != .bottom {
            self.bottomAnchor   .constraint(equalTo: to.safeAreaLayoutGuide.bottomAnchor,   constant: insets.bottom)   .isActive = true
        }
        if excludingEdge != .left {
            self.leftAnchor     .constraint(equalTo: to.safeAreaLayoutGuide.leftAnchor,     constant: insets.left)     .isActive = true
        }
        if excludingEdge != .right {
            self.rightAnchor    .constraint(equalTo: to.safeAreaLayoutGuide.rightAnchor,    constant: insets.right)    .isActive = true
        }
    }
    
    public func constrain_edges(to: UIView, excludingEdge: UIRectEdge? = nil, insets: UIEdgeInsets = .zero)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if excludingEdge != .top {
            self.topAnchor      .constraint(equalTo: to.topAnchor,      constant: insets.top)      .isActive = true
        }
        if excludingEdge != .bottom {
            self.bottomAnchor   .constraint(equalTo: to.bottomAnchor,   constant: insets.bottom)   .isActive = true
        }
        if excludingEdge != .left {
            self.leftAnchor     .constraint(equalTo: to.leftAnchor,     constant: insets.left)     .isActive = true
        }
        if excludingEdge != .right {
            self.rightAnchor    .constraint(equalTo: to.rightAnchor,    constant: insets.right)    .isActive = true
        }
    }
    
    public func constrain_height(_ height: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    public func constrain_width(_ width: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    public func constrain_top(to: UIView, offset: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: to.topAnchor, constant: offset).isActive = true
    }
    
    public func constrain_topToBottom(of: UIView, offset: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: of.bottomAnchor, constant: offset).isActive = true
    }
    
    public func constrain_bottom(to: UIView, offset: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: offset).isActive = true
    }
    
    public func constrain_left(to: UIView, offset: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: to.leftAnchor, constant: offset).isActive = true
    }
    
    public func constrain_right(to: UIView, offset: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        rightAnchor.constraint(equalTo: to.rightAnchor, constant: offset).isActive = true
    }
    
    public func constrain_center(in view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    public func constrain_centerX(to view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    public func constrain_centerY(to view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
