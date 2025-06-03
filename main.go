package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
)

func lat2cyr(s string) (t string) {
	t = s

	t = strings.ReplaceAll(t, "{\\cc}", "ћ")
	t = strings.ReplaceAll(t, "{\\cv}", "ч")
	t = strings.ReplaceAll(t, "{\\sv}", "ш")
	t = strings.ReplaceAll(t, "{\\zv}", "ж")
	t = strings.ReplaceAll(t, "{\\dj}", "ђ")
	t = strings.ReplaceAll(t, "{\\lj}", "љ")
	t = strings.ReplaceAll(t, "{\\nj}", "њ")
	t = strings.ReplaceAll(t, "{\\dz}", "џ")

	t = strings.ReplaceAll(t, "{\\Cc}", "Ћ")
	t = strings.ReplaceAll(t, "{\\Cv}", "Ч")
	t = strings.ReplaceAll(t, "{\\Sv}", "Ш")
	t = strings.ReplaceAll(t, "{\\Zv}", "Ж")
	t = strings.ReplaceAll(t, "{\\Dj}", "Ђ")
	t = strings.ReplaceAll(t, "{\\Lj}", "Љ")
	t = strings.ReplaceAll(t, "{\\Nj}", "Њ")
	t = strings.ReplaceAll(t, "{\\Dz}", "Џ")

	t = strings.ReplaceAll(t, "a", "а")
	t = strings.ReplaceAll(t, "b", "б")
	t = strings.ReplaceAll(t, "v", "в")
	t = strings.ReplaceAll(t, "g", "г")
	t = strings.ReplaceAll(t, "d", "д")
	t = strings.ReplaceAll(t, "e", "е")
	t = strings.ReplaceAll(t, "z", "з")
	t = strings.ReplaceAll(t, "i", "и")
	t = strings.ReplaceAll(t, "j", "ј")
	t = strings.ReplaceAll(t, "k", "к")
	t = strings.ReplaceAll(t, "l", "л")
	t = strings.ReplaceAll(t, "m", "м")
	t = strings.ReplaceAll(t, "n", "н")
	t = strings.ReplaceAll(t, "o", "о")
	t = strings.ReplaceAll(t, "p", "п")
	t = strings.ReplaceAll(t, "r", "р")
	t = strings.ReplaceAll(t, "s", "с")
	t = strings.ReplaceAll(t, "t", "т")
	t = strings.ReplaceAll(t, "u", "у")
	t = strings.ReplaceAll(t, "f", "ф")
	t = strings.ReplaceAll(t, "h", "х")
	t = strings.ReplaceAll(t, "c", "ц")

	t = strings.ReplaceAll(t, "A", "А")
	t = strings.ReplaceAll(t, "B", "Б")
	t = strings.ReplaceAll(t, "V", "В")
	t = strings.ReplaceAll(t, "G", "Г")
	t = strings.ReplaceAll(t, "D", "Д")
	t = strings.ReplaceAll(t, "E", "Е")
	t = strings.ReplaceAll(t, "Z", "З")
	t = strings.ReplaceAll(t, "I", "И")
	t = strings.ReplaceAll(t, "J", "Ј")
	t = strings.ReplaceAll(t, "K", "К")
	t = strings.ReplaceAll(t, "L", "Л")
	t = strings.ReplaceAll(t, "M", "М")
	t = strings.ReplaceAll(t, "N", "Н")
	t = strings.ReplaceAll(t, "O", "О")
	t = strings.ReplaceAll(t, "P", "П")
	t = strings.ReplaceAll(t, "R", "Р")
	t = strings.ReplaceAll(t, "S", "С")
	t = strings.ReplaceAll(t, "T", "Т")
	t = strings.ReplaceAll(t, "U", "У")
	t = strings.ReplaceAll(t, "F", "Ф")
	t = strings.ReplaceAll(t, "H", "Х")
	t = strings.ReplaceAll(t, "C", "Ц")

	return
}

func Preslovi(fliename string) {
	file, err := os.Open(fliename)
	if err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err = file.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() { // internally, it advances token based on sperator
		s := scanner.Text() // token in unicode-char
		fmt.Println(lat2cyr(s))
	}

}

func main() {
	Preslovi("./zadaci/granice.tex")
}
