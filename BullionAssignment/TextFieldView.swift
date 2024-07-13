//
//  TextFieldView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 10/07/24.
//

// TextFieldView.swift
import UIKit

class TextFieldView: UIView, UITextFieldDelegate {
    let textField: UITextField
    
    var isValidEmail: Bool = false {
        didSet {
            if isValidEmail {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    var isSecuredText: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecuredText
        }
    }
    
    var textFieldText: String = "" {
        didSet {
            textField.text = textFieldText
        }
    }
    
    var placeholder: String = "" {
        didSet {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
            textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
    
    override init(frame: CGRect) {
        textField = UITextField()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        textField = UITextField()
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 25
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        textFieldText = textField.text ?? ""
        validateEmail(text: textFieldText)
    }
    
    private func validateEmail(text: String) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        isValidEmail = emailTest.evaluate(with: text)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func togglePasswordVisibility() {
            textField.isSecureTextEntry.toggle()
        }
}

