; multi-segment executable file template.

data segment
     str1 db "Enter the string: $"
     ;newline db "$"
     str2 db 13,10,"You entered: $"
     arr db 10 dup('$')
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

    ; add your code here
            
    lea dx, str1
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 10
    lea dx, arr
    mov arr,6
    int 21h   
    
   mov ch,0 
   mov cl,arr[1]
              
  mov si,2  
    
    lea dx, str2
    mov ah, 9
    int 21h  
    
 print: 
         
        mov dl,arr[si]
        
        cmp dl,'A'
        jnae if
        cmp dl,'Z'
        jnbe if
        
         add dl,20h
         
        
     if:  
        mov ah, 2
        int 21h  
        inc si 
        loop print
    
      ;lea dx, arr+2
;      mov ah,9
;      int 21h
    
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
