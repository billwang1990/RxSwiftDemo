import RxCocoa
import RxSwift
import XCPlayground
import RxDemo

//interval(1000, MainScheduler.sharedInstance).map({ _ in
//    return NSURLSession.sharedSession().rx_JSON(NSURL(string: "http://afsdfasdfa")!)
//}).switchLatest().doOn({print($0)}).retry().subscribe({print($0)})
//

XCPSetExecutionShouldContinueIndefinitely(true)