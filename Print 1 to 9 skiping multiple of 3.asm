.model small
.stack 100h
.data

.code
main proc
    
    mov cx,9    
    mov dl,'1'   
     
    
   
    myloop:
    mov ah,0
    sub dl,'0' 
    mov al,dl
    mov bh,3
    div bh
    
    cmp ah,0
    je print
    
    add dl,'0'    
    mov ah,2
    int 21h 
    sub dl,'0' 
    
    print:
      
    INC dl  
    add dl,'0'
      
    loop myloop 
    
     
    
    exit:
    mov ah,4ch
    int 21h    
    
    main endp
end main
