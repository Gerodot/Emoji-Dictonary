//
//  Emoji.swift
//  TableViews
//
//  Created by Gerodot on 4/10/22.
//

struct Emoji {
    var symbol: String
    var name: String
    var desctioption: String
    var usage: String
}

extension Emoji {
    init(
        symbol: String = "",
        name: String = "",
        description: String = "",
        usage: String = ""
    ) {
        self.symbol = symbol
        self.name = name
        self.desctioption = description
        self.usage = usage
    }
}
