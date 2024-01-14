
import UIKit

class LeftUserChattingTableViewCell: UITableViewCell {
    @IBOutlet var ProfileMiniImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var ProfileMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chattingLeftView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}



// MARK: - 디자인 영역
extension LeftUserChattingTableViewCell{
    func design(){
        DesignLabel.chatRoomMessageLeft.setting(UILabel: ProfileMessageLabel)
        DesignBackground.leftChat.setting(UIView: chattingLeftView)
        DesignLabel.date.setting(UILabel: dateLabel)
        DesignLabel.leftUserName.setting(UILabel: profileNameLabel)
    }
}
