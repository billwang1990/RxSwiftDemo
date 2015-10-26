import RxCocoa
import RxSwift
import XCPlayground

//interval(1000, MainScheduler.sharedInstance).map({ _ in
//    return NSURLSession.sharedSession().rx_JSON(NSURL(string: "http://afsdfasdfa")!)
//}).switchLatest().doOn({print($0)}).retry().subscribe({print($0)})
//

XCPSetExecutionShouldContinueIndefinitely(true)

let someOptional:Int? = 42   //你可以改成nil试试 会发现没有输出了

//以前的解包方式
if let x = someOptional{
    print("someOptional value is \(x)")
}
var y = someOptional ?? 4

if case .Some(let x) = someOptional{
    
}