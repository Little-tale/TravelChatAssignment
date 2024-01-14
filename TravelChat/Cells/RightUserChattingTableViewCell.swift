//
//  RightUserChattingTableViewCell.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/13/24.
//

import UIKit

class RightUserChattingTableViewCell: UITableViewCell {
    @IBOutlet var rightDateLabel: UILabel!
    @IBOutlet var rightBackgroundView: UIView!
    @IBOutlet var righMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

// MARK:  디자인 영역 ->

extension RightUserChattingTableViewCell{
    func design() {
        DesignBackground.rigthChat.setting(UIView: rightBackgroundView)
        DesignLabel.rightChatMessage.setting(UILabel: righMessageLabel)
        DesignLabel.date.setting(UILabel: rightDateLabel)
    }
}
