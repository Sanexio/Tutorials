// Testumgebung:


// Funktion als Argument einer anderen Funktion:

func makeIncremeter() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncremeter()
increment(7)




