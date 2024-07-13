//
//  UploadPhotoButtonView.swift
//  BullionAssignment
//
//  Created by Zakki Mudhoffar on 13/07/24.
//

import UIKit

class UploadPhotoButtonView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(handlePhotoUpload), for: .touchUpInside)
        
        let image = UIImage(systemName: "link")?.withTintColor(UIColor(red: 46/255, green: 117/255, blue: 182/255, alpha: 1), renderingMode: .alwaysOriginal)
            setImage(image, for: .normal)

        imageView?.contentMode = .scaleAspectFit
        imageView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
    }
    
    @objc private func handlePhotoUpload() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        UIApplication.shared.windows.first?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
}

extension UploadPhotoButtonView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            // Use the picked image here
            setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


