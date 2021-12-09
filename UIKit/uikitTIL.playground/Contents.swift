import UIKit



//tuple
var topTitle = ("메인", "mainIcon.png")

topTitle.0


//http status code
var httpError = (statusCode: 404, description: "not found")
print(httpError.statusCode)

//Optional (옵셔널
//값이 있을수도, 없을 수 도 있다

//값이 있다
//값이 없다 - > nil

//0 -> 다쓴 상태인 값

var myAge: Int? = 0
myAge = nil


// 값이 없는 상태체그 -> 틀린 로직(Swift 언어스펙)
if myAge == 0 {
    // alert - 나이입력
}

if myAge == nil {
    // alert - 나이입력
}

var myName: String? = nil



if myName == ""{
    //이름을 입력하세요
}

//값이 없는 상태 체크
if myName == nil{
    //이름을 입력하세요
}

//optional 그냥 사용할 수 없는 경우가 많이 있음
var a: Int?
var b: Int? = 20

////coalesce a nil 이면 0 넣어라
//var c = (a ?? 0) + (b ?? 0)
//
////force unwrap -> 강제로, 힘으로
//// 주의사항 확신 없으면 쓰면안된다 nil 값 들어가면 앱이 죽어버린다
//var d = a! + b!
//
//if a != nil {
//    print(a!)
//}
//if let hasNumber = a {
//    print(hasNumber)
//}

func testFunc(){
    guard let hasNumber = a else{
        return
    }
    print("end")
}

testFunc()


let ac: Double = 30
if ac.truncatingRemainder(dividingBy: 2) == 0{
    print("짝수")
} else{
    print("홀수")
}

let inputValue = "9"
if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자")
} else {
    print("숫자x")
}

//영어만 입력해야한다

"\u{41}"
"\u{7a}"

let name: String = "lee"
print(name[name.index(name.startIndex, offsetBy: 1)])

let isOn = true
isOn.description

let myNum = 12.33
String(myNum).split(separator: ".")
