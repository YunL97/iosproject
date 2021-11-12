import UIKit
import Darwin


var greeting = "Hello, playground"
dump(greeting)

var j: Int = 0;
for i in 0...3{
    j+=i
}
let name :String = "lee"
print("my name is \(name)")

/// asdasdsad
func publicFunction(){
    
    print("Hello")
}

/// 오류 타입의 열거형
/// - noName: 이름을 전달받지 못했을 때 발생하는 오류
/// - incorrectAge(age: Int) : 나이가 0세 미만, 150세 초과인 경우 잘못된 나이로 인식하여 오류로 처리
/// - unknown : 알 수 없는 오류
struct User {
    let firstName: String
    let lastName: String
}





publicFunction()


