//
//  EditProfile+ImagePickerControllerDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension EditProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Action After Picking Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("no image")
            return
        }
        self.profilePic.image = image
    }
    
    // Action After Cancelling ImagePicker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Getting Photo (Camera/Photo Library)
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}
