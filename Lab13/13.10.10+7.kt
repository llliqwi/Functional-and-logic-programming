import x.EulerSolution

class p017: EulerSolution() {
    fun run():String {
        var sum = 0
        for (i in 1..1000)
            sum += toEnglish(i).length
        return Integer.toString(sum)
    }
    companion object {
        @JvmStatic fun main(args:Array<String>) {
            println(p017().run())
        }
        private fun toEnglish(n:Int):String {
            if (0 <= n && n < 20)
                return ONES[n]
            else if (20 <= n && n < 100)
                return TENS[n / 10] + (if (n % 10 != 0) ONES[n % 10] else "")
            else if (100 <= n && n < 1000)
                return ONES[n / 100] + "hundred" + (if (n % 100 != 0) "and" + toEnglish(n % 100) else "")
            else if (1000 <= n && n < 1000000)
                return toEnglish(n / 1000) + "thousand" + (if (n % 1000 != 0) toEnglish(n % 1000) else "")
            else
                throw IllegalArgumentException()
        }
        private val ONES = arrayOf<String>("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen")
        private val TENS = arrayOf<String>("", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety")
    }
}