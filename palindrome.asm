; multi-segment executable file template.   
; write an alp to check if the given string is a palindrome or not 

data segment
     string db 'mayyyalam$' 
     loopcount db 4 
     count dw 8
     ispal db 'It is a palindrome.$'
     notpal db 'Not a palindrome.$'
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
     mov di,0000h
     
     mov si,0000h  
     mov cl,loopcount
     
     lea si,string
     mov ax, count 
     add di,ax      
     
checking: 
    mov al,[si]
    mov ah,[di]    
     cmp ah,al
     jne npal  
     inc si
     dec di    
     loop checking  
     lea dx,ispal
    mov ah,9
    int 21h          
    jmp exit
     
npal:
     lea dx,notpal
     mov ah,9
     int 21h
     jmp exit
     
     
 
    
    
     
     
exit:    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
