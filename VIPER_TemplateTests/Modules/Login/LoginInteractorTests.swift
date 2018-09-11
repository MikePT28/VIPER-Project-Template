//
//  LoginInteractorTests.swift
//  VIPERTests
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import XCTest
@testable import VIPER_Template

class LoginInteractorTests: XCTestCase {

    class LoginPresenterSpy: LoginInteractorCallbackProtocol {
        var expectedLoginObject: Login.Expected?
        var isLoginError: Bool = false
        var loginError: Login.Errors?
        
        func loginFailure(error: Login.Errors) {
            isLoginError = true
            loginError = error
        }
        
        func loginSuccess(data: Login.Expected) {
            expectedLoginObject = data
        }
        
    }
    
    func testLoginSuccess() {
        
        let presenterSpy = LoginPresenterSpy()
        let sut = LoginInteractor()
        let loginWorkerMock = LoginInteractorWorkerSuccessMock(interactor: sut)
        sut.loginWorker = loginWorkerMock
        sut.presenter = presenterSpy
        
        sut.doLogin(email: "m@m.com", password: "1234")
        
        XCTAssertNotNil(presenterSpy.expectedLoginObject)
        XCTAssertEqual(presenterSpy.expectedLoginObject!.name, "Jon")
        XCTAssertEqual(presenterSpy.expectedLoginObject!.lastName, "Doe")
        
    }
    
    func testLoginFailure() {

        let presenterSpy = LoginPresenterSpy()
        let sut = LoginInteractor()
        let loginWorkerMock = LoginInteractorWorkerFailureMock(interactor: sut)
        sut.loginWorker = loginWorkerMock
        sut.presenter = presenterSpy
        
        sut.doLogin(email: "wrong", password: "wrong")
        
        XCTAssertTrue(presenterSpy.isLoginError)
        XCTAssertNotNil(presenterSpy.loginError)
        XCTAssertEqual(presenterSpy.loginError!, .invalidCredentials)
        
    }
}
