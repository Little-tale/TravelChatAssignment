import UIKit

let ChattingRoomXib = UINib(nibName: NIBName.ChattingLeftXib.rawValue, bundle: nil)
let ChattingRightXib = UINib(nibName: NIBName.ChattingRightXib.rawValue, bundle: nil)

class ChattingRoomViewController: UIViewController {
    @IBOutlet var chattingRoomTabelView: UITableView!
    var userName : String = ""
    var chatRoom : ChatRoom?
    var chat: [Chat?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let backButton = DesignBarButton.backButton.setting(target: self ,objcFunc: #selector(returnAction))
        navigationItem.leftBarButtonItem = backButton
        
        // 레지스터 좀 그만 쳐 까먹자
        chattingRoomTabelView.register(ChattingRoomXib, forCellReuseIdentifier: UserCell.left.getIdnty )
        
        chattingRoomTabelView.register(ChattingRightXib, forCellReuseIdentifier: UserCell.right.getIdnty)
        
        chattingRoomTabelView.dataSource = self
        chattingRoomTabelView.delegate = self
        
        
        // 셀 레이아웃 잘 잡고 셀 높이 유동적
        chattingRoomTabelView.estimatedRowHeight = 100
        chattingRoomTabelView.rowHeight = UITableView.automaticDimension
        
        
        
        // 방 이름 즉 유저 이름
        navigationItem.title = chatRoom?.chatroomName
       
        
        chattingRoomTabelView.separatorStyle = .none
        chattingRoomTabelView.allowsSelection = false
        
    }
    // 뒤로 안가지는 문제 발생 -> 해결 답은 target을 nil로 했었음
    // 뒤로가려면 누르셨던분을 지정해야 그분께 돌아가는데
    @objc func returnAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoom?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 이제 유저에 따라 leftCell or RightCell 을 구분져야지
        // 받아온것으로 할까 고민했는데
        guard let chat = chatRoom?.chatList[indexPath.row] else {
            return UITableViewCell()
        }
        
        if chat.user != User.user{
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.ChattingCell.left.rawValue , for: indexPath) as! LeftUserChattingTableViewCell
            // cell.profileNameLabel.text = userName
            cell.profileNameLabel.text = chatRoom?.chatList[indexPath.row].user.rawValue
            
            cell.ProfileMessageLabel.text = chatRoom?.chatList[indexPath.row].message
            
            // MARK: - 이미지 넣기
            guard let chatListOf = chatRoom?.chatList[indexPath.row] else {
                return cell
            }
            let miniProfileImage = chatListOf.user.profileImage
            cell.ProfileMiniImageView.image = UIImage(named: miniProfileImage)
            
            cell.dateLabel.text = chatListOf.getTime
            
            
            return cell
            
        }else {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: Identifier.ChattingCell.right.rawValue, for: indexPath) as! RightUserChattingTableViewCell
            guard let chatListOf = chatRoom?.chatList[indexPath.row] else {
                return UITableViewCell()
            }
            
            rightCell.righMessageLabel.text = chat.message
            rightCell.rightDateLabel.text = chatListOf.getTime
            
            return rightCell
        }
        
 
    }

}



