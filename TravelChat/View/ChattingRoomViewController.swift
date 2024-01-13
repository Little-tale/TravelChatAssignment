/*
 //1. xib 인스턴스 생성
 let ChattingRoomXib = UINib(nibName: "LeftUserChattingTableViewCell", bundle: nil)
 
 // 2. 아웃렛 연결
 @IBOutlet var chattingRoomTabelView: UITableView!
 
 // 3.****** 레지스터 연결 -> 이거 너무 까먹는다
 // 레지스터 좀 그만 쳐 까먹자
 chattingRoomTabelView.register(ChattingRoomXib, forCellReuseIdentifier: "LeftUserChattingTableViewCell")
 
 // 4. 셀 생성 as!
 let cell = tableView.dequeueReusableCell(withIdentifier: "LeftUserChattingTableViewCell", for: indexPath) as! LeftUserChattingTableViewCell
 
 */


import UIKit

let ChattingRoomXib = UINib(nibName: "LeftUserChattingTableViewCell", bundle: nil)

class ChattingRoomViewController: UIViewController {
    @IBOutlet var chattingRoomTabelView: UITableView!
    var userName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftImage = UIImage(systemName: "chevron.left")
        // 색안바뀜 어케 바꾸지
        // -> 해결 렌더링 모드를 항상 오리지널로 줘야함
        // UIKit가 정한 템플릿 모드 로 지정되는데
        // 그걸 바꾸려면 이레야함
        let blackButton = leftImage?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        // 타겟 셀프로 안하면 뒤로 안가짐
        let backButton = UIBarButtonItem(image: blackButton, style: .plain, target: self, action: #selector(returnAction))
        navigationItem.leftBarButtonItem = backButton
        
        // 레지스터 좀 그만 쳐 까먹자
        chattingRoomTabelView.register(ChattingRoomXib, forCellReuseIdentifier: "LeftUserChattingTableViewCell")
        
        chattingRoomTabelView.dataSource = self
        chattingRoomTabelView.delegate = self
        
        
        // 셀 레이아웃 잘 잡고 셀 높이 유동적
        chattingRoomTabelView.estimatedRowHeight = 100
        chattingRoomTabelView.rowHeight = UITableView.automaticDimension
        
    }
    // 뒤로 안가지는 문제 발생 -> 해결 답은 target을 nil로 했었음
    // 뒤로가려면 누르셨던분을 지정해야 그분께 돌아가는데
    @objc func returnAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftUserChattingTableViewCell", for: indexPath) as! LeftUserChattingTableViewCell
                
        cell.profileNameLabel.text = userName
        return cell
    }
    // MARK: - 위에서 유동적으로 셀 높이를 지정하여서 해결
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    }
    
    func getCellHeight(_ vc: LeftUserChattingTableViewCell) -> CGFloat{
        return vc.ProfileMessageLabel.frame.height + 30
    }
}



