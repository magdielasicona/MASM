;Programa que muestra como realizar decremento e incremento
;esto se realiza con las instrucciones INC y DEC
.model tiny
.data
.code
    .startup
    
    ;se le asigna un valor al registro al
    MOV     al, 5                        
    ;se incrementa
    INC     al 
    INC     al  
    
    ;se mueve el dato del registro al al dl y se le suma 48
    MOV      dl, al
    ADD      dl, 48
   
   ;se muestra el registro
   MOV      ah, 02h
   INT      21h           
   
   ;se decrementa                      
   DEC      dl
   
   ;se muestra el registro decrementado
   MOV      ah, 02h
   INT      21h
   
   MOV      ax, 0c07h
   INT      21h
    
    .exit
end