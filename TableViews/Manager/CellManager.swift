//
//  CellManager.swift
//  TableViews
//
//  Created by Gerodot on 4/11/22.
//

import UIKit

class CellManager {
    func configure (_ cell: UITableViewCell, with emoji: Emoji){
        cell.textLabel?.text = emoji.symbol
        cell.detailTextLabel?.text = emoji.name
    }
}
