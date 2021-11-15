import UIKit

class Person{
    var money: Int = 8000 {
        willSet {
            print("일을하면\(money)원에서 \(newValue)이 될 것 같아..")
        }

        didSet {
            print("일을해서\(oldValue)원에서 \(money)원n이 됐어..")
        }
    }
}
let work: Person = Person()
print("-----------------------------")
// 출력 -> 이걸 다 먹으면 80kg에서 85kg가 될 것 같아..
work.money = 9000
// 출력 -> 결국 다 먹어서 80kg에서 85kg로 변했어..

