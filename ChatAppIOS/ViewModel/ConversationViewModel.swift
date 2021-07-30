//
//  ConversationViewModel.swift
//  ChatAppIOS
//
//  Created by saiprasad chindam on 30/07/21.
//

import Foundation

struct ConversationViewModel {
    private let conversation: Conversation
    
    var profileImageUrl: URL? {
        return URL(string: conversation.user.profileImageUrl)
    }
    
    var timestamp: String {
        let data = conversation.message.timestamp.dateValue()
        let dataformatter = DateFormatter()
        dataformatter.dateFormat = "hh:mm a"
        return dataformatter.string(from: data)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
