//
//  DatePickerView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

@available(iOS 13.4, *)
class DatePickerTextField: UIView {
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 25
        tf.attributedPlaceholder = NSAttributedString(string: "Placeholder Here", attributes: [
            .font: UIFont.systemFont(ofSize: 14)
        ])
        return tf
    }()
    
    private let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "calendar"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .black
        return btn
    }()
    
    private let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        dp.preferredDatePickerStyle = .wheels
        dp.translatesAutoresizingMaskIntoConstraints = false
        return dp
    }()
    
    private let toolbar: UIToolbar = {
        let tb = UIToolbar()
        tb.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        tb.setItems([doneButton], animated: false)
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(textField)
        addSubview(button)
        
        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func buttonTapped() {
        textField.becomeFirstResponder()
    }
    
    @objc private func doneTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        textField.text = dateFormatter.string(from: datePicker.date)
        textField.resignFirstResponder()
    }
}



