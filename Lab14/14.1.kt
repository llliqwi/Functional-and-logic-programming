fun upsum(y: Int): Int = if (y == 0) y else upsum(y/10)+y%10

fun main(args:Array<String>)
{
    println("Введите число ->")
    val x = readLine()!!.toInt()
    print("Сумма цифр: " )
    println(upsum(x))
}