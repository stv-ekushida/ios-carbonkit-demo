# ios-carbonkit-demo
iOS CarbonKitを利用したサンプル

# 使い方

## 1. PodFileを設定する

```
pod 'CarbonKit'
```

## 2. importする

```swift:
import CarbonKit
```

### 3. 使い方

```swift:
    let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items,
                                                            delegate: self)
    carbonTabSwipeNavigation.insert(intoRootViewController: self)

    carbonTabSwipeNavigation.setIndicatorColor(UIColor.blue)
    carbonTabSwipeNavigation.currentTabIndex = 0

    carbonTabSwipeNavigation.setNormalColor(UIColor.black,
                                            font: UIFont.boldSystemFont(ofSize: 14))
    carbonTabSwipeNavigation.setSelectedColor(UIColor.blue,
                                              font: UIFont.boldSystemFont(ofSize: 14))
```

# その他
ナビゲーションをカスタマイズしたいときは、下記のメソッドを利用する
なお、toolBarとView（targetView)は、Storyboardで定義すること

```swift:
    let CarbonTabSwipeNavigation(items: items, toolBar: toolbar, delegate: self)
    carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: targetView)
```

