//
//  LoginPresenterTests.swift
//  VIPERTests
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import XCTest
@testable import VIPER_Template

class LoginPresenterTests: XCTestCase {
    
    class LoginViewSpy: LoginViewProtocol {
        var errorMessageShown: Bool = false
        var errorMessageRemoved: Bool = false
        var errorMessage: String = ""
        
        func showError(message: String) {
            errorMessageShown = true
            errorMessage = message
        }
        
        func removeError() {
            errorMessageRemoved = true
        }
        
    }
    
    class LoginRouterSpy: LoginRouterProtocol {
        var dashboardPresented: Bool = false
        
        func presentDashboard(output: Login.Output) {
            dashboardPresented = true
        }
    }
    
    func testLoginSuccess() {
        
        let viewSpy = LoginViewSpy()
        let interactorMock = LoginInteractorSuccessMock()
        let routerSpy = LoginRouterSpy()
        let sut = LoginPresenter(view: viewSpy, router: routerSpy, loginInteractor: interactorMock)
        interactorMock.presenter = sut
        
        sut.doLogin(email: "aa@a", password: "1234")
        
        XCTAssertTrue(viewSpy.errorMessageRemoved)
        XCTAssertTrue(routerSpy.dashboardPresented)
    }
    
    func testLoginFailure() {
        
        let viewSpy = LoginViewSpy()
        let interactorMock = LoginInteractorFailureMock()
        let routerSpy = LoginRouterSpy()
        let sut = LoginPresenter(view: viewSpy, router: routerSpy, loginInteractor: interactorMock)
        interactorMock.presenter = sut
        
        sut.doLogin(email: "aa@a", password: "1234")
        
        XCTAssertTrue(viewSpy.errorMessageShown)
        XCTAssertEqual(viewSpy.errorMessage, Login.Errors.invalidCredentials.localizedDescription)
        XCTAssertFalse(routerSpy.dashboardPresented)
    }
    
    func testLoginNoData() {
        
        let viewSpy = LoginViewSpy()
        let interactorMock = LoginInteractorSuccessMock()
        let routerSpy = LoginRouterSpy()
        let sut = LoginPresenter(view: viewSpy, router: routerSpy, loginInteractor: interactorMock)
        interactorMock.presenter = sut
        
        sut.doLogin(email: nil, password: nil)
        
        XCTAssertTrue(viewSpy.errorMessageShown)
        XCTAssertEqual(viewSpy.errorMessage, "Email and password are required!")
        XCTAssertFalse(routerSpy.dashboardPresented)
        
    }
    
    func testLoginWrongEmail() {
        
        let viewSpy = LoginViewSpy()
        let interactorMock = LoginInteractorSuccessMock()
        let routerSpy = LoginRouterSpy()
        let sut = LoginPresenter(view: viewSpy, router: routerSpy, loginInteractor: interactorMock)
        interactorMock.presenter = sut
        
        sut.doLogin(email: "aa.com", password: "password")
        
        XCTAssertTrue(viewSpy.errorMessageShown)
        XCTAssertEqual(viewSpy.errorMessage, "Please enter a valid 'email' address")
        XCTAssertFalse(routerSpy.dashboardPresented)
        
    }
    
    func testLoginWrongPassword() {
        
        let viewSpy = LoginViewSpy()
        let interactorMock = LoginInteractorSuccessMock()
        let routerSpy = LoginRouterSpy()
        let sut = LoginPresenter(view: viewSpy, router: routerSpy, loginInteractor: interactorMock)
        interactorMock.presenter = sut
        
        sut.doLogin(email: "aa@a.com", password: "0")
        
        XCTAssertTrue(viewSpy.errorMessageShown)
        XCTAssertEqual(viewSpy.errorMessage, "Please enter a valid 'password'")
        XCTAssertFalse(routerSpy.dashboardPresented)
        
    }
    
}
