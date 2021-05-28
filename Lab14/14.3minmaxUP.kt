fun maxUp(num:Int):Int = if (num < 10) num else if (num % 10 > maxUp(num / 10)) num % 10 else maxUp(num / 10)
fun minUp(num:Int):Int = if (num < 10) num else if (num % 10 < minUp(num / 10)) num % 10 else minUp(num / 10)
fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Максимум цифр числа: ${maxUp(x)}")
     println("Минимум цифр числа: ${minUp(x)}")
}