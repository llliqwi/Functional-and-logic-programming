fun main(args : Array<String>) {
    val kotlin : String = "Kotlin"
    val prolog : String = "Prolog"
    val java   : String = "Java"
    val python : String = "Python"
    val php    : String = "PHP"
    val pascal : String = "Pascal"
    val c      : String = "C"
    val swift  : String = "Swift"
    val matlab : String = "MATLAB"
    val ruby   : String = "Ruby"

    println("Выбери из списка любимый язык программирования: $kotlin | $prolog | $java | $python | $php | $pascal | $c | $swift | $matlab | $ruby")
    print("Напиши сюда ---> ")

    var input = readLine()

    when(input)
    {
        kotlin ->  println("You PodLizA")
        prolog ->  println("You PodLizA")
        java   -> println("You старичок")
        python -> println("You питонист")
        php -> println("You сайтостроитель")
        pascal -> println("You школьник")
        c -> println("You никто")
        swift -> println("You не любишь андроид")
        matlab -> println("You matематик")
        ruby ->  println("You рубин ")
        else -> println("Введи правильно название языка")
    }
}

