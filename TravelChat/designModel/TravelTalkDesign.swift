//
//  TravelTalkDesign.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit

enum leftORRight{
    
}


enum DesignForRow {
    case TalkRoom
    
    var setting: CGFloat{
        switch self{
        case .TalkRoom : return 80
        }
    }
}

enum UserCell {
    case left
    case right
    
    var getIdnty: String {
        switch self {
        case .left :
            return "LeftUserChattingTableViewCell"
        case .right :
            return "RightUserChattingTableViewCell"
        }
    }
    
    func desighCell() {
        switch self{
        case .left:
            print("asd")
        case .right:
            print("asdk")
        }
    }
}


enum DesignImage {
    case Profile
    // Type 'DesignImage.Type' has no member 'Profile'
    // 스태틱 으로 했다고 난리도 난리도 아니다 중말
    func setting(imageView : UIImageView, imageWidth: CGFloat){
        switch self {
            
        case .Profile :
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderWidth = 0.08
            imageView.layer.cornerRadius = imageWidth / 2
            
        }
        
    }
}

enum DesignTextFild {
    case search
//    // 흠 무조건 타입을 써야 하나 보다
//    // 어노퉤이쎤
//    var setting: Void {
//        
//    }
    
    func setting(UITextField uit: UITextField, backgroundView uv: UIView?){
        switch self{
        case .search :
            uit.backgroundColor = .clear
            uit.placeholder = "친구이름을 검색 해보세요"
            uit.font = .boldSystemFont(ofSize: 16)
            uit.borderStyle = .none
            // 원래는 뷰 다쓸줄 알았는데
            // 없는 케이스도 있어서 ? 로 수정
            uv?.backgroundColor = .systemGray6
            uv?.layer.cornerRadius = 9
        }
        
    }
}
enum DesignLabel {
    case ProfileName
    case ProfileMessage
    case date
    case chatRoomMessageLeft
    case rightChatMessage
    case leftUserName
    
    func setting(UILabel uil: UILabel) {
        switch self{
        case .ProfileName :
            uil.font = .boldSystemFont(ofSize: 16)
        case .ProfileMessage :
            uil.font = .systemFont(ofSize: 14)
            uil.textColor = .systemGray
        case .date :
            uil.textColor = .systemGray3
            uil.font = .systemFont(ofSize: 12)
        case .chatRoomMessageLeft :
            uil.font = .systemFont(ofSize: 14)
            uil.textColor = .black
            uil.textAlignment = .left
            // uil.layer.borderWidth = 0.4
            // uil.layer.cornerRadius = 12
        case .rightChatMessage :
            uil.font = .systemFont(ofSize: 14)
            uil.textColor = .black
        case .leftUserName :
            uil.font = .systemFont(ofSize: 12)
        }
    }
}
enum DesignBackground {
    case leftChat
    case rigthChat
    
    func setting(UIView uiv: UIView){
        switch self {
        case .leftChat:
            uiv.backgroundColor = .white
            uiv.layer.borderWidth = 0.8
            uiv.layer.cornerRadius = 12
            
        case .rigthChat :
            uiv.backgroundColor = .systemGray5
            uiv.layer.borderWidth = 0.5
            uiv.clipsToBounds = true
            uiv.layer.cornerRadius = 12
        
            
        }
    }
}


enum DesignButton {
    case search
    
    func setting(UIButton uib: UIButton) {
        switch self {
        case .search:
            uib.tintColor = .systemGray2
            uib.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        }
    }
}

enum DesignBarButton{
    case backButton
    
    func setting(target : Any? ,objcFunc: Selector ) -> UIBarButtonItem {
        switch self {
        case .backButton :
            let leftImage = UIImage(systemName: "chevron.left")
            let blackImage = leftImage?.withTintColor(.black, renderingMode: .alwaysOriginal)
            // 타겟을 self로 하면 뒤로 안가진다.
            // 열거형이 사용을 한다가 되버려서 이다.
            // 타겟을 매게 변수로 받아야 겠다.
            let blackBarButton = UIBarButtonItem(image: blackImage, style: .plain, target: target, action: objcFunc )
            return blackBarButton
        }
    }
}



