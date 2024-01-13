
import UIKit

class LeftUserChattingTableViewCell: UITableViewCell {
    @IBOutlet var ProfileMiniImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var ProfileMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chattingLeftView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
