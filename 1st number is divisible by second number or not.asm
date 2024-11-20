;1st number is divisible by second number or not

.model small
.stack 100h

.data
    msg1 db 'Enter first number: $'
    msg2 db 'Enter second number: $'
    msg3 db 'Good friend$'
    msg4 db 'NOT good friend$'
    num1 db 0
    num2 db 0

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num1, al

    mov ah, 09h
    lea dx, msg2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num2, al

    mov al, num1
    mov bl, num2
    xor ah, ah
    div bl

    cmp ah, 0
    je divisible

    mov ah, 09h
    lea dx, msg4
    int 21h
    jmp done

divisible:
    mov ah, 09h
    lea dx, msg3
    int 21h

done:
    mov ah, 4Ch
    int 21h


exit:
    mov ah,4ch
    int 21h
end main
