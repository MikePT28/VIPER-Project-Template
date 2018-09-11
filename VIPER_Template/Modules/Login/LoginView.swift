//
//  LoginView.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import UIKit

final class LoginView: BaseView {
    
    var presenter: LoginPresenterProtocol!
    
    //Outlets
    fileprivate var header: UILabel!
    fileprivate var subtitle: UILabel!
    fileprivate var divider: UIView!
    fileprivate var headerStackView: UIStackView!
    fileprivate var emailField: UITextField!
    fileprivate var passwordField: UITextField!
    fileprivate var loginButton: UIButton!
    fileprivate var errorLabel: UILabel!
    fileprivate var formStackView: UIStackView!
    fileprivate var card: CardView!
    
    private enum ViewTraits {
        static let marging: CGFloat = 24.0
        static let innerCardPadding: CGFloat = 8.0
        static let verticalSpacing: CGFloat = 4.0
        static let dividerHeight: CGFloat = 1.0
    }
    
    override func setupComponents() {
        view.backgroundColor = .vPurple
        
        header = .header
        header.text = "Welcome back!"
        
        subtitle = .subtitle
        subtitle.text = "Please log in."
    
        headerStackView = UIStackView(arrangedSubviews: [header, subtitle])
        headerStackView.axis = .vertical
        headerStackView.alignment = .center
        headerStackView.distribution = .fillEqually
        headerStackView.spacing = ViewTraits.verticalSpacing
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        divider = UIView()
        divider.backgroundColor = .vBlack
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        emailField = .email
        passwordField = .password
        
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = .buttonTitle
        loginButton.addTarget(self, action: #selector(loginAction(_:)), for: .touchUpInside)
        
        errorLabel = .error
        
        formStackView = UIStackView(arrangedSubviews: [emailField, passwordField, loginButton])
        formStackView.axis = .vertical
        formStackView.alignment = .fill
        formStackView.distribution = .fillProportionally
        formStackView.spacing = ViewTraits.verticalSpacing
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        
        card = CardView()
        card.backgroundColor = .white
        card.translatesAutoresizingMaskIntoConstraints = false
        
        card.addSubview(headerStackView)
        card.addSubview(divider)
        card.addSubview(formStackView)
        view.addSubview(card)
    }
    
    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            headerStackView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: ViewTraits.innerCardPadding),
            headerStackView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -ViewTraits.innerCardPadding),
            headerStackView.topAnchor.constraint(equalTo: card.topAnchor, constant: ViewTraits.innerCardPadding),
            headerStackView.bottomAnchor.constraint(equalTo: divider.topAnchor, constant: -ViewTraits.verticalSpacing),
            
            divider.heightAnchor.constraint(equalToConstant: ViewTraits.dividerHeight),
            divider.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: ViewTraits.innerCardPadding),
            divider.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -ViewTraits.innerCardPadding),
            divider.bottomAnchor.constraint(equalTo: formStackView.topAnchor, constant: -ViewTraits.innerCardPadding),
            
            formStackView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: ViewTraits.innerCardPadding),
            formStackView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -ViewTraits.innerCardPadding),
            formStackView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -ViewTraits.innerCardPadding),
            
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ViewTraits.marging),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ViewTraits.marging),
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
            ])
        
    }
    
    @objc fileprivate func loginAction(_ sender: Any?) {
        presenter.doLogin(email: emailField.text, password: passwordField.text)
    }
}

extension LoginView: LoginViewProtocol {
 
    func showError(message: String) {
        if !formStackView.subviews.contains(errorLabel) {
            formStackView.addArrangedSubview(errorLabel)
        }
        errorLabel.text = message
    }
    
    func removeError() {
        formStackView.removeArrangedSubview(errorLabel)
        errorLabel.removeFromSuperview()
    }
}
