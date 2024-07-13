//
//  RegisterViewController.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 11/07/24.
//

import UIKit

@available(iOS 13.4, *)
class RegisterViewController: UIViewController, CheckboxViewDelegate {
    private var maleCheckboxView: CheckboxView!
    private var femaleCheckboxView: CheckboxView!
    private var nameLabelGradientView: LabelGradientView!
    private var genderLabelGradientView: LabelGradientView!
    private var birthLabelGradientView: LabelGradientView!
    private var phoneLabelGradientView: LabelGradientView!
    private var photoLabelGradientView: LabelGradientView!
    private var emailLabelGradientView: LabelGradientView!
    private var passwordLabelGradientView: LabelGradientView!
    private var confirmPasswordLabelGradientView: LabelGradientView!
    private var nameTextFieldView: TextFieldView!
    private var birthTextFieldView: DatePickerTextField!
    private var emailTextFieldView: TextFieldView!
    private var photoTextFieldView: TextFieldView!
    private var phoneTextFieldView: TextFieldView!
    private var passwordTextFieldView: TextFieldView!
    private var confirmPasswordTextFieldView: TextFieldView!
    private var logoView = LogoView()
    private var addUsersButtonView: ViewButton!
    private var containerView: UIView!
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var genderSwitch: UISwitch!
    private var showConfirmPasswordButton: UIButton!
    private var showPasswordButton: UIButton!
    private var photoUploadButtonView: UploadPhotoButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 252/255, green: 104/255, blue: 58/255, alpha: 1).cgColor,
            UIColor(red: 240/255, green: 90/255, blue: 42/255, alpha: 1).cgColor,
            UIColor(red: 241/255, green: 186/255, blue: 168/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabelGradientView = LabelGradientView()
        nameLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        nameLabelGradientView.gradientLabelText = "Name"
        
        genderLabelGradientView = LabelGradientView()
        genderLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        genderLabelGradientView.gradientLabelText = "Gender"
        
        birthLabelGradientView = LabelGradientView()
        birthLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        birthLabelGradientView.gradientLabelText = "Date of Birth"
        
        emailLabelGradientView = LabelGradientView()
        emailLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        emailLabelGradientView.gradientLabelText = "Email Address"
        
        phoneLabelGradientView = LabelGradientView()
        phoneLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        phoneLabelGradientView.gradientLabelText = "Phone Number"
        
        photoLabelGradientView = LabelGradientView()
        photoLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        photoLabelGradientView.gradientLabelText = "Photo Profile"
        
        passwordLabelGradientView = LabelGradientView()
        passwordLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        passwordLabelGradientView.gradientLabelText = "Password"
        
        confirmPasswordLabelGradientView = LabelGradientView()
        confirmPasswordLabelGradientView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabelGradientView.gradientLabelText = "Confirm Password"
        
        nameTextFieldView = TextFieldView()
        nameTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        nameTextFieldView.placeholder = "Placeholder here"
        nameTextFieldView.textField.delegate = self
        
        birthTextFieldView = DatePickerTextField()
        birthTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        birthTextFieldView.textField.delegate = self
        
        emailTextFieldView = TextFieldView()
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.placeholder = "Placeholder here"
        emailTextFieldView.textField.delegate = self
        
        phoneTextFieldView = TextFieldView()
        phoneTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        phoneTextFieldView.placeholder = "Placeholder here"
        phoneTextFieldView.textField.delegate = self
        
        photoTextFieldView = TextFieldView()
        photoTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        photoTextFieldView.placeholder = "Placeholder here"
        photoTextFieldView.textField.delegate = self
        
        passwordTextFieldView = TextFieldView()
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldView.placeholder = "Placeholder here"
        passwordTextFieldView.isSecuredText = true
        passwordTextFieldView.textField.delegate = self
        
        confirmPasswordTextFieldView = TextFieldView()
        confirmPasswordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextFieldView.placeholder = "Placeholder here"
        confirmPasswordTextFieldView.isSecuredText = true
        confirmPasswordTextFieldView.textField.delegate = self
        
        addUsersButtonView = ViewButton()
        addUsersButtonView.translatesAutoresizingMaskIntoConstraints = false
        addUsersButtonView.buttonText = "Add Users"
        
        maleCheckboxView = CheckboxView(title: "Male")
        maleCheckboxView.delegate = self
        maleCheckboxView.translatesAutoresizingMaskIntoConstraints = false
        
        femaleCheckboxView = CheckboxView(title: "Female")
        femaleCheckboxView.delegate = self
        femaleCheckboxView.translatesAutoresizingMaskIntoConstraints = false
        
        showPasswordButton = UIButton(type: .system)
        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showPasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        showConfirmPasswordButton = UIButton(type: .system)
        showConfirmPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showConfirmPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showConfirmPasswordButton.addTarget(self, action: #selector(toggleConfirmPasswordVisibility), for: .touchUpInside)
        
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 250/255, alpha: 1)
        containerView.layer.cornerRadius = 25
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        view.addSubview(logoView)
        view.addSubview(scrollView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(nameLabelGradientView)
        containerView.addSubview(genderLabelGradientView)
        containerView.addSubview(birthLabelGradientView)
        containerView.addSubview(phoneLabelGradientView)
        containerView.addSubview(photoLabelGradientView)
        containerView.addSubview(emailLabelGradientView)
        containerView.addSubview(passwordLabelGradientView)
        containerView.addSubview(confirmPasswordLabelGradientView)
        containerView.addSubview(nameTextFieldView)
        containerView.addSubview(birthTextFieldView)
        containerView.addSubview(emailTextFieldView)
        containerView.addSubview(phoneTextFieldView)
        containerView.addSubview(photoTextFieldView)
        containerView.addSubview(passwordTextFieldView)
        containerView.addSubview(confirmPasswordTextFieldView)
        containerView.addSubview(addUsersButtonView)
        containerView.addSubview(showPasswordButton)
        containerView.addSubview(showConfirmPasswordButton)
        containerView.addSubview(maleCheckboxView)
        containerView.addSubview(femaleCheckboxView)

        
        photoUploadButtonView = UploadPhotoButtonView()
        photoUploadButtonView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(photoUploadButtonView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 180),
            logoView.heightAnchor.constraint(equalToConstant: 10),
            
            scrollView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            nameLabelGradientView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            nameLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
            nameLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            nameTextFieldView.topAnchor.constraint(equalTo: nameLabelGradientView.bottomAnchor, constant: 8),
            nameTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            nameTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            nameTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            genderLabelGradientView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 16),
            genderLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 50),
            genderLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            maleCheckboxView.topAnchor.constraint(equalTo: genderLabelGradientView.bottomAnchor, constant: 8),
            maleCheckboxView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            maleCheckboxView.heightAnchor.constraint(equalToConstant: 40),
            maleCheckboxView.widthAnchor.constraint(equalToConstant: 100),
            
            femaleCheckboxView.topAnchor.constraint(equalTo: genderLabelGradientView.bottomAnchor, constant: 8),
            femaleCheckboxView.leadingAnchor.constraint(equalTo: maleCheckboxView.trailingAnchor, constant: 16),
            femaleCheckboxView.heightAnchor.constraint(equalToConstant: 40),
            femaleCheckboxView.widthAnchor.constraint(equalToConstant: 100),
            
            birthLabelGradientView.topAnchor.constraint(equalTo: maleCheckboxView.bottomAnchor, constant: 16),
            birthLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 70),
            birthLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            birthTextFieldView.topAnchor.constraint(equalTo: birthLabelGradientView.bottomAnchor, constant: 8),
            birthTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            birthTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            birthTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            emailLabelGradientView.topAnchor.constraint(equalTo: birthTextFieldView.bottomAnchor, constant: 16),
            emailLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 75),
            emailLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            emailTextFieldView.topAnchor.constraint(equalTo: emailLabelGradientView.bottomAnchor, constant: 8),
            emailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            phoneLabelGradientView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 16),
            phoneLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 75),
            phoneLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            phoneTextFieldView.topAnchor.constraint(equalTo: phoneLabelGradientView.bottomAnchor, constant: 8),
            phoneTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            phoneTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            phoneTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            photoLabelGradientView.topAnchor.constraint(equalTo: phoneTextFieldView.bottomAnchor, constant: 16),
            photoLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 70),
            photoLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            photoTextFieldView.topAnchor.constraint(equalTo: photoLabelGradientView.bottomAnchor, constant: 8),
            photoTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            photoTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            photoTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            photoUploadButtonView.centerYAnchor.constraint(equalTo: photoTextFieldView.centerYAnchor),
            photoUploadButtonView.trailingAnchor.constraint(equalTo: photoTextFieldView.trailingAnchor, constant: -8),
            photoUploadButtonView.widthAnchor.constraint(equalToConstant: 30),
            photoUploadButtonView.heightAnchor.constraint(equalToConstant: 48),
            
            passwordLabelGradientView.topAnchor.constraint(equalTo: photoUploadButtonView.bottomAnchor, constant: 16),
            passwordLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 60),
            passwordLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            passwordTextFieldView.topAnchor.constraint(equalTo: passwordLabelGradientView.bottomAnchor, constant: 8),
            passwordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            showPasswordButton.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            showPasswordButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            showPasswordButton.widthAnchor.constraint(equalToConstant: 30),
            showPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            confirmPasswordLabelGradientView.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 16),
            confirmPasswordLabelGradientView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 90),
            confirmPasswordLabelGradientView.heightAnchor.constraint(equalToConstant: 20),
            
            confirmPasswordTextFieldView.topAnchor.constraint(equalTo: confirmPasswordLabelGradientView.bottomAnchor, constant: 8),
            confirmPasswordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            confirmPasswordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            confirmPasswordTextFieldView.heightAnchor.constraint(equalToConstant: 48),
            
            showConfirmPasswordButton.centerYAnchor.constraint(equalTo: confirmPasswordTextFieldView.centerYAnchor),
            showConfirmPasswordButton.trailingAnchor.constraint(equalTo: confirmPasswordTextFieldView.trailingAnchor, constant: -8),
            showConfirmPasswordButton.widthAnchor.constraint(equalToConstant: 30),
            showConfirmPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            addUsersButtonView.topAnchor.constraint(equalTo: confirmPasswordTextFieldView.bottomAnchor, constant: 24),
            addUsersButtonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            addUsersButtonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            addUsersButtonView.heightAnchor.constraint(equalToConstant: 50),
            addUsersButtonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTextFieldView.textField.isSecureTextEntry.toggle()
        let imageName = passwordTextFieldView.textField.isSecureTextEntry ? "eye" : "eye.slash"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func toggleConfirmPasswordVisibility() {
        confirmPasswordTextFieldView.textField.isSecureTextEntry.toggle()
        let imageName = confirmPasswordTextFieldView.textField.isSecureTextEntry ? "eye" : "eye.slash"
        showConfirmPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    func checkboxDidTap(_ checkboxView: CheckboxView) {
            if checkboxView == maleCheckboxView {
                femaleCheckboxView.isChecked = false
            } else if checkboxView == femaleCheckboxView {
                maleCheckboxView.isChecked = false
            }
        }
}

@available(iOS 13.4, *)
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
