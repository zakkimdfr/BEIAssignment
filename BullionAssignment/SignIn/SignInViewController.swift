//
//  SignInViewController.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

@available(iOS 13.4, *)
class SignInViewController: UIViewController, ViewButtonDelegate, SignInView {
    
    private var emailLabelGradientView: LabelGradientView!
    private var passwordLabelGradientView: LabelGradientView!
    private var emailTextFieldView: TextFieldView!
    private var passwordTextFieldView: TextFieldView!
    private var logoView = LogoView()
    private var signInButtonView: ViewButton!
    private var addUsersButtonView: ViewButton!
    private var containerView: UIView!
    
    var viewModel: SignInViewModel!
    
    private let disposeBag = DisposeBag()
    private let viewDidLoadRelay = PublishRelay<Void>()
    private let requestLogin = BehaviorRelay<SignInRequestModel?>(value: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 252/255, green: 104/255, blue: 58/255, alpha: 1).cgColor,
            UIColor(red: 240/255, green: 90/255, blue: 42/255, alpha: 1).cgColor,
            UIColor(red: 241/255, green: 186/255, blue: 168/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = view.bounds
        
        // Add gradient layer to the view
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        setupViews()
        setupConstraints()
        self.viewDidLoadRelay.accept(())
        self.bindViewModel()
    }
    
    private func setupViews() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create and configure the email label gradient view
        emailLabelGradientView = LabelGradientView()
        emailLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        emailLabelGradientView.gradientLabelText = "Email Address"
        
        // Create and configure the password label gradient view
        passwordLabelGradientView = LabelGradientView()
        passwordLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        passwordLabelGradientView.gradientLabelText = "Password"
        
        
        // Create and configure the email text field view
        emailTextFieldView = TextFieldView()
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.placeholder = "Placeholder here"
        
        // Create and configure the password text field view
        passwordTextFieldView = TextFieldView()
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldView.placeholder = "Placeholder here"
        passwordTextFieldView.isSecuredText = true
        
        
        // Create and configure the sign-in button view
        signInButtonView = ViewButton()
        signInButtonView.translatesAutoresizingMaskIntoConstraints = false
        signInButtonView.buttonText = "Sign In"
        
        // Create and configure the add users button
        addUsersButtonView = ViewButton()
        addUsersButtonView.translatesAutoresizingMaskIntoConstraints = false
        addUsersButtonView.buttonText = "Add new Users"
        
        // Create a container view for email and password fields
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1)
        containerView.layer.cornerRadius = 25
        
        // Add all views to the main view
        view.addSubview(logoView)
        containerView.addSubview(emailLabelGradientView)
        containerView.addSubview(passwordLabelGradientView)
        containerView.addSubview(emailTextFieldView)
        containerView.addSubview(passwordTextFieldView)
        containerView.addSubview(signInButtonView)
        containerView.addSubview(addUsersButtonView)
        view.addSubview(containerView)
        
        addUsersButtonView.delegate = self
        signInButtonView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            logoView.widthAnchor.constraint(equalToConstant: 129.42), // Adjust width size
            logoView.heightAnchor.constraint(equalToConstant: 40) // Adjust height size
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            containerView.heightAnchor.constraint(equalToConstant: 420),
            containerView.widthAnchor.constraint(equalToConstant: 360)
        ])
        
        NSLayoutConstraint.activate([
            emailLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailLabelGradientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -270),
            emailLabelGradientView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            emailLabelGradientView.widthAnchor.constraint(equalToConstant: 312),
            emailLabelGradientView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            emailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            emailTextFieldView.topAnchor.constraint(equalTo: emailLabelGradientView.bottomAnchor, constant: 10),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        NSLayoutConstraint.activate([
            passwordLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordLabelGradientView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -300),
            passwordLabelGradientView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 20),
            passwordLabelGradientView.widthAnchor.constraint(equalToConstant: 312),
            passwordLabelGradientView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            passwordTextFieldView.topAnchor.constraint(equalTo: passwordLabelGradientView.bottomAnchor, constant: 10),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 48)
            
        ])
        
        NSLayoutConstraint.activate([
            signInButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            signInButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            signInButtonView.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 50),
            signInButtonView.heightAnchor.constraint(equalToConstant: 50),
            signInButtonView.widthAnchor.constraint(equalToConstant: 312)
            
        ])
        
        NSLayoutConstraint.activate([
            addUsersButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            addUsersButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            addUsersButtonView.topAnchor.constraint(equalTo: signInButtonView.bottomAnchor, constant: 20),
            addUsersButtonView.heightAnchor.constraint(equalToConstant: 50),
            addUsersButtonView.widthAnchor.constraint(equalToConstant: 312)
        ])
    }
    
    func bindViewModel() {
        let input = SignInViewModel.Input(
            signInRequest: self.requestLogin.asObservable(),
            viewDidLoadRelay: self.viewDidLoadRelay.asObservable()
        )
//        let output = viewModel.transform(input)
        
//        output.state
//            .drive(onNext: { state in
//                // Handle state changes here
//            })
//            .disposed(by: disposeBag)
//        
//        output.signinOutput
//            .drive(onNext: { signInModel in
//                // Handle sign-in output here
//            })
//            .disposed(by: disposeBag)
//        
        signInButtonView.button.rx.tap
            .bind(onNext: { [weak self] in
                self?.requestLogin.accept(
                    SignInRequestModel(
                        email: self?.emailTextFieldView.textFieldText ?? "",
                        password: self?.passwordTextFieldView.textFieldText ?? ""
                    )
                )
            })
            .disposed(by: disposeBag)
    }
    
    func viewButtonDidTap(_ viewButton: ViewButton) {
        if viewButton == addUsersButtonView {
            let registration = RegisterViewController()
            self.navigationController?.pushViewController(registration, animated: true)
        }
        
        if viewButton == signInButtonView {
            signInButtonView.button.rx.tap
                .bind(onNext: { [weak self] in
                    self?.requestLogin.accept(
                        SignInRequestModel(
                            email: self?.emailTextFieldView.textFieldText ?? "",
                            password: self?.passwordTextFieldView.textFieldText ?? ""
                        )
                    )
                })
                .disposed(by: self.disposeBag)
        }
    }
}

@available(iOS 13.4, *)
extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.passwordTextFieldView.textField {
            if let password = self.passwordTextFieldView.textField.text, !password.isEmpty {
                if isValidPassword(password) {
                    signInButtonView.isUserInteractionEnabled = true
                } else {
                    signInButtonView.isUserInteractionEnabled = false
                }
            } else {
                signInButtonView.isUserInteractionEnabled = false
            }
        }
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}
