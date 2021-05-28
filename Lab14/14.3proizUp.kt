fun proizUp(num: Int): Int = if (num < 10) num else proizUp(num / 10) * (num % 10)
tailrec fun proizDown(num: Int, p: Int): Int = if (num < 10) p * num else proizDown(num/10,p * (num % 10))

fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Произведение цифр числа: ${proizUp(x)}")
}