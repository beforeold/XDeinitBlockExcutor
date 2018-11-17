# XDeinitBlockExcutor
swift tool fo leave a message when an object deinits inspirited by [CYLDeallocExcutor](https://github.com/ChenYilong/CYLDeallocBlockExecutor)

you can use it to remove KVO or notification observer just where it starts.

for example:

```Swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = NSNotification.Name(rawValue: "NotiName")
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.response), name: name, object: nil)
        will.leave {[weak self] in
            NotificationCenter.default.removeObserver(self, name: name, object: nil)
        }
    }
    
    @objc func response() {}
}
```
