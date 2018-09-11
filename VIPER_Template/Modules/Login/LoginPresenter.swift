//
//  LoginPresenter.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: BaseViewProtocol {
    
    func showError(message: String)
    func removeError()
}

protocol LoginPresenterProtocol: BasePresenterProtocol {
    
    func doLogin(email: String?, password: String?)
}

final class LoginPresenter<T: LoginViewProtocol, U: LoginRouterProtocol>: BasePresenter<T, U> {
    
    fileprivate let loginInteractor: LoginInteractorProtocol
    fileprivate let emailValidator: EmailValidatable
    fileprivate let passwordValidator: PasswordValidatable
    
    init(view: T,
         router: U,
         loginInteractor: LoginInteractorProtocol,
         emailValidator: EmailValidatable = EmailValidator(),
         passwordValidator: PasswordValidatable = PasswordValidator()) {
        self.emailValidator = emailValidator
        self.passwordValidator = passwordValidator
        self.loginInteractor = loginInteractor
        super.init(view: view, router: router)
    }
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func doLogin(email: String?, password: String?) {
        guard let email = email, let password = password, !email.isEmpty, !password.isEmpty else {
            //Error
            view.showError(message: "Email and password are required!")
            return
        }
        guard emailValidator.validate(email) else {
            view.showError(message: "Please enter a valid 'email' address")
            return
        }
        guard passwordValidator.validate(password) else {
            view.showError(message: "Please enter a valid 'password'")
            return
        }
        
        loginInteractor.doLogin(email: email, password: password)
    }
    
}

extension LoginPresenter: LoginInteractorCallbackProtocol {
    
    func loginSuccess(data: Login.Expected) {
        view.removeError()
        router.presentDashboard(output: Login.Output(name: data.name, lastName: data.lastName))
    }
    
    func loginFailure(error: Login.Errors) {
        view.showError(message: error.localizedDescription)
    }
    
}
