//
//  Emoji.swift
//  TableViews
//
//  Created by Gerodot on 4/10/22.
//

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init (symbol: String = "", name: String = "", description: String = "", usage: String = "") {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}


extension Emoji {
    static var all: [Emoji] {
      return [
        Emoji(symbol: "⭐️", name: "Звезда", description: "Желтая пятиконечная звезда", usage: "Отметка нравится или рейтинг в звездах"),
        Emoji(symbol: "🐶", name: "Собака", description: "Мордочка собаки", usage: "Нечто позитивное"),
        Emoji(symbol: "✅", name: "Галочка", description: "Галочка на зеленом фоне", usage: "Отметка выполненной задачи"),
        Emoji(symbol: "🛑", name: "Стоп", description: "Дорожный знак \"Стоп\"", usage: "Отметка нравится или рейтинг в звездах"),
        Emoji(symbol: "‼️", name: "Восклицательные знаки", description: "Красные восклицательные знаки", usage: "Отметка особого внимания или важности"),
      ]
    }
    
    static func loadAll () -> [Emoji]? {
        return nil
    }
    
    static func loadDefault () -> [Emoji]? {
        return all
    }
}

