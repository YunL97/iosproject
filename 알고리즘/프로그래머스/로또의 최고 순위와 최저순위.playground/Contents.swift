import UIKit
import Darwin


func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
   
    
    //var zero = lottos.filter({ (value: Int) -> Bool in return (value  == 0) } ).count
    var zero = lottos.filter({ $0 == 0} ).count
    var nozero = lottos.filter({ $0 != 0} )
    
    
    var correct = win_nums.filter({ nozero.contains($0) }).count
    print(correct)
    
    
    
    var a = min(7 - correct,6)
    var b = min(7 - correct - zero, 6)
    
    return [b,a]
}


solution([44, 1, 0, 0, 31, 25],[31, 10, 45, 1, 6, 19])
