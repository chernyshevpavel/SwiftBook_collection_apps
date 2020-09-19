 //
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Павел Чернышев on 17.09.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false )

    @IBOutlet weak var emojiTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    @IBAction func textChanged(_ sender: UITextField) {
        updeteSaveBtnState()
    }
    
    private func updeteSaveBtnState() {
        guard let emojiTFCnt = emojiTF.text?.count else { return }
        guard let nameTFCnt = nameTF.text?.count else { return }
        guard let descriptionTFCnt = descriptionTF.text?.count else { return }
        saveBtn.isEnabled = emojiTFCnt > 0 && nameTFCnt > 0 && descriptionTFCnt > 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updeteSaveBtnState()
    }
    
    private func updateUI() {
        self.emojiTF.text = emoji.emoji
        self.nameTF.text = emoji.name
        self.descriptionTF.text = emoji.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emojiText = emojiTF.text ?? ""
        let nameText = nameTF.text ?? ""
        let descriptionText = descriptionTF.text ?? ""
        
        emoji = Emoji(emoji: emojiText, name: nameText, description: descriptionText , isFavourite: false )
    }

}
