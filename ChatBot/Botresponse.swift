//
//  Botresponse.swift
//  ChatBot
//
//  Created by SUshil on 18/02/22.
//

import Foundation
func getResponse(message:String)->String{
    let tempMessage = message.lowercased()
    if tempMessage.contains("hello"){
        return "hey there!"
    }else if tempMessage.contains("goodbys"){
        return "Talk to you lateer!"
    }else if tempMessage.contains("how are you"){
        return "I'm fine ,how about you?"
    }else{
        return "that's cool."
    }
}
