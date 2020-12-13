// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

// addrs = SCREEN

@SCREEN

D=A

@addrs

M=D

// addrk = KBD

@KBD

D=A

@addrk

M=D

// KBD hasn't inputs goto WHITE

@KBD

D=M

@WHITE

D;JEQ

// if addrs >= addrk goto LOOP

(BLACK)

@addrs

D=M

@addrk

D=D-M

@LOOP

D;JGE

// RAM[addrs] = -1

@addrs

A=M

M=-1

// addrs = addrs + 1

@addrs

M=M+1

// goto BLACK

@BLACK

0;JMP

// if addrs >= addrk goto LOOP

(WHITE)

@addrs

D=M

@addrk

D=D-M

@LOOP

D;JGE

// RAM[addrs] = 0

@addrs

A=M

M=0

// addrs = addrs + 1

@addrs

M=M+1

// goto WHITE

@WHITE

0;JMP