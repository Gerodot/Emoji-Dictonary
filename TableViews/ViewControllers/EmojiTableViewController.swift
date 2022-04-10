//
//  EmojiTableViewController.swift
//  TableViews
//
//  Created by Gerodot on 4/11/22.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // MARK: - Properites
    let cellManager = CellManager()
    var emojis: [Emoji]!
    
    // MARK: - UIViewController Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = Emoji.loadAll() ?? Emoji.loadDefault()
    }
    
}

// MARK: - UITableViewSouces
extension EmojiTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")!
        cellManager.configure(cell, with: emoji)
        return cell
    }
}
