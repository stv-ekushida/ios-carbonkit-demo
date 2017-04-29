# ios-carbonkit-demo
iOS CarbonKitを利用したサンプル

<img width="147" alt="2017-04-20 7 10 32" src="https://cloud.githubusercontent.com/assets/9479568/25204497/b0e251d8-2598-11e7-9f75-faf5f167b315.png">


# 使い方

## 1. PodFileを設定する

```
pod 'CarbonKit'
```

## 2. importする

```swift:ViewController.swift
import CarbonKit
```

### 3. 使い方

```swift:ViewController.swift
    let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items,
                                                            delegate: self)
    carbonTabSwipeNavigation.insert(intoRootViewController: self)
    
    //初期表示するタブの番号
    carbonTabSwipeNavigation.currentTabIndex = 0

    //選択されていないタブの文字サイズとカラー
    carbonTabSwipeNavigation.setNormalColor(UIColor.black,
                                            font: UIFont.boldSystemFont(ofSize: 14))
                                            
    //選択されていいるタブの文字サイズとカラー                                        
    carbonTabSwipeNavigation.setSelectedColor(UIColor.blue,
                                              font: UIFont.boldSystemFont(ofSize: 14))
    //選択されているタブのインジケーターのカラー 
    carbonTabSwipeNavigation.setIndicatorColor(UIColor.blue)
```

# その他
ナビゲーションをカスタマイズしたいときは、下記のメソッドを利用する。<br>
なお、toolBarとView（targetView)は、親ViewのStoryboardで定義すること

```swift:ViewController.swift
    let CarbonTabSwipeNavigation(items: items, toolBar: toolbar, delegate: self)
    carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: targetView)
```

