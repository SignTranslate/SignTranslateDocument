//
//  Services+translation.swift
//  SignTranslate
//
//  Created by nic wanavit on 5/20/23.
//

import SwiftUI
import Combine

extension Services{
    struct Translation: ServiceProtocol{
        var isExpress: Bool = false
        var processed: Bool = false
        var requested: Bool = false
        var languagePair:LanguagePair = .rusEng
        var expressCost: Double = 30
        var standardCost: Double = 10
        var legalDocsCost: Double = 60
        var requestingForConfirmation:Bool = false
        var deeplDocument:DeeplApi.DocumentResponse? = nil
        var deeplStatus:DeeplApi.DocumentStatus? = nil
        var deeplResult:UIImage? = nil
        var translationPreviewImage:UIImage? = nil
        var originalBackground:Bool = true
        var confirmed: Bool = false {
        didSet{
            chargeCost()
        }
    }
        var isLegalDocs:Bool = false
        var cost:Double{
            let expressFee:Double = isExpress ? expressCost:0.0
            let legalFee:Double = isLegalDocs ? legalDocsCost: 0.0
            return standardCost + expressFee + legalFee
        }
        var previewAvailable: Bool{
            translationPreviewImage != nil
        }

    }
   
    
    
    enum LanguagePair:String, Codable, CaseIterable{
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
    /// Returns the (sourceLang, DestinationLang) for deepl
    var deeplLabel:(String,String){
        switch self{
        case .others:
            return ("OT","OT")
        case .rusEng:
            return ("RU","EN-US")
        case .rusTha:
            return ("RU","TH")
        case .rusChn:
            return ("RU", "ZN")
        case .chnEng:
            return ("ZN","EN-US")
        case .chnRus:
            return ("ZN", "RU")
        case .chnTha:
            return ("ZN", "TH")
        case .engTha:
            return ("EN", "TH")
        case .engRus:
            return ("EN", "RU")
        case .engChn:
            return ("EN", "ZN")
        case .thaEng:
            return ("TH", "EN")
        case .thaChn:
            return ("TH", "ZN")
        case .thaRus:
            return ("TH", "RU")
        }
    }
    var googLabel:(String,String){
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
extension Services.Translation{
    mutating func deeplTranslate(image:UIImage)async{
        let (sourceLang, targetLang) = self.languagePair.deeplLabel
        do {
            guard let response = try await DeeplApi.standard.translateDocs(pdfData: image.pdfData, sourceLang: sourceLang, targetLang: targetLang) else {return}
            self.deeplDocument = response
        } catch{
            print("there is something wrong while upload image for translation \(error)")
        }
    }
}
