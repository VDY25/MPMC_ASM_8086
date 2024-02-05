; multi-segment executable file template.                          
;write an assembly language program to find the sum of numbers divisible by either 5 0r 7
 
data segment
    array db 05,10,15,07,00
    answer db ? 
    size dw 05h
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
    mov ah,00h
    mov si,0000h   
    mov dl , 00h
    lea si, array  
    mov cx,size 
    mov bl,05h
    mov bh,07h
    
      
check: 
    
    mov al,[si]
    
  
    div bl
    cmp ah,00h
    jz next           
    mov ax,00h
    mov al,[si]
    div  bh  
    cmp ah,00h
    jz next 
    mov ax,00h
    inc si    
    loop check  
    jmp exit
    
next:
    add dl,[si] 
    mov answer,dl   
    inc si
    loop check 
    jmp exit
    

         
exit:    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
    
    
  