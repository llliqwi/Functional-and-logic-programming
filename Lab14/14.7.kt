fun sumOfDigits(num: Int):Int {
     var sum = 0
     var numb=num

     while(numb!=0) {
          sum += numb% 10
          numb /= 10
     }
     return sum
}

fun maxDigit(num: Int): Int{
     var numb=num
     var max=numb%10

     while(numb!=0) {
          if(numb%10 > max) max=numb%10
          numb /= 10
     }
     return max
}

fun minDigit(num: Int): Int{
     var numb=num
     var min=numb%10

     while(numb!=0) {
          if(numb%10 < min) min=numb%10
          numb /= 10
     }
     return min
}

fun multDigit(num: Int): Int{
     var numb=num/10
     var mult=num%10

     while(numb!=0) {
          mult*=numb%10
          numb /= 10
     }
     return mult
}
fun main(args:Array<String>) {
     print("Введите число ->")
     val x = readLine()!!.toInt()
     println("sumOfDigits: ${sumOfDigits(x)}")
     println("maxDigit: ${maxDigit(x)}")
     println("minDigit: ${minDigit(x)}")
     println("multDigit: ${multDigit(x)}")
}