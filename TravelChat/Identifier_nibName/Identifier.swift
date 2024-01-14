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

enum chatLeftRight {
    case left
    case right
    
    func getIdenty() -> String{
        switch self {
        case .left : return Identifier.ChattingCell.left.rawValue
        case .right : return Identifier.ChattingCell.right.rawValue
        }
    }
}


