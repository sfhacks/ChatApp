//
//  ChatHelper.swift
//  Chat
//
//  Created by sfhacks on 9/19/16.
//  Copyright © 2016 sfhacks. All rights reserved.
//

import Foundation

class ChatHelper {
    
    static let redisServer = Redis()
    
    static func connectToServer() {
        redisServer.server(endPoint: "127.0.0.1", onPort: 6379)
        redisServer.Command(Command: "Ping")
    }
    
    static func sendMessage(name: String, message: String) {
        redisServer.Command(Command: "EXISTS " + name)
        let answer = message.components(separatedBy: " ")
        print(answer)
        
        for i in 0 ..< answer.count {
            redisServer.Command(Command: "APPEND " + name + " " + (" " + answer[i]))
        }
        
    }
    
}
