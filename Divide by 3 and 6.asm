;Divide by 3 and 6

.model small
.stack 100h
.data

msg1 db "Enter the number: $"

msg3 db 10,13,"Devided by 3 and 6 both: $" 
msg4 db 10,13,"Not divided by 3 and 6 both:$"
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
  
  
  mov al,bl   
  mov bh,3 
     
  mov ah,0      
  
  div bh        
  
  cmp ah,0       
  je even_print
  jne odd_print
  
  even_print:  
  
  
  
  mov al,bl   
  mov bh,6 
       
  mov ah,0     
  
  div bh         
  
  cmp ah,0      
  je ev_print
  jne od_print
  
  ev_print:
              
  mov ah,9
  lea   dx,msg3
  int 21h
  jmp exit
  
  od_print:
   mov ah,9
  lea   dx,msg4
  int 21h
  jmp exit
  
  
  
  jmp exit
  
  odd_print:
  mov ah,9
  lea   dx,msg4
  int 21h
  jmp exit


      exit:
      mov ah,4ch
      int 21h
       
       
main endp ;ending the procedure
end main   

