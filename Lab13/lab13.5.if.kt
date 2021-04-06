fun main(args : Array<String>) {
    val kotlin: String = "Kotlin"
    val prolog: String = "Prolog"
    val java: String = "Java"
    val python: String = "Python"
    val php: String = "PHP"
    val pascal: String = "Pascal"
    val c: String = "C"
    val swift: String = "Swift"
    val matlab: String = "MATLAB"
    val ruby: String = "Ruby"

    println("Выбери из списка любимый язык программирования: $kotlin | $prolog | $java | $python | $php | $pascal | $c | $swift | $matlab | $ruby")
    print("Напиши сюда ---> ")

    var input = readLine()

    if (input == kotlin || input == prolog){
        println("You PodLizA")}

    if (input == python){
        println("You питонист")}

    if (input == java){
        println("You старичок")}

    if (input == php){
        println("You сайтостроитель")}

    if (input == pascal){
        println("You школьник")}

    if (input == c){
        println("You никто")}

    if (input == swift){
        println("You не любишь андроид")}

    if (input == matlab){
        println("You matематик ")}

    if (input == ruby){
        println("You рубин ")}

         else
            println("Введи правильно название языка")

}
