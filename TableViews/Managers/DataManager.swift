//
//  DataManager.swift
//  TableViews
//
//  Created by Gerodot on 4/14/22.
//

import Foundation
 
class DataManager {
    
    var archiveURL: URL? {
        guard let documentDictonary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDictonary.appendingPathComponent("emojis").appendingPathExtension("plist")
        
    }
    func loadEmojis () -> [Emoji]?{
        guard let archiveURL = archiveURL else {return nil}
        guard let encodedEmoji = try? Data(contentsOf: archiveURL) else { return nil }
        
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Emoji].self, from: encodedEmoji)
    }
    
    func saveEmojis(_ emojis: [Emoji]){
        guard let archiveURL = archiveURL else {return}
        
        let encoder = PropertyListEncoder()
        guard let encodedEmoji = try? encoder.encode(emojis) else {return}
        
        try? encodedEmoji.write(to: archiveURL, options: .noFileProtection)
    }
}
