;Printing A to Z using loop

.model small
.stack 100h
.data
   

.code
main proc

    mov ax, @data
    mov ds, ax

   
    mov cx, 26
    mov ah, 2      
    
    mov dl,'A'
    
    Fahims_Loop:
    int 21h
    INC dl
    loop  Fahims_Loop
    
    exit:
    mov ah,4ch
    int 21h
                
        
    main endp

end main
