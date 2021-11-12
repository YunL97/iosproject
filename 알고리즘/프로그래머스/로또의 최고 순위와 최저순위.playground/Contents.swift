import UIKit
import Darwin


func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    var same = 0
    var blindNum = 0
    
    ㄴ
    
    let minGrade = min(7 - same,6)
    let maxGrade = min(7 - same - blindNum,6)
    print(minGrade,maxGrade)
    return [minGrade,maxGrade]
}


solution([44, 1, 0, 0, 31, 25],[31, 10, 45, 1, 6, 19])
