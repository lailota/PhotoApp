//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    
    func testSignupViewController_WhenCreated_HasRequieredTextFieldsEmpty() throws {
        
        let userFirstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The userFirstNameTextField is not connected to an IBOutlet")
        let userLastNameTextField = try XCTUnwrap(sut.userLastNameTextField, "The userLastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(userFirstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(userLastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password text field was not empty when the view controller initially loaded")
    }

    
    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup button does not have a referencing outlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
}
