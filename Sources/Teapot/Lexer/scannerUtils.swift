import Foundation

/**
 * we have our own implementation since the standard library does funni things such as
 * considering '५', '๙', and '万' numbers, which is not what we want
*/
func isDigit(_ c: Character) -> Bool {
    return c >= "0" && c <= "9"
}

func isLetter(_ c: Character) -> Bool {
    // if you look at an ascii table you can see that there's some characters
    // between uppercase and lowercase letters
    return (c >= "A" && c <= "Z") || (c >= "a" && c <= "z")
}

func isValidId(_ c: Character) -> Bool {
    return isDigit(c) || isLetter(c) || c == "_"
}