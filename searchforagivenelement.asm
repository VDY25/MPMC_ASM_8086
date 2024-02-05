; multi-segment executable file template.  
;write an alp using 8086 instruction set mnemonics to search for an element in a given array. if present print 'the element is found' and if not present , print"element is not found in the arrray."


data segment
    array db 01h,02h,03h,04h,05h 
    count db 05h
    key db 07h
    iffound db 'The given element is present in the array.$'
    notfound db 'The give element is not present in the array.$' 
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    mov si,0000h
    mov ax,0000h
    lea si, array  
    mov cl,count 
check:
    mov al,[si]
    cmp al,key
    jz yes               
    inc si        
    loop check 
    
    lea dx,notfound
    mov ah,09h
    int 21h  
    
    jmp exit
    
    
    yes:
    
    lea dx,iffound
    mov ah,09h
    int 21h        
    jmp exit
    
            
    exit:
   
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
