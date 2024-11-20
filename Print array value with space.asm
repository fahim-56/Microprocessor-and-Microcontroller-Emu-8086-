
.model small
.stack 100h
.data

my_array db 1,2,3
.code

main proc
    mov ax , @data
    mov ds ,ax
    mov si,offset my_array       
    
    mov cx,3  
    
 
    
    my_loop:
    mov ah,2
    mov dl,[si]
    add dl,48
    
    int 21h
    
    
    ;space showing
    
    mov dl,32
    int 21h
    
    inc si
    
    loop my_loop
    
    exit:
    mov ah,4ch
    main endp

end main
