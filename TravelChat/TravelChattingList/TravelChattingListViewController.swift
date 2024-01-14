//
//  TravelChattingListViewController.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit
import Kingfisher

let chattingListXib = UINib(nibName: NIBName.ChattingListXib.rawValue, bundle: nil)
var everyone = User.allCases
var chatListFilter: [ChatRoom] = mockChatList
var getSearchText = ""

// 집합으로 방안에 유저들 모으고 걸러
var testSet: Set<String> = []


class TravelChattingListViewController: UIViewController {
    @IBOutlet var chattingListTabelView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        chatListFilter = mockChatList
//        for item in chatListFilter{
//            print(item.chatList)
//        }
//        print("TestList : ",testList)
        
        
        chattingListTabelView.register(chattingListXib, forCellReuseIdentifier: Identifier.ChattingListCell.list.rawValue)
        
        chattingListTabelView.delegate = self
        chattingListTabelView.dataSource = self
        
        searchBar.placeholder = "친구 이름을 검색해 보세요"
        searchBar.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // 스토리보드 찾기
        let ChattiongRoomstoryBoard = UIStoryboard(name: storyBoardName.ChattingRoom.rawValue, bundle: nil)
        // 스토리 보드 안에 있는 뷰 찾기
        let storyBoardView = ChattiongRoomstoryBoard.instantiateViewController(withIdentifier: Identifier.chattingRoom.rawValue) as! ChattingRoomViewController
        
        // 해당 뷰컨 으로 형변환
        // 해당 스토리 보드에 받을 공간 만들고
        // 그공간에 전달
        
        
        // 차라리 ChatRoom을 넘겨준다면?
        storyBoardView.userName = mockChatList[indexPath.row].chatroomName
        
        storyBoardView.chatRoom = mockChatList[indexPath.row]
        
        storyBoardView.chat = mockChatList[indexPath.row].chatList
        // 특정행-> 효과 지워주세요
        tableView.reloadRows(at: [indexPath], with: .fade  )
        
        // 푸시 연결
        navigationController?.pushViewController(storyBoardView, animated: true)
        
        
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
        
        return chatListFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.ChattingListCell.list.rawValue, for: indexPath) as! TravelChattingListTableViewCell
        
        //@@@/ 하도 반복되서 따로 가져옴
        let chatindexRow = chatListFilter[indexPath.row]
        
        // MARK: - 목쳇리스트 채팅방 이름 넣기
        // print(mockChatList[indexPath.row].chatroomName)
        cell.ProfileMainLabel.text = chatindexRow.chatroomName
        
        // MARK: - 채팅방 마지막 메시지 넣어주기
        cell.ProfileSubLabel.text = chatindexRow.chatList.last?.message
        
        
        //print(mockChatList[indexPath.row].chatList.first?.getDate)
        // MARK: - 마지막 채팅방 날짜 넣어주기
        cell.ProfileDateLabel.text = chatindexRow.chatList.last?.getDate
        
        // MARK: - 이미지 넣어주기
        // 와 잠만... 아... 옵션은 일단 한개만 해보고 넘어가 보자
        // 잭님 부분에서 휴님 튀어나와서 놀래서 일단은 잭님으로 수정했다.
        // print(chatindexRow.chatroomImage.first)
        cell.ProfileImageView.image = UIImage(named: chatindexRow.chatroomImage.first ?? "Hue")
        
        // MARK: - 이미지 디자인 -> 셀
        // 디자인은 셀에서 처리해 보자.
        
        testSet.removeAll()
        
       
        // print("공간이 만들어짐? -> ",testList)
        // print(testList.first)
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  DesignForRow.TalkRoom.setting
    }
    
    
    
    
}
extension TravelChattingListViewController: UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getSearchText = searchText
        print("인식되는 : ", getSearchText)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        chattingListTabelView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("검색버튼 클리")
        // print(filterRoomPerson)
        
        findUserRoom()
        view.endEditing(true)
    }
    
    
}

extension TravelChattingListViewController {
    
    func findUserRoom() {
        let filters = getSearchText  // findUserName()
        var filteredChatRooms: [ChatRoom] = []
        print(filters)
        // 검색 글자가 안비어있다면
           if !getSearchText.isEmpty {
                // 모든 채팅방에서
               for chatRooms in mockChatList{
                   // 모든 채팅을
                   for chats in chatRooms.chatList {
                       // 채팅의 유저들중
                       // 검색 글자가 포함 되어 있다면
                       if chats.user.rawValue == getSearchText{
                           print(chats)
                           // 필터 방에 업데이트
                           filteredChatRooms.append(chatRooms)
                           break
                       }
                   }
               }
               
           } else {
               // 검색어가 비어있으면 모든 채팅방을 표시
               // 검색어가 비어있다면 모두 제거
               filteredChatRooms = mockChatList
               chatListFilter = mockChatList
           }
        print(filteredChatRooms.count)
        for item in filteredChatRooms{
            print(item.chatroomName) // 왜 도봉 멘토방과 젝님이 나오는 거지 미쳐버리겠네
        }
           // 필터링된 결과를 chatListFilter에 할당하고 테이블 뷰를 업데이트
           chatListFilter = filteredChatRooms
           chattingListTabelView.reloadData()
    }
    
}

