//
//  TravelChattingListTableViewCell.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit
// LeftUserChattingTableViewCell

class TravelChattingListTableViewCell: UITableViewCell {
    @IBOutlet var ProfileImageView: UIImageView!
    @IBOutlet var ProfileMainLabel: UILabel!
    @IBOutlet var ProfileSubLabel: UILabel!
    @IBOutlet var ProfileDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
  
}

// MARK: - 이미지 코너 레디우스 영역
extension TravelChattingListTableViewCell {

    //Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
    func designMainImage() {
        let width = ProfileImageView.frame.width
        DesignImage.Profile.setting(imageView: ProfileImageView, imageWidth: width)
    }
    
    // MARK: - 레이아웃 변동시 함수 실행
    // 화난다.... Super. 거시기가 없어서 안됬었다.
    override func layoutSubviews() {
        super.layoutSubviews()
        designMainImage()
    }
}

// MARK: - 디자인 영역-
extension TravelChattingListTableViewCell {
    
    func design(){
        designProfileName()
        designProfileMessage()
        designDateLabel()
    }
    
    func designProfileName(){
        DesignLabel.ProfileName.setting(UILabel: ProfileMainLabel)
    }
    func designProfileMessage(){
        DesignLabel.ProfileMessage.setting(UILabel: ProfileSubLabel)
    }
    
    func designDateLabel(){
        DesignLabel.date.setting(UILabel: ProfileDateLabel)
    }
}
