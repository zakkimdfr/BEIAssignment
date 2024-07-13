//
//  CheckboxView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

protocol CheckboxViewDelegate: AnyObject {
    func checkboxDidTap(_ checkboxView: CheckboxView)
}

class CheckboxView: UIView {
    weak var delegate: CheckboxViewDelegate?
    
    private var titleLabel: UILabel!
    private var checkboxButton: UIButton!
    
    var isChecked: Bool {
        get {
            return checkboxButton.isSelected
        }
        set {
            checkboxButton.isSelected = newValue
            updateCheckboxState()
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setupViews(title: title)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(title: String) {
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        checkboxButton = UIButton(type: .custom)
        checkboxButton.setImage(UIImage(systemName: "square"), for: .normal)
        checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        checkboxButton.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(checkboxButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkboxButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkboxButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 20),
            checkboxButton.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    @objc private func checkboxTapped() {
        checkboxButton.isSelected.toggle()
        updateCheckboxState()
        delegate?.checkboxDidTap(self)
    }
    
    private func updateCheckboxState() {
        let imageName = checkboxButton.isSelected ? "checkmark.square.fill" : "square"
        checkboxButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
