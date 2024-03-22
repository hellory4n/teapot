# Teapot

Bestest language ever.

Written in Swift until the language gets usable enough to be written in itself.

## Hello world
```csharp
// semicolons are optional, i just use them everytime syntax highlighting doesn't work
using teapot;
namespace teapotis.epic;

public void? main(string[] args) {
    log("Hi mom")
}
```

## Basics of teapot innit

Awesome function thing:

```csharp
// not cool :(
function(otherFunction(yetAnotherFunction()))
// cool :)
function() <- otherFunction() <- yetAnotherFunction()
```

Variables and stuff

```cs
// this is how you make a variable
int variable = 68

// variables are immutable by default
variable++; // can't do that

// if you want to change them you have to add `mut`
mut int variable = 68;
variable++; // now you can do that

// there's also `lateinit` for variables that are gonna be assigned once
lateinit int variable;
variable = 68
variable++; // error: variable has already been assigned

// and there's `const` for variables where their values are known at compile-time
// you can use primitives, strings, and simple enums (more on that later)
const int constant = -420;
const bool funni = true;
const string shit = "shitfuckery";
const Day gdjhmdkj = Day.Monday;
```

Pattern matching: (switch statements but better)

```cs
string m = match integer {
    0..68 => "sucks"
    69 => "fantastic"
    420 => {
        log("heheheha")
        "amazing"
    }
    _ => "probably sucks"
}
```

Collections and stuff
```csharp
// can't grow
int[] array = [69, 420]
// can grow
mut int{} list = {69, 420}

{string, string} dictionary = {
    "help": "me",
    "this": "sucks"
}
```

## Enums

They're fancy.

```csharp
enum Shape {
    circle(float radius)
    rectangle(float width, float height)

    public float getArea() {
        return match this {
            circle(float radius) => Math.pi * radius * radius
            rectangle(float width, float height) => width * height
        }
    }
}
```

## Structs and interfaces and stuff
```csharp
interface IMessagingService {
    // interfaces can also have default implementations,
    // but not properties
    public void send(string recipient, string message);
}

using someEmailThing;

// structs can't extend other structs btw
struct EmailService : IMessagingService {
    implement void Send(string recipient, string message) {
        EmailThing.sendSomeBullshit(recipient, message)
    }
}

struct Color {
    public required float r: 0
    public required float g: 0
    public required float b: 0
    public float a: 1
}

public void? main(string[] args) {
    // how you initialize structs
    // since r, g, and b are marked as required,
    // you have to put them here
    Color epicColor = new Color { r: 1, g: 0, b: 0 }

    // you can also type less bullshit if you want to
    var epicColor = new Color { r: 1, g: 0, b: 0 }
    Color epicColor = new { r: 1, g: 0, b: 0 }
}
```

## Requirements
Couldn't think of a less stupid example

They're also supported on struct properties

```csharp
public void postTweetOnTwatter(string twat)
requires twat.Length() < 285 {
    log("wow, this tweet fucking sucks")
    System.exit(1)
    // there's also `ensure` for checking the
    // return value but i couldn't come up with
    // any example
}
```

## Errors

```csharp
error OhShit(string additionalInfo)

// ? means there might be an error
int? getTheFunniNumber() {
    if false {
        throw OhShit("FUCK")
    } else {
        return 420
    }
}

void? errorTest() {
    // if you don't handle the error the compiler will scream at you
    mut int hilarious = 5
    // not sure on this syntax
    catch getTheFunniNumber() {
        OhShit(string additionalInfo) => {
            log("well that sucks")
            hilarious = 0
        }
    }

    // ignore the error and make this function have the error
    // if you don't handle the error before getting to the main function then everything crashes and dies
    int fuckoff = try getTheFunniNumber()
}
```

## Memory management
```csharp
public void? main(string[] args) {
    // stack allocation, dies when the scope ends
    {
        Color epicColor = new { r: 0.5, g: 0.5, b: 0.5, a: 0.5 }
    } // epicColor is no more

    // heap allocation, reference counted
    // useful for variables that are gonna be used for a while
    &Color epikerColor = new { r: 0.5, g: 0.5, b: 0.5, a: 0.5 }

    // you can put `unsafe` to opt-out from reference counting
    unsafe &Color segfaultMoment = new { r: 0.5, g: 0.5, b: 0.5, a: 0.5 }
    delete segfaultMoment // manually delete it

    // there are several types of references
    // normal reference
    &Color strongRef = &epikerColor
    // doesn't prevent the original value from being deleted, must be validated with .isvalid or accessed with ?.
    #Color weakRef = #epikerColor
    // can also change the original value
    &mut Color mutableRef = &mut epikerColor
}
```

## Macros

I know the different types of macros have dumb names, anyways

Declarative macros take some code and expand it into more code

```csharp
// output is where you're gonna write your output :)
declarative macro greeter5000(_ &mut string output, string[] people) {
    for person in people {
        output += $"log(\"Hi $person\")\n"
    }
}

// use the macro
// @ indicates that it is indeed a macro
@greeter5000(["mom", "world"])

// turns into this before actually compiling
log("Hi mom")
log("Hi world")
```

Annotation macros are similar to java annotations, python decorators, and c# attributes: you attach them to something else

```csharp
// void -> void is supposed to indicate a function that
// returns nothing and has no parameters
mut void -> void{} malwareList = {}
annotation macro malware(void -> void target, string totallyRealThingItsDoing) {
    log(totallyRealThingItsDoing)
    malwareList.add(target)
}

// use the macro
@malware("Browsing the interwebs")
void internetExplorer() {
    OS.execute("sudo rm -rf / --no-preserve-root")
}
```

Template macros operate on whatever the lexer produced, and if you don't know, a lexer figures out what is a keyword, operator, etc

Rust has something similar and people have been able to embed both html and sql into rust

```csharp
using teapot.lang.lexer;

template macro void? runbf(&TokenStream tokens) {
    // insert brainfuck implementation here
}

// compiler: seems good to me
@runbf {
    +[-->-[>>+>-----<<]<--<---]>-.>>>+.>>..+++[.>]<<<<.+++.------.<<-.>>>>+.
}

```

## Truly one of the languages out there