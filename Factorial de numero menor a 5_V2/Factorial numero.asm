.model small

.stack

.data
   resultado    db  1
.code

    .startup   
    
    MOV     cx, 3
    
    
    ciclo:
        MOV     al, resultado
        MOV     bl, cl
        MUL     bl
        MOV     resultado, al
        LOOP    ciclo  
        
    MOV     al, resultado
    AAM     
    MOV     bx, ax
    MOV     ah, 02h
    MOV     dl, bh
    ADD     dl, 30h
    INT     21h
    
    
    MOV     ah, 02h
    MOV     dl, bl
    ADD     dl, 30h
    INT     21h
    
    .exit
    
end