import java.lang.Character.getNumericValue as getNumericValue1
fun kol3(input:String): Int{
    var kol = 0
    for (c in input) {
        val i:Int = getNumericValue1(c)
        if (i > 3 && i % 2 == 1 ) {
            kol++
        }
    }
    return kol
}

fun main(args: Array<String>) {
    println("--->")
    val a : String? = readLine()
    if(a!=null){
        print(kol3(a.toString()))
    }
}