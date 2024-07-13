//
//  ButtonView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 10/07/24.
//

import UIKit

protocol ViewButtonDelegate: AnyObject {
    func viewButtonDidTap(_ viewButton: ViewButton)
}

class ViewButton: UIView {
    
    let button: UIButton
    weak var delegate: ViewButtonDelegate?

    var buttonText: String = "" {
        didSet {
            button.setTitle(buttonText, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        button = UIButton(type: .system)
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        button.setTitle(buttonText, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.backgroundColor = UIColor(red: 37/255, green: 94/255, blue: 146/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.viewButtonDidTap(self)
    }
}
