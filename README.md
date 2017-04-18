# ios-carbonkit-demo
iOS CarbonKitを利用したサンプル

# 使い方

## 1. PodFileを設定する

```
pod 'CarbonKit'
```

## 2. importする

```
import CarbonKit
```

## 3. サンプル

```
import CarbonKit

final class ViewController: UIViewController {
    
    var items = ["1st","2nd","3rd"]
    var carbonTabSwipeNavigation = CarbonTabSwipeNavigation()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.blue)
        carbonTabSwipeNavigation.currentTabIndex = 0

        let tabWidth = UIScreen.main.bounds.size.width / CGFloat(items.count)
        
        for (i,_) in items.enumerated() {
            
            if let segmentControl = carbonTabSwipeNavigation.carbonSegmentedControl {
                segmentControl.setWidth(tabWidth,forSegmentAt: i)
            }
        }
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.black,
                                                font: UIFont.boldSystemFont(ofSize: 14))
        carbonTabSwipeNavigation.setSelectedColor(UIColor.blue,
                                                  font: UIFont.boldSystemFont(ofSize: 14))
    }    
}

// MARK: - CarbonTabSwipeNavigationDelegate
extension ViewController: CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation,
                                  viewControllerAt index: UInt) -> UIViewController {        
        switch index {
        case 0:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") {
                return vc
            }

        case 1:
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") {
                return vc
            }

        case 2:
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewControlller") {
                return vc
            }
            
        default:
            fatalError("unknown index")
        }
        
        fatalError("unwap storyboard")
    }
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation,
                                  didMoveAt index: UInt) {
        
        self.title = items[Int(index)]
    }
}
```


# その他
ナビゲーションをカスタマイズしたいときは、下記のメソッドを利用する
なお、toolBarとView（yourView)は、Storyboardで定義すること

```
carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: yourView)
```

