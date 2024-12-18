.model small
.stack 100h
.data

my_array db 1, 2, 3, 4, 5
sum_even dw 0
sum_odd dw 0

even_msg db 'Sum of even numbers: $'
odd_msg db 'Sum of odd numbers: $'
newline db 13, 10, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5
    mov si, offset my_array

    mov ax, 0

check_loop:
    mov al, [si]
    mov ah, 0

    mov dx, 0
    mov bl, 2
    div bl

    cmp ah, 0
    je even_number

    mov ax, [sum_odd]
    add ax, [si]
    mov [sum_odd], ax
    jmp continue_loop

even_number:
    mov ax, [sum_even]
    add ax, [si]
    mov [sum_even], ax

continue_loop:
    inc si
    loop check_loop

    lea dx, even_msg
    mov ah, 9
    int 21h

    mov ax, [sum_even]
    call print_number

    lea dx, newline
    mov ah, 9
    int 21h

    lea dx, odd_msg
    mov ah, 9
    int 21h

    mov ax, [sum_odd]
    call print_number

    lea dx, newline
    mov ah, 9
    int 21h

    mov ah, 4Ch
    int 21h

main endp

print_number proc
    mov cx, 0
next_digit:
    mov dx, 0
    div word ptr 10
    push dx
    inc cx
    cmp ax, 0
    jne next_digit

print_loop:
    pop dx
    add dl, 48
    mov ah, 2
    int 21h
    loop print_loop

    ret
print_number endp

end main
