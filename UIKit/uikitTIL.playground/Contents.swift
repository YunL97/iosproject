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

let myName1 = "lee yun sik"

for character in myName1 {
    print(character)
}

var myNames = Array<String>() //이니셜라이즈, 메모리에 올리는것
myNames.append("a")
myNames.append("b")
myNames.append("c")

//방어코드
//안전한 코딩 스타일
var index = 2
if myNames.count > index {
    myNames[index]
}

myNames.append(contentsOf: ["d","e"])
myNames = myNames + ["f"]
myNames.remove(at: 5)

for name in myNames {
    print(name + "님")
}

for (index, name) in myNames.enumerated() //index, value
{
    print(index, name)
}

var setNames = Set<String>()
setNames.insert("1")
setNames.insert("2")
setNames.insert("3")
setNames.insert("3")
setNames.insert("3")
var setNames1: Set = [1,2,3]
var setNames2: Set = [2,3,4,5,6] //int
print(setNames)

//교집합
setNames1.intersection(setNames2)

//합집합
setNames1.union(setNames2)

//합집합 - 교집합
setNames1.symmetricDifference(setNames2)

//차집합
setNames1.subtracting(setNames2)

//Divtionary
var nameOfStreet = [String: String]()

nameOfStreet["302ro"] = "1st Street"
nameOfStreet["303ro"] = "2st Street"
nameOfStreet["304ro"] = "3st Street"
nameOfStreet
for dic in nameOfStreet {
    dic.value
}


let forname = "23456"
for char in forname {
    print((Int(String(char)) ?? 0) * 10)
}

let arrname = ["a","b", "c"]

for arrname in arrname {
    print(arrname)
}

let numberOfLegs = ["ant" : 6, "dog" : 4]
for dic in numberOfLegs {
    print(dic)
}

func plus(_ num1: Int){
    print(num1)
}
//plus(num1: 10)
plus(10)

func calc(result: (Int, Int) -> Int){
    print(result(1,2))
    
}

//Closure 이름이 없음
// func - 유사하다

//function]
func myScore(a: Int) -> String{
    return "\(a)점"
}

//clousre
//축약
let myScore2 = { (a: Int) -> String in
    return "\(a)"
}

myScore2(20)

let myScore5: (Int) -> String = { a in
    "\(a)점"
}

let myScore6: (Int, Int, Int) -> String = {
    "\($0+$1+$2 )"
}

myScore5(200)

// 클로저 조건 -> 특정한 글자가 포함된 것을 찾기
//---------------------------
var cname = ["apple", "air", "brown","red", "orange"]

//특정 글자 포함
let containsSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

//입력한 글자로 시작하는 첮글자 찾기
let isStartSomeText: (String, String) -> Bool = { name, find in
  if name.first?.description == find {
        return true
    }
    return false
}
//---------------------------
func find(findString: String, condition: (String, String) ->Bool) -> [String]{
    var newNames = [String]()
    
    for name in cname{
        if condition(name,findString) {
            newNames.append(name)
        }
    }
    return newNames
}
find(findString: "a", condition: containsSomeText)
find(findString: "a", condition: isStartSomeText)



func someFind(find: String) -> [String]{
    var newNames = [String]()
    for name in cname {
        if name.contains(find){
            newNames.append(name)
        }
    }
    return newNames
}
someFind(find: "l")

//sort 원본훼손  sorted 원본해손x
cname.sort()

var namesort = cname.sorted { lhs, rhs in
    lhs > rhs
}
namesort = cname.sorted{ $0 > $1 }
namesort = cname.sorted(by:  > )

//enum
//타입분류
// 도서관 -> 항목 -> 소설, 문제집, 패션, 만화책

//분류만 하고싶을 때
enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
//    var typeName: String {
//        switch self {
//        case .comics:
//            return "comics"
//        case .fiction:
//            return "fiction"
//        case .workbook:
//            return "workbook"
//        default:
//            break
//        }
//    }
}

// enum 확장
extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .workbook:
            return "workbook"
        default:
            break
        }
    }
}

var bookStyle: BookType? //BookType.comics
var books = [BookType]()

func saveBook(book: BookType){
    switch book {
    case .comics:books.append(book)
    case .fiction:books.append(book)
    case .workbook:books.append(book)
    }
}

//func loadBook(book: BookType) -> [BookType]{
//    var tempBooks = [BookType]()
//
//    for item in books{
//        if item == book {
//            tempBooks.append(item)
//        }
//    }
//    return tempBooks
//}
//saveBook(book: .comics)
//saveBook(book: BookType.finction)
//saveBook(book: .finction)
//saveBook(book: .comics)
//
//loadBook(book: .comics)
//
//
//

saveBook(book: .comics(title: "aaa", price: 5000, year: 2020))
saveBook(book: .workbook(title: "ccc", price: 5000, year: 2020))


for book in books {
    if case let BookType.comics(title, price, year) = book {//book에 값 없으면 false
        print("comics", title, book.typeName)
    }
    switch book {
    case let .comics(title, price, year):
        print(price)
    case .fiction(title: let title, price: let price, year: let year):
        <#code#>
    case let .workbook(title, _, _):
        print(title)
    default:
        break
    }
}

class myInfo {
    var name = ""
    var age = 0
    init(gender: GenderType) {
        self.genderType = gender
    }
    enum GenderType {
        case male
        case female
    }
    var genderType:GenderType
    
    func isAdult() -> Bool {
        if age > 10{
            return true
        }
        return false
    }
}

var acc = myInfo(gender:.male)
acc.age = 10
acc.genderType
acc.isAdult()


class GameInfo {
    var homeScore = 0
    var awayScore = 0
    
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
}
class Soccer: GameInfo{
    
}
class BaseBall: GameInfo {
    
}



let soccer = Soccer()
soccer.awayScore = 1
soccer.homeScore = 2
soccer.presentScore()

//Properties
class MyInfoo {
    
    //stored property(저장)
    var name = ""
    var age = 0
    
    //lazy stored property myInfoo 가 c에 접근할때 c프로퍼티가 메모리에 올라간다
    lazy var c = "c"
    
    //computed property(계산)
    var isAdult: Bool {
        if age > 19 {
            return true
        }
        return false
    }
    
    //email -> 보안 -> 암호화 된 값으로 사용한다 (항상해야할때 사용)
    var _email = ""
    var email: String {
        get{
            return _email
        }
        set{
            _email = newValue.hash.description //hash 로 암호화
        }
    }
    
    
}

let myInfoo = MyInfoo()
myInfoo.email = "abc@test.com"
print(myInfoo.email)

myInfoo.c = "Cc"
print(myInfoo.c)

//Initializer
//생성자

class MyInfoin {
    var name: String
    var myId: String
    
    //desigenated initializer
    init(n:String, id:String){
        self.name = n
        self.myId=id
    }
    
    init(id: String){
        self.name = ""
        self.myId = id
    }
    //init가 여러개 있을때 사용하면 된다
    //convenience initializer // 필수조건 - 다른init 을 반드시 실행해야한다
    convenience init() {
        self.init(n: "", id: "")
    }
    

    
}

var myinfoin = MyInfoin(n: "kim", id: "abcd")


struct MyConfig {
    var cinf: String
}
var myCon = MyConfig(cinf: "Asd")
