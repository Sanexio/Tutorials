// Summieren:

func summieren(zahlen:Int...) -> Int {
    var summe = 0
    
    for zahl in zahlen {
        summe += zahl
    }
    return summe
}

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 11)



