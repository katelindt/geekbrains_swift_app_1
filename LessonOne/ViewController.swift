//
//  ViewController.swift
//  LessonOne
//
//  Created by Екатерина Лифинцева on 02.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        
    }
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleGesture() {
        self.scrollView.endEditing(true)
    }
    private func addObservers() {
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardWillShow),
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
        
        NotificationCenter.default
            .addObserver(
                self,
                selector: #selector(handleKeyboardWillHide),
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
    }
    
    private func removeObservers() {
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillShowNotification,
                object: nil)
        
        NotificationCenter.default
            .removeObserver(
                self,
                name: UIResponder.keyboardWillHideNotification,
                object: nil)
        
    }
    
    @objc private func handleKeyboardWillShow() {
        self.scrollView.contentInset.bottom = 120
    }
    
    @objc private func handleKeyboardWillHide() {
        self.scrollView.contentInset.bottom = 0
    }
    
    @IBAction private func onButtonPressed(_ sender: Any) {
        let login = self.loginTextField.text
        let password = self.passwordTextField.text
        
        if login == "admin" && password == "123456" {
            print("Успешная авторизация")
        } else {
            print("Неуспешная авторизация")
        }
    }

}

