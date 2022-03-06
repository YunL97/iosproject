import UIKit

func a(_ a:Int) -> Int {
    return a
}
var b = a

func c(_ ac:Int, _ s: (Int) -> Int){
print(s(ac))
}

c(1,a)

func d(_ ac:Int) -> (Int) -> Int{
    return a
}

print(d(1)(2))

