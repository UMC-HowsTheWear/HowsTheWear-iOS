# 코딩컨벤션

Swift 코드를 이해하기 쉽고 명확하게 작성하기 위한 스타일 가이드입니다. 구성원들의 의사결정에 따라 수시로 변경될 수 있습니다.

본 문서에 나와있지 않은 규칙은 아래 문서를 따릅니다.

- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines)
- [SE-0005](https://github.com/apple/swift-evolution/blob/master/proposals/0005-objective-c-name-translation.md)

## 목차

- 코드 레이아웃
    - 들여쓰기 및 띄어쓰기
    - 줄바꿈
    - 최대 줄 길이
    - 빈 줄
    - 임포트
- 네이밍
    - 타입
    - 함수
    - 변수
    - 상수
    - 열거형
    - 약어
- 클로저
- 클래스와 구조체
- 타입
- 주석
- 프로그래밍 권장사항

## 코드 레이아웃

### 들여쓰기 및 띄어쓰기

- 들여쓰기에는 탭(tab)을 사용합니다.
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.
    
    ```
    let names: [String: String]?
    ```
    

### 줄바꿈

- 함수 정의가 최대 길이를 초과하는 경우에는 아래와 같이 줄바꿈합니다.
    
    ```
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        // doSomething()
    }
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        // doSomething()
    }
    
    ```
    
- 함수를 호출하는 코드가 최대 길이를 초과하는 경우에는 파라미터 이름을 기준으로 줄바꿈합니다.
    
    ```
    let actionSheet = UIActionSheet(
        title: "정말 계정을 삭제하실 건가요?",
        delegate: self,
        cancelButtonTitle: "취소",
        destructiveButtonTitle: "삭제해주세요"
    )
    
    ```
    
    단, 파라미터에 클로저가 2개 이상 존재하는 경우에는 무조건 내려쓰기합니다.
    
    ```
    UIView.animate(
        withDuration: 0.25,
        animations: {
          // doSomething()
        },
        completion: { finished in
          // doSomething()
        }
    )
    
    ```
    
- `if let` 구문이 길 경우나, 여러 조건일 경우, 줄바꿈하고 `if` 다음 구문과 라인을 맞춥니다.
    
    ```
    if let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
       let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
       user.gender == .female {
        // ...
    }
    
    ```
    
- `guard` 구문이 길 경우, `else`다음 단을 줄바꿈하고 한 칸 들여씁니다.
    
    ```
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser() else {
        return nil
    }
    
    ```
    
- `guard`구문의 조건이 여러개일 경우, 줄바꿈하고 한 칸 들여씁니다. `else`는 `guard`와 같은 들여쓰기를 적용합니다.
    
    ```
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser(),
        let name = user.veryLongFunctionNameWhichReturnsOptionalName(),
        user.gender == .female
    else {
        // dosomething()
        return
    }
    
    ```
    
- 만약, `guard` 다음 `else` 구문 내부에 코드가 `return` 만 존재하는 경우, 개행을 적용하지 않습니다.
    
    ```
    guard let user = self.veryLongFunctionNameWhichReturnsOptionalUser() else { return }
    
    ```
    

### 최대 줄 길이

- 한 줄은 최대 120자를 넘지 않아야 합니다.
    
    Xcode의 **Preferences → Text Editing → Display**의 'Page guide at column' 옵션을 활성화하고 120자로 설정하면 편리합니다.
    

### 빈 줄

- 빈 줄에는 공백이 포함되지 않도록 합니다.
- 모든 파일은 빈 줄로 끝나도록 합니다.
    
    ```
    // MARK: Layout
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    override func menuButtonDidTap() {
      // doSomething()
    }
    
    ```
    

### 임포트

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator

```

## 네이밍

### 타입

- 타입 이름에는 UpperCamelCase를 사용합니다.

### 함수

- 함수 이름에는 lowerCamelCase를 사용합니다.
- 함수 이름 앞에는 되도록이면 `get`, `set`을 붙이지 않습니다.
    
    **좋은 예:**
    
    ```
    func name(for user: User) -> String?
    
    ```
    
    **나쁜 예:**
    
    ```
    func getName(for user: User) -> String?
    
    ```

- Action 함수의 네이밍은 '주어 + 동사' 형태를 사용합니다.
    
    **좋은 예:**
    
    ```
    func name(for user: User) -> String?
    
    ```
    
    **나쁜 예:**

    ```
    func backButtonTapped() {
      // ...
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    func tapBackButton() {
      // ...
    }
    
    ```
    
- return은 생략하지 않습니다.
    
    **좋은 예:**
    
    ```
    func returnZero() -> Int {
      return 0
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    func returnZero() -> Int {
      0
    }
    
    ```
    

### 변수

- 변수 이름에는 lowerCamelCase를 사용합니다.

### 상수

- 상수 이름에는 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ```
    let maximumNumberOfLines = 3
    
    ```
    
    **나쁜 예:**
    
    ```
    let MaximumNumberOfLines = 3
    let MAX_LINES = 3
    
    ```
    

### 열거형

- enum의 각 case에는 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ```
    enum Result {
      case success
      case failure
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    enum Result {
      case Success
      case Failure
    }
    
    ```
    

### 약어

- 약어로 시작하는 경우 약어 전체를 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.
    
    **좋은 예:**
    
    ```swift
    let userID: Int?
    let html: String?
    let websiteURL: URL?
    let urlString: String?
    ```
    
    **나쁜 예:**
    
    ```swift
    let userId: Int?
    let HTML: String?
    let websiteUrl: NSURL?
    let URLString: String?
    ```
    

## 클로저

- 파라미터와 리턴 타입이 없는 Closure 정의시에는 `() -> Void`를 사용합니다.
    
    **좋은 예:**
    
    ```
    let completionBlock: (() -> Void)?
    
    ```
    
    **나쁜 예:**
    
    ```
    let completionBlock: (() -> ())?
    let completionBlock: ((Void) -> (Void))?
    
    ```
    
- Closure 정의시 파라미터에는 괄호를 사용하지 않습니다.
    
    **좋은 예:**
    
    ```
    { operation, responseObject in
      // doSomething()
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    { (operation, responseObject) in
      // doSomething()
    }
    
    ```
    
- Closure 정의시 가능한 경우 타입 정의를 생략합니다.
    
    **좋은 예:**
    
    ```
    ...,
    completion: { finished in
      // doSomething()
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    ...,
    completion: { (finished: Bool) -> Void in
      // doSomething()
    }
    
    ```
    
- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다.
    
    **좋은 예:**
    
    ```
    UIView.animate(withDuration: 0.5) {
      // doSomething()
    }
    
    ```
    
    **나쁜 예:**
    
    ```
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      // doSomething()
    })
    
    ```
    

## 클래스와 구조체

- 클래스와 구조체 내부에서 지칭하는 값이 모호한 경우와 반드시 명시적으로 나타낼 필요가 있을 경우 `self`를 사용합니다.
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.
    
    **좋은 예:**
    
    ```
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    ```
    
    **나쁜 예:**
    
    ```
    let frame = CGRectMake(0, 0, 100, 100)
    
    ```
    

## 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.
    
    **좋은 예:**
    
    ```
    var messages: [String]?
    var names: [Int: String]?
    
    ```
    
    **나쁜 예:**
    
    ```
    var messages: Array<String>?
    var names: Dictionary<Int, String>?
    
    ```
    

## 주석

- `// MARK:`를 사용해서 연관된 코드를 구분짓습니다.
    
    ```
    // MARK: Init
    override init(frame: CGRect) {
      // doSomething()
    }
    
    deinit {
      // doSomething()
    }
    
    // MARK: Layout
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    override func tapMenuButton() {
      // doSomething()
    }
    
    ```
    

## 프로그래밍 권장사항

- 상수를 정의할 때에는 `enum`를 만들어 비슷한 상수끼리 모아둡니다. 재사용성과 유지보수 측면에서 큰 향상을 가져옵니다. `struct` 대신 `enum`을 사용하는 이유는, 생성자가 제공되지 않는 자료형을 사용하기 위해서입니다.
    
    ```
    final class ProfileViewController: UIViewController {
        private enum Metric {
            static let profileImageViewLeft = 10
            static let profileImageViewRight = 10
            static let nameLabelTopBottom = 8
            static let bioLabelTop = 6
        }
    
        private enum Font {
            static let nameLabel = UIFont.boldSystemFont(ofSize: 14)
            static let bioLabel = UIFont.boldSystemFont(ofSize: 12)
        }
    
        private enum Color {
            static let nameLabelText = 0x000000.color
            static let bioLabelText = 0x333333.color ~ 70%
        }
    }
    
    ```
    
    이렇게 선언된 상수들은 다음과 같이 사용될 수 있습니다.
    
    ```
    self.profileImageView.frame.origin.x = Metric.profileImageViewLeft
    self.nameLabel.font = Font.nameLabel
    self.nameLabel.textColor = Color.nameLabelText
    
    ```
    
- 더이상 상속이 발생하지 않는 클래스는 항상 `final` 키워드로 선언합니다.
- 프로토콜을 적용할 때에는 extension을 만들어서 관련된 메서드를 모아둡니다.
    
    **좋은 예**:
    
    ```
    final class MyViewController: UIViewController {
        // ...
    }
    
    // MARK: - UITableViewDataSource
    extension MyViewController: UITableViewDataSource {
        // ...
    }
    
    // MARK: - UITableViewDelegate
    extension MyViewController: UITableViewDelegate {
        // ...
    }
    
    ```
    
    **나쁜 예**:
    
    ```
    final class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      // ...
    }
    
    ```
    

## 라이센스

본 문서의 출처와 저작권은 [전수열](https://github.com/devxoul)과 [StyleShare](https://stylesha.re/)에게 있습니다.
사용자의 상황에 맞게 몇몇 항목의 첨삭 및 수정이 이루어졌습니다.
