//
//  FilesListViewController.swift
//  Rocket.Chat
//
//  Created by Macbook Home on 03.03.2018.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import UIKit

class FilesListViewController: UIViewController {

    @IBOutlet weak var filesCollctionView: UICollectionView!
    var subscription: Subscription!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getGroupMessages()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getGroupMessages() {
        guard let subscription = subscription else { return }
        let request = SubscriptionMessagesRequest(roomName: subscription.name, type: subscription.type)
        API.current()?.fetch(request, succeeded: { result in

            guard let messages: Array = result.getMessages() else { return }
        }, errored: nil)
    }

    func getAttachments(_ message: Message!) {
        for attachment in message.attachments {
            let type = attachment.type

            if type == .image {
                // Create image in CollectionView
            }

            if type == .video {
                // Create video in CollectionView
            }
        }
    }
}

extension FilesListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension FilesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
