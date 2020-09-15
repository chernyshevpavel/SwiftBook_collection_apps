//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by Павел Чернышев on 15.09.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(emoji: Emoji) {
        self.emojiLabel.text = emoji.emoji
        self.nameLabel.text = emoji.name
        self.descriptionLabel.text = emoji.description
    }
}
