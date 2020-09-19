//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Павел Чернышев on 15.09.2020.
//  Copyright © 2020 Павел Чернышев. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var objects = [
        Emoji(emoji: "😘", name: "Love", description: "Let's love each other", isFavourite: false),
        Emoji(emoji: "😆", name: "Lough", description: "Let's lough at each other", isFavourite: false),
        Emoji(emoji: "🥶", name: "Cold", description: "Let's keep warm", isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.title = "Emoji Reader"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editEmoji" else { return }
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let newEmojiTVC = navigationVC.topViewController as? NewEmojiTableViewController else { return }
        guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
        let emoji = objects[indexPath.row]
        newEmojiTVC.emoji = emoji
        newEmojiTVC.title = "Edit"
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        guard let newEmojiVC = segue.source as? NewEmojiTableViewController else {return}
        let emoji = newEmojiVC.emoji
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            objects[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .fade  )
        } else {
            objects.append( newEmojiVC.emoji)
            let newIndexPath = IndexPath(row: objects.count, section: 0)
         self.tableView.insertRows(at: [newIndexPath], with: .fade )
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = objects[indexPath.row]
        cell.set(emoji: emoji)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favoutite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, favoutite])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "done") {(action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var emoji = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            emoji.isFavourite = !emoji.isFavourite
            self.objects[indexPath.row] = emoji
            completion(true)
        }
        action.backgroundColor = emoji.isFavourite ? .systemRed : .systemGray
        action.image = UIImage(systemName: "heart")
        return action
    }
}
