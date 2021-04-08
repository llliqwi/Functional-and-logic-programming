import java.util.Scanner
fun main(args: Array<String>)
{
    var z: Int
    var x: Int
    var c = 0
    var sc = Scanner(System.`in`)
    print("-> ")
    z = sc.nextInt()
    while (z > 0)
    {
        x = z % 10
        c += x
        z /= 10
    }
    println("Сумма -> $c")
}