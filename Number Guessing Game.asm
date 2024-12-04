.model small
.stack 100h
.data
    x db 5              
    inputmsg db 10,13, 'Enter a number (0-9): $'
    msghigher db 10,13, 'The number is higher. Try again!$'
    msglower db 10,13, 'The number is lower. Try again!$'
    msgcongrats db 10,13, 'Congratulations! You guessed it!$'
    msglose db 10,13, 'You lose the game. Better luck next time!$'
    msginvalid db 10,13, 'Invalid input. Please enter a number between 0 and 9.$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 3            

input_loop:
    lea dx, inputmsg
    mov ah, 09h
    int 21h

    mov ah, 01h          
    int 21h
    sub al, '0'         

    cmp al, 0
    jl invalid_input     
    cmp al, 9
    jg invalid_input    

    cmp al, x            
    je correct_guess

    cmp al, x            
    jl lower_guess

higher_guess:
    lea dx, msghigher
    mov ah, 09h
    int 21h
    jmp next_attempt

lower_guess:
    lea dx, msglower
    mov ah, 09h
    int 21h
    jmp next_attempt

correct_guess:
    lea dx, msgcongrats
    mov ah, 09h
    int 21h
    jmp end_game

invalid_input:
    lea dx, msginvalid
    mov ah, 09h
    int 21h
    jmp input_loop

next_attempt:
    loop input_loop     

    lea dx, msglose
    mov ah, 09h
    int 21h

end_game:
    mov ah, 4ch         
    int 21h

main endp
end main
