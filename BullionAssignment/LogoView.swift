//
//  LogoView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 10/07/24.
//

import UIKit

class LogoView: UIView {
    private let imageView: UIImageView
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Atur gambar menggunakan nama yang ada di aset
        imageView.image = UIImage(named: "logo")
        
        // Atur content mode
        imageView.contentMode = .scaleAspectFit
        
        // Matikan auto-resizing mask dan gunakan auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Tambahkan imageView ke view
        addSubview(imageView)
        
        // Tambahkan constraints untuk imageView
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 129.42), // Sesuaikan ukuran lebar
            imageView.heightAnchor.constraint(equalToConstant: 40) // Sesuaikan ukuran tinggi
        ])
    }
}


