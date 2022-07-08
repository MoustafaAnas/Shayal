//
//  MessageVC InputBarAccessoryViewDelegate.swift
//  Shayal
//
//  Created by Moustafa Anas on 01/05/2022.
//

import Foundation
import MessageKit
import InputBarAccessoryView
import Gallery

extension MessageVC: InputBarAccessoryViewDelegate {
    
    // MARK: - configure MessageInputBar
     func configureMessageInputBar() {
        messageInputBar.delegate = self
        
        let attachBtn = InputBarButtonItem()
        attachBtn.setSize(CGSize(width: 30, height: 30), animated: false)
        attachBtn.image = UIImage(systemName: "paperclip.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        attachBtn.onTouchUpInside { [weak self] item in
            guard let self = self else{return}
            self.attachBtnAction()
        }
        
        let micBtn = InputBarButtonItem()
        micBtn.setSize(CGSize(width: 30, height: 30), animated: false)
        micBtn.image = UIImage(systemName: "mic.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        micBtn.onTouchUpInside { [weak self] item in
            guard let self = self else{return}
            self.micBtnAction()
        }
        
        let mapBtn = InputBarButtonItem()
        mapBtn.setSize(CGSize(width: 30, height: 30), animated: false)
        mapBtn.image = UIImage(systemName: "map.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        mapBtn.imageView?.tintColor = .orange
        mapBtn.onTouchUpInside { [weak self] item in
            guard let self = self else{return}
            let vc = MapVC()
            vc.mapTitle = "Track Order".localized()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        // Custom MessageInputBar
        messageInputBar.setStackViewItems([mapBtn, attachBtn, micBtn], forStack: .left, animated: false)
        messageInputBar.setLeftStackViewWidthConstant(to: 96, animated: false)
        messageInputBar.inputTextView.isImagePasteEnabled = false
        messageInputBar.backgroundView.backgroundColor = .white
        messageInputBar.tintColor = AppColor.mainColor
        messageInputBar.inputTextView.backgroundColor = .white
        messageInputBar.inputTextView.cornerRadius =  messageInputBar.inputTextView.frame.height/2
        // messageInputBar.inputTextView.borderWidth = 1
        // messageInputBar.inputTextView.borderColor = AppColor.mainColor
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
        print("typing")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        sendMessagesApi(chatID: getChatID(), Msg: text)
        messageInputBar.inputTextView.text = ""
        messageInputBar.invalidatePlugins()
    }
    
    
    // MARK: - Message Input Buttons Actions
    private func attachBtnAction() {
        self.messageInputBar.inputTextView.resignFirstResponder()
        
        let optionsSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera".localized(), style: .default) { [weak self] action in
            guard let self = self else{return}
            self.actionSheetIsPressed(camera: true)
        }
        
        let photoAction = UIAlertAction(title: "Photo Library".localized(), style: .default) { [weak self] action in
            guard let self = self else{return}
            self.actionSheetIsPressed(camera: false)
        }
        
        let cancel = UIAlertAction(title: "Cancel".localized(), style: .cancel, handler: nil)
        
        optionsSheet.addAction(cameraAction)
        optionsSheet.addAction(photoAction)
        optionsSheet.addAction(cancel)
        present(optionsSheet, animated: true, completion: nil)
    }
    
    private func actionSheetIsPressed(camera: Bool) {
        gallery = GalleryController()
        gallery.delegate = self
        Config.tabsToShow = camera ? [.cameraTab] : [.imageTab, .videoTab]
        Config.Camera.imageLimit = 1
        Config.initialTab = .imageTab
        Config.VideoEditor.maximumDuration = 30
        self.present(gallery, animated: true, completion: nil)
    }
    
    private func micBtnAction() {
        print("mic")
    }
}
