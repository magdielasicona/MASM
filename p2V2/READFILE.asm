    ;Variables para lectura de archivo
    archivo db  "  c:\ec.arq",0
    handler dw ?
    archivo2 db  'copia.txt',0
    handler2 dw ?    
    msgError1 db 10,13,'Error, no se pudo abrir el archivo, vuelva a intentar $',0
    msgError2 db 10,13,'Error, no se pudo leer el archivo, vuelva a intentar $',0  
    msgError3 db 10,13,'Se encontraron errores,no se cargo ningun dato$',0

    ms21 db  13,10,10,'Ingrese el nombre del archivo$'           
    confirm1 db 'Archivo Cargado',0,'$'
    errorFile db 0

    letra db 0,'$',0
    ;Inicio de lectura de archivo

IniReadFile macro regreso      
;regreso es la etiqueta para regressar el control al menu    
    local error1
    local error2
    local error3
    local read
    local fin
    local ErroreLex

    ;resetOps;reseteando las operaciones    
    imprimir salto   



    ;Abriendo archivo
    xor ax,ax
    mov ah,3dh
    mov al,0
    mov dx,offset archivo+2
    int 21h
    jc error1
    mov handler, ax  


    ;preparando variables para analizador lexio
    mov estado,0    
    mov Indexof,0
    mov ptrbuff,offset buff
    mov si,ptrbuff
    mov byte ptr[si],'$'
    mov byte ptr[si+1],'$'


    mov numtemp,0
    mov ptrpila,offset pila
    mov ptrpila2,offset pila2

    


    ;-----------------------------------------------------------------------
    INIPAREA regreso
    jmp fin
    ;-----------------------------------------------------------------------
    error1:
        imprimir msgError1            
        mov errorFile,1
        pause
        jmp regreso
        
    fin:              
    ;agregando espacio para reconocer el ultimo token
 ;   inc si
 ;   mov si,offset letra
 ;   mov byte ptr[si],' '
        ;imprimir salto
        ;imprimir confirm1
        ;Prueba de indexof        
        ;imprimir salto
        ;-----------------------------------Cargando datos crear arbol para graphviz-----------------------------------
        ;pruebaOps
        ;-----------------------------------Cargando datos crear arbol para graphviz-----------------------------------
        pause
        jmp regreso 

endm

;---------------------------------------------------
leerArchivo MACRO  variableTexto , hArchivo
    LOCAL leer, cerrarA, error1 ,fin   ;LE INDICAMOS QUE ETIQUETAS SON LOCALES DE LA MACRO
   leer:
        MOV     AH,3fh
        MOV     BX,hArchivo
        XOR     DX,DX
        MOV     dx,offset letra
        MOV     CX, 1
        INT     21h
        JC      error1 
        CMP     AX,0
        JZ      cerrarA
        imprimir letra
        JMP     leer

     cerrarA:
         cerrarArchivo hArchivo
		 jmp	fin
    error1:
        imprimir msgError1            
        mov errorFile,1
        pause
        jmp fin
	fin:
ENDM 
cerrarArchivo MACRO hcerrarA
    MOV     AH,3eh
    MOV     BX,hcerrarA
    INT     21h
	
fin:
ENDM 
abrirArchivo MACRO modo,pArchivo2,hAr4
    LOCAL errorAbrirArchivo, salir_abrir_archivo
       MOV      AX,modo
       MOV      DX, offset pArchivo2                
       INT      21h
       JC       errorAbrirArchivo
       MOV      hAr4,AX
       JMP      salir_abrir_archivo

       errorAbrirArchivo:
           ; imprimir saltoLinea
            imprimir msgError1
            jmp	salir_abrir_archivo

       salir_abrir_archivo:
ENDM










                                                                                                                                                              



