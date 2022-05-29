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
@KBD
D=M
@PUSH
D;JNE

//押されてない時
//現在のスクリーンの状態を判定する処理
@SCREEN
D=M
@LOOP
D;JEQ
//スクリーン全体を白くする処理
@i
M=0
(LOOP2)
@i
D=M
@512
D=A-D
@END2
D;JEQ
@i
D=M
@SCREEN
A=D+A
M=!M
@i
M=M+1
@LOOP2
0;JMP
(END2)
@LOOP
0;JMP


//押された時
(PUSH)
//現在のスクリーンの状態を判定する処理
@SCREEN
D=M
@LOOP
D;JNE

//スクリーン全体を黒くする処理
@i
M=0
(LOOP1)
@i
D=M
@8192
D=A-D
@END1
D;JEQ
@i
D=M
@SCREEN
A=D+A
M=!M
@i
M=M+1
@LOOP1
0;JMP
(END1)

@LOOP
0;JMP
(END)