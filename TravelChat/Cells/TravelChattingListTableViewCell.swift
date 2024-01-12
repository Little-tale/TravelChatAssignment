//
//  TravelChattingListTableViewCell.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit

class TravelChattingListTableViewCell: UITableViewCell {
    @IBOutlet var ProfileImageView: UIImageView!
    @IBOutlet var ProfileMainLabel: UILabel!
    @IBOutlet var ProfileSubLabel: UILabel!
    @IBOutlet var ProfileDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
