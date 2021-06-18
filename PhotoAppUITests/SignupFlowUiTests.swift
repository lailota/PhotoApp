//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Laila Guzzon Hussein Lailota on 21/05/21.
//

import XCTest

class SignupFlowUiTests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey", "-degubServer"]
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailAddressTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }
    
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnable() throws {
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email address UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "The signup button is not enabled for user interactions")
        
    }
    
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorsAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("L")
        
        lastName.tap()
        lastName.typeText("H")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("1234")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        // Para tirar um screenshot de forma programática de um elemento específico
        /*
         let emailTextFieldScreenshot = email.screenshot()
         let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
         emailTextFieldAttachment.name = "Screenshot of Email UITextField"
         emailTextFieldAttachment.lifetime = .keepAlways
         add(emailTextFieldAttachment)
         
         // Para tirar um screenshot de forma programática de toda a window
         let currentAppWindow = app.screenshot() // outra forma é mudar esta linha para let currentAppWindow = XCUIScreen.main.screenshot()
         let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindow)
         currentAppWindowAttachment.name = "Signup page screenshot"
         currentAppWindowAttachment.lifetime = .keepAlways
         add(currentAppWindowAttachment)
         */
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Laila")
        
        lastName.tap()
        lastName.typeText("Hussein")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("123456789")
        
        repeatPassword.tap()
        repeatPassword.typeText("123456789")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 5), "An Success Alert dialog was not presented when valid signup form was submitted")
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
