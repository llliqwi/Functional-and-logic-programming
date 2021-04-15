fun sum(x: Int): Int {
    var s = 0
    var temp: Int = x

    while (temp != 0) {
        s += temp % 10
        temp /= 10
    }
    return (s)
}

fun main()
{
    println("Введите число ->")
    val x = readLine()!!.toInt()
    print("Сумма цифр: " )
    println(sum(x))
}