//
//  MSGVC.swift
//  Shayal
//
//  Created by Moustafa Anas on 30/04/2022.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import Gallery
import PusherSwift
import ANActivityIndicator

final class MessageVC: MessagesViewController {
    
    // MARK: - Identifying Design Views
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.font = UIFont(name: "Almarai-Bold", size: 16)
        label.textAlignment = .natural
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let deliveryStateView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.mainColor
        return view
    }()
    
    let deliveryStateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Almarai-Regular", size: 13)
        label.text = "Heading to get your order"
        return label
    }()
    
    let deliveryStateImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "MsgStateImg")
        img.tintColor = .white
        return img
    }()
    
    // MARK: - Identifying Vars
    var refreshController = UIRefreshControl()
    var gallery: GalleryController!
    var pusher : Pusher!
    var chatData: ChatModel?
    
    let currentUser = MKSender(senderId: String(Helper.getUserID()), displayName: Helper.getUserName())
    var mkMessages: [MKMessageMock] = []
    
    private var chatId = ""
    private var reciptionistId = ""
    var reciptionistName = ""
    
    var displayingMessagesCount = 0
    var maxMessagesNumber = 0
    var minMessagesNumber = 0
  
    
    // MARK: - ViewController Cycle
    init(chatId: String, reciptionistId:String, reciptionistName:String){
        super.init(nibName: nil, bundle: nil)
        self.chatId = chatId
        self.reciptionistId = reciptionistId
        self.reciptionistName = reciptionistName
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        showIndicator(message: "Loading...".localized(), messageTopMargin: 20, animationType: .ballRotateChase)
        setupDesignedViews()
        customMoreBtn()
        setupMessageCV()
        configureMessageInputBar()
        configureCustomTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
        customizeNavBar(navBarimage: "NavBarBackground", navBarTintColor: .white, titleColor: .white)
        getMessagesApi(Url: URLs.chat_Url)
    }
}


    
  














