import UIKit

var str = "Hello, playground"

for i in (0...10_000) {
    let date = Date()
    let date2 = date
    let result = date.timeIntervalSinceReferenceDate > date2.timeIntervalSinceReferenceDate
    print(date.timeIntervalSinceReferenceDate)
    assert(!result)
}
