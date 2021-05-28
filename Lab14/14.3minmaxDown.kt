fun maxDown(num: Int) : Int = digitsDown(num, 0, {a,b -> if (a > b) a else b}, {x -> true})
fun minDown(num: Int) : Int = digitsDown(num, 9, {a,b -> if (a < b) a else b}, {x -> true})

tailrec fun digitsDown(num : Int, acum : Int, f : (Int, Int) -> Int, pr : (Int) -> Boolean) : Int =
     if ( num == 0) acum else
          digitsDown(num/10, if (pr(num % 10)) f (num % 10, acum) else acum, f, pr)
fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("Максимум цифр числа: ${maxDown(x)}")
     println("Минимум цифр числа: ${minDown(x)}")
}