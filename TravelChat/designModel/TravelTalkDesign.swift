//
//  TravelTalkDesign.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit

enum DesignForRow {
    case TalkRoom
    
    var setting: CGFloat{
        switch self{
        case .TalkRoom : return 80
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
    
    func setting(UILabel uil: UILabel) {
        switch self{
        case .ProfileName :
            uil.font = .boldSystemFont(ofSize: 16)
        }
    }
}


enum DesignButton {
    case search
    
    func setting(UIButton uib: UIButton) {
        uib.tintColor = .systemGray2
        uib.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    }
}



