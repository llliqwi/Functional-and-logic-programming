import java.util.Scanner
fun main(args: Array<String>)
{
    var z: Int
    var x: Int
    var min:Int=999999999
    var max:Int=0
    var sum = 0
    var sc = Scanner(System.`in`)
    var multi:Int=1
    print("-> ")
    z = sc.nextInt()
    while (z > 0)
    {
        x = z % 10
        if(x<min) min=x
        if (x>max) max = x
        sum += x
        multi *=x
        z /= 10

    }

    println("Сумма -> $sum")
    println("Произведение -> $multi")
    println("Min-> $min")
    println("Max-> $max")
}


