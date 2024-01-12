//
//  TravelChattingListViewController.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit
import Kingfisher

let chattingListXib = UINib(nibName: "TravelChattingListTableViewCell", bundle: nil)



class TravelChattingListViewController: UIViewController {
    @IBOutlet var chattingListTabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chattingListTabelView.register(chattingListXib, forCellReuseIdentifier: "TravelChattingListTableViewCell")
        chattingListTabelView.delegate = self
        chattingListTabelView.dataSource = self
        
    }


}

extension TravelChattingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 구조체를 CaseIterabel 로 변환후
        // print(User.allCases.count)
        // print(User.allCases)
        // 구조체 내려보면, 뭔가 많이 구현되었다.
        // MARK: - 목쳇 리스트 채팅방 갯수 (배열갯수로 접근해봄)
        print(mockChatList.count)
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelChattingListTableViewCell", for: indexPath) as! TravelChattingListTableViewCell
        
        // cell.ProfileMainLabel.text =
        
        //@@@/ 하도 반복되서 따로 가져옴
        let chatindexRow = mockChatList[indexPath.row]
        
        // MARK: - 목쳇리스트 채팅방 이름 넣기
        // print(mockChatList[indexPath.row].chatroomName)
        cell.ProfileMainLabel.text = chatindexRow.chatroomName
        
        // MARK: - 채팅방 마지막 메시지 넣어주기
        cell.ProfileSubLabel.text = chatindexRow.chatList.last?.message
        
        
        //print(mockChatList[indexPath.row].chatList.first?.getDate)
        // MARK: - 마지막 채팅방 날짜 넣어주기
        cell.ProfileDateLabel.text = chatindexRow.chatList.last?.getDate
        
        // cell.ProfileImageView.image =
        // print("TT",User.allCases[indexPath.row].profileImage)
        
        // MARK: - 이미지 넣어주기
        // 와 잠만... 아... 옵션은 일단 한개만 해보고 넘어가 보자
        // 잭님 부분에서 휴님 튀어나와서 놀래서 일단은 잭님으로 수정했다.
        // print(chatindexRow.chatroomImage.first)
        cell.ProfileImageView.image = UIImage(named: chatindexRow.chatroomImage.first ?? "Hue")
        
        // MARK: - 이미지 디자인 -> 셀
        // 디자인은 셀에서 처리해 보자.
      
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
   
    override func viewDidLayoutSubviews() {
        
    }
    
}

