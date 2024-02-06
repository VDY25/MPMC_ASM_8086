; multi-segment executable file template.  
;in an array of bcd numbers print only the numbers that are divisible by 3 or 10

include 'emu8086.inc'

data segment
    array db 3,10,15,2,7
    count db 5  
    newline db 13,10,'$'
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
    mov ah,00  
    
checking:    
   
    
    mov ah,00   
     
    mov al,[si] 
    mov bl,3
    div bl
    cmp ah,00
    je printing
    mov ax,00
    mov al,[si]
    mov bl,10
    div bl
    cmp ah,00
    je printing
    
    inc si  
    loop checking
    jmp exit
             
             
printing:

    mov al,[si]
    call print_num   
    lea dx,newline
    mov ah,9
    int 21h
    inc si
    loop checking
    jmp exit
    

define_print_num
define_print_num_uns  
          
exit:     
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
