; multi-segment executable file template. 
;write an alp to print the numbers which are greater than 10h and lesser than 1000h in a given array.

data segment
    array dw 10h, 2h,500h,100h,700h
    count db 05h   
    space dw ' $'
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
            
    lea si,array  
    mov cl, count 
    mov bh,00h

initial: 
    
       
    mov ax, [si]  
    cmp ax, 10h
    jge check  
    jb reloop
reloop:
    add si,02h 
    loop initial
    
    jmp exit
    
    
check:
    cmp ax, 1000h
    jge reloop 
    jb print
    
print:
    
    mov bl,10h
    div bl
    mov dl,ah
    mov dh,00h
    push dx 
   
    inc bh
    
    mov ah,00h
    cmp ax,00h
    jg print
    
screen:
    
    pop dx      
    
    mov dh,00
    add dl,30h
    mov ah,2
    int 21h
    dec bh
    cmp bh,00h 
    jg screen
    
    
    lea dx,space
    mov ah,9
    int 21h
   
    jmp reloop
    jmp exit
     
    
exit:    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
 

 