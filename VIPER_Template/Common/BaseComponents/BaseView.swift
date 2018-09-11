//
//  BaseView.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import UIKit.UIViewController

protocol ViewSetupProtocol {
    func setupComponents()
    func setupConstraints()
}

class BaseView: UIViewController, ViewSetupProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupConstraints()
    }
    
    func setupComponents() {
        fatalError("Missing implementation of \"setupComponents\"")
    }
    
    func setupConstraints() {
        fatalError("Missing implementation of \"setupConstraints\"")
    }

}
