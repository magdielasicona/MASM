;Programa que multiplica dos numeros, MUL funciona de forma diferente que ADD ya que mul multiplica
;lo que esta en el registro 'al' con el parametro que se le manda a MUL

.model tiny

.data
  

    
.code

    .startup 
    
    ;se le agregan los datos a los registros
    MOV     al, 3
    MOV     bl, 2
    
    ;se realiza la multiplicacion al=al*bl
    MUL     bl  
    
    ;se mueve el dato del registro al a bl y se le suma 48 
    MOV     dl, al
    ADD     dl, 48
    
    ;se imprime en pantalla el valor
    MOV     ah, 02h
    INT     21h

    MOV     ax,0c07h
    INT     21h   
    .exit
end