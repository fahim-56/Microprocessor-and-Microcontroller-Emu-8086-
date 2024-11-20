;Add two number

.model small
.stack 100h
.data

msg1 db "Enter the first number: $"
msg2 db 10,13, "Enter the second number: $"
msg3 db 10,13,"Sum of the numbers : $"
.code  

  main proc    
    
  mov ax,@data
  mov ds,ax
  mov ah,9 
  mov dx,offset msg1
  int 21h 
  
  mov ah,1
  int 21h
  mov bl,al
  
  mov ah,9 
  mov dx,offset msg2
  int 21h
  
  mov ah,1
  int 21h 
  mov bh,al 
  
  mov ah,9 
  mov dx,offset msg3
  int 21h 
  
  add bl,bh
  sub bl,48
  
  mov ah,2
  mov dl,bl 
  int 21h

main endp
end main
