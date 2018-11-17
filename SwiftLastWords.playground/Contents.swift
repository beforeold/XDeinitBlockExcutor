

import Foundation


enum XDeinit {
    class BlockExecutor {
        var block: (()->Void)?
        init(_ block: (()->Void)?) { self.block = block }
        deinit {
            if let block = block { block() }
        }
    }
}

extension NSObjectProtocol {
    var will: Self { return self }
}

extension NSObject {
    static var LastWordsKey: Any? = nil
    func leave(with lastWords: (()->Void)?) {
        let ex = XDeinit.BlockExecutor(lastWords)
        objc_setAssociatedObject(self, &NSObject.LastWordsKey, ex, .OBJC_ASSOCIATION_RETAIN)
    }
}

var obj: NSObject? = nil
obj = NSObject()
obj?.will.leave { print("be good.") }
obj = nil
