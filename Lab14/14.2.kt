fun sumDown(y: Int): Int = sumDown(y, 0)
tailrec fun sumDown(y: Int, sum: Int): Int = if(y == 0) sum else sumDown(y/10,y+y%10)

fun main(args:Array<String>)
{
    println("Введите число ->")
    val x = readLine()!!.toInt()
    print("Sum: " )
    println(sumDown(x))
}