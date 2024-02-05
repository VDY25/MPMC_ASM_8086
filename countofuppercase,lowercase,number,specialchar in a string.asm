; multi-segment executable file template.
;write an alp using 8086 instruction set to count the number of lowercase, uppercase, numbers, special char in a given string.

;ascii ranges:
;lowercase: 61h-7fh
;uppercase: 41h-5ah
;numbers: 30h-39h
 

data segment
   string db 'Yuva25**$'   
   count db 8
   uppercasecount db ?
   lowercasecount db ?
   numberscount db ?
   specialcharcount db ?
    
ends

 

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax   
    
    mov si,0000h
    mov ax,0000h   
    
    mov lowercasecount ,00h
    mov uppercasecount ,00h
    mov numberscount ,00h
    mov specialcharcount ,00h
     
    
    lea si, string
    mov cl,count  
      
countingprocess:
    
    mov al,[si]  
    
    cmp al, 7fh
    jb loop1
    inc specialcharcount 
    inc si
    loop countingprocess  
    jmp exit
loop1:
    cmp al,61h   ;'a'
    jb loop2
    inc lowercasecount
    inc si  
    loop countingprocess 
    jmp exit
    
loop2:
    cmp al,5ah
    jb loop3  
    
    
loop3:
    cmp al, 41h
    jb loop4 
    inc uppercasecount
    inc si
    loop countingprocess 
    jmp exit
    
    
loop4:   
    cmp al,39h
    jb loop5
    
    
loop5:
    cmp al,30h
    jb loop6
    inc numberscount
    inc si
    loop countingprocess   
    jmp exit
    
loop6:
    inc specialcharcount
    
    inc si
    
    loop countingprocess
    jmp exit
    
    
    
    
    
 
    
    
     
    ; add your code here
   
 exit:   
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
