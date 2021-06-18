//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Laila Guzzon Hussein Lailota on 31/05/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        if CommandLine.arguments.contains("-skipSurvey") {
            print("Skipping survey page")
        }
        #endif
        
        
        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
            print("Skipping survey page")
        }
        #endif
        
        
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            
            let webService = SignupWebService(urlString: SignupConstants.signupURLString)
            
            
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webService, delegate: self)
            
        }
    }
    

    @IBAction func signupButtonTapped(_ sender: Any) {
        let signupFormModel = SignupFormModel(firstName: userFirstNameTextField.text ?? "",
                                              lastName: userLastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
}


extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignUp() {
        let alert = UIAlertController(title: "Success", message: "The signup operation was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
