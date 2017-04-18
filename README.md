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

# その他
ナビゲーションをカスタマイズしたいときは、下記のメソッドを利用する
なお、toolBarとView（yourView)は、Storyboardで定義すること

```
carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: yourView)
```

