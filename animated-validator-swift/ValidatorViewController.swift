//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    var validityCounter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        emailConfirmationTextField.delegate = self
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self 
         
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        
        self.submitButton.isEnabled = false
        self.submitButton.center.y += view.bounds.height
    }
    
    func valid() {
        if validityCounter == 5 {
            self.submitButton.isEnabled = true
            UIView.animate(withDuration: 1.5, animations: { self.submitButton.center.y = self.view.center.y } )
        }
    }
    
    func invalidBlink(textField: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.allowUserInteraction], animations: { textField.backgroundColor = UIColor.red },  completion: nil)
    }
    
    func invalidPulse(textField: UITextField) {
        UIView.animate(withDuration: 1.0, delay: 0.2, options: [.repeat, .allowUserInteraction], animations: { textField.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) }, completion: nil)
    }
    
    @IBAction func emailAction(_ sender: Any) {
        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))! {
            validityCounter += 1
            print("VALID EMAIL")
        } else {
            invalidBlink(textField: emailTextField)
            invalidPulse(textField: emailTextField)
           
        }
        valid()
    }

    @IBAction func emailRetapped(_ sender: Any) {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction],  animations: { self.emailTextField.backgroundColor = nil }, completion: nil)
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction], animations: { self.emailTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
    }
    
    @IBAction func confirmEmailAction(_ sender: Any) {
        if emailTextField.text == emailConfirmationTextField.text {
            validityCounter += 1
            print("EMAIL CONFIRMED")
        } else {
            invalidBlink(textField: emailConfirmationTextField)
            invalidPulse(textField: emailConfirmationTextField)
        }
        valid()
    }

    @IBAction func confirmEmailReTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction],  animations: { self.emailConfirmationTextField.backgroundColor = nil }, completion: nil)
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction], animations: { self.emailConfirmationTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
    }
    
    
    @IBAction func phoneAction(_ sender: Any) {
        if (phoneTextField.text?.characters.count)! >= 7 && Int(phoneTextField.text!) != nil {
            validityCounter += 1
            print("VALID PHONE")
        } else {
            invalidBlink(textField: phoneTextField)
            invalidPulse(textField: phoneTextField)
        }
        valid()
    }
    
    @IBAction func phoneRetapped(_ sender: Any) {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction],  animations: { self.phoneTextField.backgroundColor = nil }, completion: nil)
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction], animations: { self.phoneTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
    }
    
    
    
    @IBAction func passwordAction(_ sender: Any) {
        if (passwordTextField.text?.characters.count)! >= 6 {
            validityCounter += 1
            print("VALID PASSWORD")
        } else {
            invalidBlink(textField: passwordTextField)
            invalidPulse(textField: passwordTextField)
        }
        valid()
    }
    
    @IBAction func passwordRetapped(_ sender: Any) {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction],  animations: { self.passwordTextField.backgroundColor = nil }, completion: nil)
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction], animations: { self.passwordTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
    }
    
    
    @IBAction func confirmPasswordAction(_ sender: Any) {
        if passwordConfirmTextField.text == passwordTextField.text {
            validityCounter += 1
            print("PASSWORD CONFIRMED")
        } else {
            invalidBlink(textField: passwordConfirmTextField)
            invalidPulse(textField: passwordConfirmTextField)
        }
        valid()
    }
    @IBAction func confirmPasswordRetapped(_ sender: Any) {
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction],  animations: { self.passwordConfirmTextField.backgroundColor = nil }, completion: nil)
        UIView.animate(withDuration: 0.0, delay: 0.0, options: [.allowUserInteraction], animations: { self.passwordConfirmTextField.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
    }

}
