//
//  LabelGradientView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 10/07/24.
//

import UIKit

class LabelGradientView: UIView {
    private let gradientLabel: UILabel
    
    var gradientLabelText: String = "" {
            didSet {
                gradientLabel.text = gradientLabelText
                applyGradient()
            }
        }
    
    override init(frame: CGRect) {
        gradientLabel = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        gradientLabel = UILabel()
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        gradientLabel.text = gradientLabelText
        gradientLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        gradientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(gradientLabel)
        
        NSLayoutConstraint.activate([
            gradientLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gradientLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        applyGradient()
    }
    
    private func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 145/255, green: 54/255, blue: 26/255, alpha: 1).cgColor,
            UIColor(red: 240/255, green: 90/255, blue: 42/255, alpha: 1).cgColor,
            UIColor(red: 248/255, green: 149/255, blue: 118/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 20) // Adjust the frame size as needed
        
        let gradientImage = UIImage.gradientImage(with: gradientLayer)
        gradientLabel.textColor = UIColor(patternImage: gradientImage)
    }
}

// Extension to create UIImage from CAGradientLayer
extension UIImage {
    static func gradientImage(with layer: CAGradientLayer) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: layer.bounds.size)
        return renderer.image { context in
            layer.render(in: context.cgContext)
        }
    }
}

