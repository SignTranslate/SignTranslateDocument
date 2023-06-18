
import Foundation
import CryptoKit

extension String {
    var data:Data{
        Data(self.utf8)
    }
    private func hash<H: HashFunction>(with closure: () -> H) -> String {
        let hash = H.hash(data: self.data)
        let hashString = hash.map({ $0.hex }).joined()
        print("hash string is ", hashString)
        return hashString
    }
    
    
    var md5: String {
        return hash { Insecure.MD5() }
    }
    
    var sha1: String {
        return hash { Insecure.SHA1() }
    }
    
    var sha256: String {
        return hash { SHA256() }
    }
    
    var sha384: String {
        return hash { SHA384() }
    }
    
    var sha512: String {
        return hash { SHA512() }
    }
    
}
