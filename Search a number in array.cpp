;Search a number in array

.model small
.stack 100h
.data

my_array db 1,2,3,4,5    

msg1 db "Value Found $"
msg2 db "Value not found $"
.code

main proc
    mov ax , @data
    mov ds ,ax
    mov si,offset my_array       
    
    mov cx,5     
    mov bl,7  ; not found
    
    ; mov bl,3 ; found 
    
    ; cmp with each element into loop
    
    my_loop:  
    cmp bl,[si]

    je msg1_print
     
    inc si  
    loop my_loop 
     
    msg2_print:
    mov ah,9
    lea  dx,msg2
    int 21h
    jmp exit
      
    
    msg1_print:
                
    mov ah,9
    lea  dx,msg1
    int 21h
    jmp exit
    
  
     
    exit:
    mov ah,4ch
    main endp

end main
