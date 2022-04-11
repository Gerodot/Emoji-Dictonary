//
//  CellManager.swift
//  TableViews
//
//  Created by Gerodot on 4/11/22.
//

import UIKit

class CellManager {
    func configure (_ cell: EmojiCell, with emoji: Emoji){
        cell.symbol.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descrioptionLabel.text = emoji.description
    }
}
