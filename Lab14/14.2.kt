fun sumDown(num : Int) : Int = sumDown(num, 0)
tailrec fun sumDown(num : Int, sum : Int): Int = if(num == 0) sum else sumDown(num/10,sum+num%10)
fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Сумма цифр числа: ${sumDown(x)}")
}
