// Mittelwert

func average(values:Double...) -> Double
{
    var sum = 0.0
    var counter = 0.0
    for value in values
    {
        sum += value
        counter += 1
    }
    return sum / counter
}
var avg1 = average(50.0)
var avg2 = average(4.1, 5.2, 6.0, 7.0)
var avg3 = average(5.5, 6.5, 7.8, 9.1)
