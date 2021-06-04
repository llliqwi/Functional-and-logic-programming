import java.io.File
import java.io.BufferedReader
import kotlin.math.abs
import kotlin.math.sqrt


fun listOp(): List<Int> {
    print("введите размер списка:  ")
    val size = readLine()!!.toInt()
    val l = mutableListOf<Int>()
    return listInput(l, size)
}

fun listInput(l : List<Int>, size: Int) : List<Int> =   // ввод массива с клавиатуры
    listInput(l, 0, size)
tailrec fun listInput(l : List<Int>, counter : Int, size : Int) : List<Int> =
    if (counter == size) l else listInput(l.plus(readLine()!!.toInt()), counter + 1, size)


tailrec fun listOp(a: Iterator<Int>, f: (Int, Int) -> Int, result: Int): Int =
    if (a.iterator().hasNext() == false) result else
        listOp(a, f, f(a.iterator().next(),result))

fun readFromFile(path: String): List<Int> {
    val bufferedReader: BufferedReader = File(path).bufferedReader()
    val inputString = bufferedReader.use {
        it.readText()
    }
    val st = inputString + " "
    var i = 0
    var indexStart = 0
    var indexEnd = 0
    var flag = 0
    var l = mutableListOf<Int>()

    return read(indexStart, indexEnd, st,l)
}

fun read(indexStart: Int, indexEnd: Int, s: String, l: MutableList<Int>): MutableList<Int> = if (indexEnd == s.length) l else
    if (s[indexEnd].toInt() == 32)
    {
        val str = s.subSequence(indexStart, indexEnd)
        read(indexEnd, indexEnd + 1, s, l.plus(str.toString().toInt()).toMutableList())
    }
    else read(indexStart, indexEnd + 1, s, l)

fun getList(): () -> List<Int> =
    when (readLine()!!.toString()) {
        "file" -> { {readFromFile("source.txt")} }
        "keyboard" -> { {listOp()} }
        else -> { {listOp()} }
    }
    
fun cyclicShift(a: List<Int>): List<Int>
{
    val l1 = a.drop(2)
    val l2 = a.dropLast(2)
    val lNew = l1 + l2
    return lNew
}
fun index2min(l: MutableList<Int>) {
    index2minElements(index2minElements(l, l.minOrNull()!!), index2minElements(l, l.minOrNull()!!).minOrNull()!!)
}

fun index2minElements(a: MutableList<Int>, min: Int): MutableList<Int> {
    val list = a.toCollection(mutableListOf<Int>())  // копирование необходимо, так как при простом приравнивании не будет создаваться новый список, а лишь другое имя будет
    val min1 = list.minOrNull()                            // указывать на тот же массив
    val index1 = a.indexOf(min1)
    list.remove(min1)
    if (list.contains(min1) == true)
        return index2minElements(list,min)
    else return list
}
fun elementsBeforeMin(a: MutableList<Int>) {
    val min = a.minOrNull()
    val index = a.indexOf(min)
    val elementsBeforeMin = a.dropLast(a.size - index)
    for (el in elementsBeforeMin)
        print("$el  ")
}
fun missingNumbers(max: Int, l: List<Int>, counter: Int, lNew: List<Int>): List<Int> = if (counter == max) lNew else
    if (l.contains(counter) == false){
        missingNumbers(max, l, counter + 1,lNew.plus(counter))
    }
    else missingNumbers(max, l, counter + 1, lNew)

fun missingNumbers(l: List<Int>, missingNumders: List<Int>): List<Int> {
    val min = l.minOrNull()!!.toInt()
    val max = l.maxOrNull()!!.toInt()

    return missingNumbers(max,l,min + 1,missingNumders)
}

fun printList(l: List<Int>) = printList(l, 0)
fun printList(l: List<Int>, counter: Int): List<Int> = if (counter + 1 > l.size) l else
    if (l.size > counter) { print("${l[counter]}  ")
        printList(l, counter + 1) } else
        printList(l, counter + 1)
fun kolLocMax(l: List<Int>): Int = kolLocMax(l,1,0)
fun kolLocMax(l: List<Int>, counter: Int, kol: Int): Int = if (counter + 1 > l.size - 1) kol else
    if (l[counter - 1] < l[counter] && l[counter + 1] < l[counter]) kolLocMax(l,counter + 2, kol + 1)
    else kolLocMax(l,counter + 1, kol)
fun nearestNumber(l: List<Double>, r: Double) = nearestNumber(l, l[0],r,0)
fun nearestNumber(l: List<Double>, nearestNumber: Double, r: Double, counter: Int): Double = if (l.size - 1 < counter) nearestNumber else
    if (abs(l[counter] - r) < abs(nearestNumber - r)) nearestNumber(l, l[counter], r, counter + 1)
    else nearestNumber(l,nearestNumber,r,counter + 1)

fun kolElSegment(l: List<Int>, a: Int, b: Int) = kolElSegment(l, a, b, 0, 0)
fun kolElSegment(l: List<Int>, a: Int, b: Int, counter: Int, kol: Int): Int = if (counter > l.size - 1) kol else
    if (l[counter] >= a && l[counter] <= b) kolElSegment(l,a,b,counter + 1, kol + 1)
    else kolElSegment(l,a,b,counter + 1, kol)

fun series(l: List<Double>): Boolean = series(l, 0, true)
fun series(l: List<Double>, counter: Int, result: Boolean): Boolean = if (counter + 1 > l.size - 1) result else
    if (l[counter] == l[counter].toInt().toDouble() && l[counter + 1] == l[counter + 1].toInt().toDouble()
        || l[counter] != l[counter].toInt().toDouble() && l[counter + 1] != l[counter + 1].toInt().toDouble()) series(l, counter + 1, false)
    else series(l, counter + 1, result)

fun simpleNumber(x: Int): Boolean = simpleNumber(x, 2, true)
tailrec fun simpleNumber(x: Int, counter: Int, result: Boolean): Boolean = if (counter  > sqrt(x.toDouble())) result else {
    if (x % counter == 0) simpleNumber(x, counter + 1, false) else
        simpleNumber(x, counter + 1, result)
}

fun arithmeticMeanSimple(l: List<Int>, sum: Double, kol: Double, counter: Int): Double = if (counter == l.size - 1) sum/kol else
    if (simpleNumber(l[counter]) == true) arithmeticMeanSimple(l, sum + l[counter], kol + 1, counter + 1)
    else arithmeticMeanSimple(l, sum, kol, counter + 1)

fun arithmeticMeanNoSimple(l: List<Int>, sum: Double, kol: Double, counter: Int, arithmeticMeanSimple: Double): Double = if (counter == l.size) sum/kol else
    if (simpleNumber(l[counter]) == false && l[counter] > arithmeticMeanSimple) {
        arithmeticMeanNoSimple (l, sum+l[counter], kol+1, counter+1, arithmeticMeanSimple)
    }  else arithmeticMeanNoSimple(l, sum, kol, counter + 1, arithmeticMeanSimple)

fun task44(): Double {
    val l = listOp()
    val arithmeticMeanSimple = arithmeticMeanSimple(l,0.0,0.0,0)
    return arithmeticMeanNoSimple(l, 0.0,0.0,0,arithmeticMeanSimple(l,0.0,0.0,0))
}

fun makeList(): List<Double> {
    val l: MutableList<Double> = mutableListOf()
    return makeList(0.1,l,0).toList()
}

tailrec fun makeList(startEl: Double, l: MutableList<Double>, counter: Int): List<Double> = if (counter == 100) l else {
    //println(counter)
    makeList(startEl + 1, l.plus(startEl + 1).toMutableList(), counter + 1)
}

fun makeSet(): Set<Double> {
    val set = mutableSetOf<Double>()
    return makeSet(0.1, set, 0)
}

tailrec fun makeSet(startEl: Double, set: MutableSet<Double>, counter: Int): Set<Double> = if (counter == 100) set else {
    //println(counter)
    set.add(startEl + 1)
    makeSet(startEl + 1, set, counter + 1)
}

fun main() {
    val l = makeList()
    val startTime = System.currentTimeMillis()
    l.binarySearch { 5555 }
    val totalTime = System.currentTimeMillis()
    println("Время в списке: ${(totalTime - startTime)}")
    val a = Array(100,{i -> i + 1})
    val startTime1 = System.currentTimeMillis()
    a.binarySearch(5555)
    val totalTime1 = System.currentTimeMillis()///1000/60
    println("Время в массиве: ${(totalTime1 - startTime1)}")

    val set = makeSet()
    println(set.binarySearch(5))
    val l1 = getList()
    l1().contains(Int.MIN_VALUE).xor(true).toString()[0]
}
