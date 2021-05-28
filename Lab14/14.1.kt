fun sumUp(num: Int): Int = if (num == 0) num else sumUp(num/10)+num%10
fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Сумма цифр числа: ${sumUp(x)}")
}
