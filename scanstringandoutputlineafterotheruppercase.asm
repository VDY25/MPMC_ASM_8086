; multi-segment executable file template.
; write an alp using 8086 insturction set to scan string from user and print the words separated by space one line after the other in uppercase.
data segment   
   input db 'Enter the string:$'
   array db 19 dup('$')    
   newline db 13,10,'$'
   
     
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    
    lea dx,input
    mov ah,9
    int 21h    
    
    mov ah,0ah  
    lea dx,array
    mov array,11
    int 21h        
            
            
    lea dx,newline
    mov ah,9
    int 21h
    
    lea si,array 
    mov cl,array[1]
    mov si,02  
    
check:   

    mov al,array[si] 
    cmp al,20h
    je next
    cmp al,'a'
    jl print   
    sub al,20h    
    
print:
    
    mov dl,al 
    
    mov ah,2
    int 21h
    
    inc si
    loop check
    jmp exit
    
next:

    lea dx,newline
    mov ah,9
    int 21h        
    
    inc si
    loop check
    
exit:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
