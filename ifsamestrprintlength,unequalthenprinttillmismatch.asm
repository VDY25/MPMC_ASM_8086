; multi-segment executable file template.    
;given two strings. if they are equal print their length alone. if they are not equal, print until there is a mismatch that is if string1 is yuvarani and string2 is yuvashri , then it prints yuva in the screen.

data segment
     string1 db 'yuvarani$'
     string2 db 'yuvashri$'  
     count db 8
     
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
               
    mov cl,count
     
    lea si,string1
    lea di,string2 
    
checking:  
  
    mov al,[si]
    mov ah,[di]
    cmp al,ah
  
    jne notequal1
    
    inc si
    inc di  
    loop checking
    mov dl,count
    add dl,30h
    mov ah,2
    int 21h
    jmp exit
    

notequal1:
    lea si, string1
    lea di, string2 
 notequal2:
    mov al,[si]
    mov ah,[di]
    cmp al,ah
    jne exit
    mov dl,al
    mov ah,2
    int 21h
    inc si
    inc di
    jmp notequal2
;     
exit:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
