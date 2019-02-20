data segment
   x db 0
  y db 0
 
ends
 
stack segment
    dw   128  dup(0)
ends
 
code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
   mov ah,00h
   mov al,13h
   int 10h
    
 
push 0a000h
pop es 
mov al,10
mov y,al 
 
mov ax,320
mul y 
add ax,10
 
 
 
treygolnik:
 
 
mov dx,3c8h 
mov al,160; 
mov x,al 
mov al,255
mov y,al 
mov ax,320;
mul y 
add ax,160
mov di,ax    

mov cx,20
left:
    mov byte ptr es:[di],4
    add di,320    
    loop left
    
mov cx,50
down:
    mov byte ptr es:[di],4
    inc di    
    loop down
    
mov cx,20
right:
    mov byte ptr es:[di],4
    sub di,320    
    loop right
    
mov cx,50    
top:
    mov byte ptr es:[di],4
    dec di    
    loop top         
       
;cycle11:
;    mov byte ptr es:[di],4
;    add di,320;
;      
;    loop cycle11
;    mov cx,50      ;
; 
;cycl21:
; 
;    mov byte ptr es:[di],10 
;    inc di  
;    loop cycl21 
; 
;    mov cx,50      ;
; 
;cyce31:
;    mov byte ptr es:[di],9 
;    sub di,320
;    dec di  
;    loop cyce31
 
        mov ah,08h
    int 21h
  
 
    mov ah,00h
    mov al,03h
    int 10h
 
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends
 
end start ; set entry point and stop the assembler.
