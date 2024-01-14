//
//  Identifier.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/14/24.
//

import Foundation

enum Identifier: String{
    case chattingRoom = "ChattingRoomViewController"
    
    enum ChattingCell: String{
        case left = "LeftUserChattingTableViewCell"
        case right = "RightUserChattingTableViewCell"
        
    }
    enum ChattingListCell: String{
        case list =  "TravelChattingListTableViewCell"
    }

}



