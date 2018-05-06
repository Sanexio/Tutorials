// update: 28.06.16, 11:00

import UIKit

func calculatesStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculatesStatistics([5, 3, 100, 3,9])
print(statistics.sum)
print(statistics.2)



let httpFehler = (httpCode: 404, httpError: "Not Found", httpErrorDE: "Nicht gefunden")

/*
httpFehler.0
httpFehler.1
httpFehler.2
*/

let (httpCode, _, meldungDE) = httpFehler
httpCode
// meldung -> Durch Unterstrich ersetzt
meldungDE

httpFehler.httpCode
httpFehler.httpError
httpFehler.httpErrorDE




var (x, y, z) = (1, 2, 3)
x
y
z





