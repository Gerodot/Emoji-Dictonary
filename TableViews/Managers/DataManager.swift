//
//  DataManager.swift
//  TableViews
//
//  Created by Gerodot on 4/14/22.
//

import Foundation

class DataManager {
    // MARK: - Propertis
    var archiveURL: URL? {
        guard let documentDictonary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDictonary.appendingPathComponent("emojis").appendingPathExtension("json")
        
    }
    
    var oldURL: URL? {
        guard let documentDictonary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentDictonary.appendingPathComponent("emojis").appendingPathExtension("plist")
    }
    
    // MARK: - Methods
    // JSON file data loader
    func loadEmojis () -> [Emoji]?{
        guard let archiveURL = archiveURL else {return nil}
        guard let encodedEmoji = try? Data(contentsOf: archiveURL) else { return  loadOldEmojisData() }
        
        let decoder = JSONDecoder()
        return try? decoder.decode([Emoji].self, from: encodedEmoji)
    }
    
    // Old data loader from plist File
    func loadOldEmojisData() -> [Emoji]? {
        guard let oldURL = oldURL else { return nil }
        guard let encodedOldEmoji = try? Data(contentsOf: oldURL) else { return nil }
        
        let oldDecoder = PropertyListDecoder()
        return try! oldDecoder.decode([Emoji].self, from: encodedOldEmoji)
    }
    
    // Save data to JSON file
    func saveEmojis(_ emojis: [Emoji]){
        guard let archiveURL = archiveURL else {return}
        
        let encoder = JSONEncoder()
        guard let encodedEmoji = try? encoder.encode(emojis) else {return}
        
        try? encodedEmoji.write(to: archiveURL, options: .noFileProtection)
    }
}
