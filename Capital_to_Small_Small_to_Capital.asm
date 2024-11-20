;Capital to Small Small to Capital

.model small
.stack 100h
.data
    ln db 'Enter a letter: $'
    output db 10,13,'Converted letter: $'
    input db ? 
    result db ?

.code
main:

    mov ax, @data
    mov ds, ax

    lea dx, ln
    mov ah, 9
    int 21h

    
    mov ah, 1
    int 21h
    mov input, al 

    
    cmp input, 'A'
    jl check_lowercase
    cmp input, 'Z'
    jg check_lowercase 

   
    add input, 32
    jmp print_result

    check_lowercase:
    
    cmp input, 'a'
    jl not_a_letter 
    cmp input, 'z'
    jg not_a_letter

    sub input, 32
    jmp print_result

    not_a_letter:
    
    mov input, '?' 

    print_result:
    
    lea dx, output
    mov ah, 9
    int 21h
    
    ; Print the result character
    mov dl, input
    mov ah, 2
    int 21h

    exit:
    mov ah,4ch
    int 21h

end main
