tailrec fun digitsDownCondition(num : Int, acum : Int, f : (Int, Int) -> Int, pr : (Int) -> Boolean) : Int =
     if ( num == 0) acum else
          digitsDownCondition(num/10, if (pr(num % 10)) f (num % 10, acum) else acum, f, pr)

fun sumCondition(num: Int) : Int = digitsDownCondition(num, 0, {a,b -> a + b}, {x -> x % 2 == 0 && x>4}) // 
fun proizCondition(num: Int) : Int = digitsDownCondition(num, 1, {a,b -> a * b}, {x -> x % 2 != 0 && x<8}) //
fun maxCondition(num: Int) : Int = digitsDownCondition(num, 0, {a,b -> if (a > b) a else b}, {x -> x % 2 != 0 && x<8}) //
fun minCondition(num: Int) : Int = digitsDownCondition(num, 9, {a,b -> if (a < b) a else b}, {x -> x % 2 == 0 && x>4}) //

fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Сумма цифр числа: ${sumCondition(x)}")
     println("Произведение цифр числа: ${proizCondition(x)}")
     println("Максимум цифр числа: ${maxCondition(x)}")
     println("Минимум цифр числа: ${minCondition(x)}")
}