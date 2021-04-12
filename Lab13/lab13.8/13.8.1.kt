import java.util.Scanner
import java.lang.Math
import kotlin.math.sqrt

fun main(args: Array<String>)
{
    val scanner = Scanner(System.`in`)
    print("->")
    val n = scanner.nextInt()
    var sum:Int=0
    if (n <= 1) { println(" ") }
    else {
        val factors = primeFactors(n)
        println("Простые делители числа $n")

        for (number in factors) {
            print("$number ")
            print(" ")
            sum+=number
        }
        println("Сумма-> $sum")
    }

}

private fun primeFactors(number: Int): ArrayList<Int> {
    // Массив, содержащий все простые множители заданного числа
    val arr: ArrayList<Int> = arrayListOf()

    var n = number
    // Сначала проверить делимость на 2. Добавьте его в arr до тех пор, пока он не станет делимым
    while (n % 2 == 0) {
        arr.add(2)
        n /= 2
    }
    val squareRoot = sqrt(n.toDouble()).toInt()

    //Выполнить цикл от 3 до квадратного корня из n. Проверить делимость на i. Добавляйте i в arr, пока оно не будет делиться на i
    for (i in 3..squareRoot step 2) {
        while (n % i == 0) {
            arr.add(i)
            n /= i
        }
    }
    if (n > 2) {arr.add(n)}
    return arr
}
