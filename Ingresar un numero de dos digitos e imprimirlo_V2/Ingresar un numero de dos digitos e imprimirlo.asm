.model small

.stack


.data
     u db 0
     d db 0
     n db 0
     msg db 10,13,"Ingrese un numero: ","$"
     msg1 db 10,13,"Numero Ingresado: ","$"

.code


    .startup
    
    MOV     ah, 09h
    MOV     dx, offset msg
    INT     21h
    
    
    MOV     ah, 01h
    INT     21h
    SUB     al, 30h
    MOV     d, al
    
    MOV     ah, 01h
    INT     21h
    SUB     al, 30h
    MOV     u, al
    
    MOV     al, d
    MOV     bl, 10
    MUL     bl
    ADD     al, u
    MOV     n, al 
    
    MOV     ah, 09h
    MOV     dx, offset msg1
    INT     21h
    
    MOV     al, n
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
    
    
    
        MOV     ax, 0c07h
        INT     21h
    .exit
    
end