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
    mov bl,0    ; sum =0
    
    
    ; adding into loop
    
    my_loop:  
    add bl,[si]
    inc si    
    loop my_loop    
    
    ; print result            
    mov ah,2    
    mov dl,bl
    add dl,48    
    int 21h
                 
    exit:
    mov ah,4ch
    main endp

end main
