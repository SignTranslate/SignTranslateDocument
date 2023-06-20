
import Foundation
import CryptoKit

extension String {
    public var data:Data{
        Data(self.utf8)
    }
    private func hash<H: HashFunction>(with closure: () -> H) -> String {
        let hash = H.hash(data: self.data)
        let hashString = hash.map({ $0.hex }).joined()
        print("hash string is ", hashString)
        return hashString
    }
    
    
    public var md5: String {
        return hash { Insecure.MD5() }
    }
    
    public var sha1: String {
        return hash { Insecure.SHA1() }
    }
    
    public var sha256: String {
        return hash { SHA256() }
    }
    
    public var sha384: String {
        return hash { SHA384() }
    }
    
    public var sha512: String {
        return hash { SHA512() }
    }
    
}
