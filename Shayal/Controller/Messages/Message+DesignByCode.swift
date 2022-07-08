//
//  Message+DesignByCode.swift
//  Shayal
//
//  Created by Moustafa Anas on 03/05/2022.
//

import UIKit

extension MessageVC {
    
    // MARK: - Setup Design Views
    func setupDesignedViews() {
        view.addSubview(deliveryStateView)
        deliveryStateView.addSubview(deliveryStateImg)
        deliveryStateView.addSubview(deliveryStateLabel)
    }
    
    // Setup Design Coded Frames
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        deliveryStateView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        deliveryStateImg.frame = CGRect(x: 20, y: 10, width: 20, height: 20)
        deliveryStateLabel.frame = CGRect(x: deliveryStateImg.frame.maxX + 10, y: 0, width: view.frame.width - 60, height: 40)
    }
    
    // Configure Custom Title
    func configureCustomTitle() {
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "chevron.left".localized()), style: .plain, target: self, action: #selector(self.backBtnPressed))]
        
        let leftBarBtnItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItems?.append(leftBarBtnItem)
        
        titleLabel.text = reciptionistName
    }
    
    // Back Btn Action
    @objc func backBtnPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // Customize More Button
    func customMoreBtn() {
        let moreBtn = UIBarButtonItem(image: UIImage(named: "ellipsis"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = moreBtn
        
        moreBtn.menu = UIMenu( children: [
            UIAction(title: "Pin Chat".localized(), image: UIImage(systemName: "pin.fill"), state: .off, handler: { [weak self] action in
                guard let self = self else{return}
                self.pinChatAction()
            }),
            UIAction(title: "Delete Chat".localized(), image: UIImage(systemName: "trash.fill"), state: .off, handler: { [weak self] action in
                guard let self = self else{return}
                self.deleteChatAction()
            })
        ])
    }
    
    // Pin Chat Action
    func pinChatAction() {
        print("Pin Chat")
    }

    // Delete Chat Action
    func deleteChatAction() {
        print("Delete Chat")
    }
    
    // Refresh Control Action - UIScrolViewDelegateFunctions
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            guard let item = chatData else { return }
            if let nextURL = item.data.paginate?.nextPageURL, !nextURL.isEmpty{
                self.getMessagesApi(Url: nextURL)
            }
        }
        refreshController.endRefreshing()
    }
}
