//
//  TravelTalkDesign.swift
//  TravelChat
//
//  Created by Jae hyung Kim on 1/12/24.
//

import UIKit

enum DesignImage {
    case Profile
    
    // Type 'DesignImage.Type' has no member 'Profile'
    // 스태틱 으로 했다고 난리도 난리도 아니다 중말
    func setting(imageView : UIImageView, imageWidth: CGFloat){
        switch self {
            
        case .Profile :
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.layer.borderWidth = 0.2
            imageView.layer.cornerRadius = imageWidth / 2
            
        }
        
    }
}

