//
//  File.swift
//  DPTransition
//
//  Created by Dave on 11/07/2019.
//

import UIKit

@objc public protocol DPTransition {
    @objc optional var transitionDuration: TimeInterval { get }
}
