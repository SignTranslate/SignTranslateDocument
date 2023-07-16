//
//  Services+translation.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import SwiftUI
import Combine

extension Services{
    public struct Translation: ServiceProtocol{
        public var isExpress: Bool = false
        public var processed: Bool = false
        public var requested: Bool = false
        public var languagePair:LanguagePair = .rusEng
        public var expressCost: Double = 30
        public var standardCost: Double = 10
        public var legalDocsCost: Double = 60
        public var requestingForConfirmation:Bool = false
        public var deeplResult:UIImage? = nil
        public var translationPreviewImage:UIImage? = nil
        public var originalBackground:Bool = true
        public var confirmed: Bool = false
        public var isLegalDocs:Bool = false
        public var cost:Double{
            let expressFee:Double = isExpress ? expressCost:0.0
            let legalFee:Double = isLegalDocs ? legalDocsCost: 0.0
            return standardCost + expressFee + legalFee
        }
        public var previewAvailable: Bool{
            translationPreviewImage != nil
        }
        public init(){
            
        }
        public init(isExpress: Bool, processed: Bool, requested: Bool, languagePair: LanguagePair, expressCost: Double, standardCost: Double, legalDocsCost: Double, requestingForConfirmation: Bool, deeplResult: UIImage? = nil, translationPreviewImage: UIImage? = nil, originalBackground: Bool, confirmed: Bool, isLegalDocs: Bool) {
            self.isExpress = isExpress
            self.processed = processed
            self.requested = requested
            self.languagePair = languagePair
            self.expressCost = expressCost
            self.standardCost = standardCost
            self.legalDocsCost = legalDocsCost
            self.requestingForConfirmation = requestingForConfirmation
            self.deeplResult = deeplResult
            self.translationPreviewImage = translationPreviewImage
            self.originalBackground = originalBackground
            self.confirmed = confirmed
            self.isLegalDocs = isLegalDocs
        }

    }
   
    
    
    public enum LanguagePair:String, Codable, CaseIterable{
        case others = "others"
        case rusEng = "Russian to English"
        case rusTha = "Russian to Thai"
        case rusChn = "Russian to Chinese"
        case chnEng = "Chinese to English"
        case chnTha = "Chinese to Thai"
        case chnRus = "Chinese to Russian"
        case engTha = "English to Thai"
        case engRus = "English to Russian"
        case engChn = "English to Chinese"
        case thaEng = "Thai to English"
        case thaChn = "Thai to Chinese"
        case thaRus = "Thai to russian"
    }
    
}

extension Services.LanguagePair{
    // MARK: google label
    public var googLabel:(String,String){
        switch self{
        case .others:
            return ("en","ru")
        case .rusEng:
            return ("ru","en")
        case .rusTha:
            return ("ru","th")
        case .rusChn:
            return ("ru", "zh")
        case .chnEng:
            return ("zh","en")
        case .chnRus:
            return ("zh", "ru")
        case .chnTha:
            return ("zh", "th")
        case .engTha:
            return ("en", "th")
        case .engRus:
            return ("en", "ru")
        case .engChn:
            return ("en", "zh")
        case .thaEng:
            return ("th", "en")
        case .thaChn:
            return ("th", "zh")
        case .thaRus:
            return ("th", "ru")
        }
    }
    
}
