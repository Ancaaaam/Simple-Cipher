%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step


    xor ebx,ebx
    xor eax,eax
    jmp modifica
    
modifica:
    mov al, byte [esi+ebx]
    add al,dl
    cmp al, 'Z'
    ja redo
    mov byte [edi+ebx],al
    add ebx,1
    jmp test_end

;;scadem din al 'Z' si adunam restul cu 'A'-1 
redo: 
    sub al,'Z'
    add al,'A'-1
    mov byte [edi+ebx],al
    add ebx,1
    jmp test_end

test_end:
    loop modifica

    popa
    leave
    ret
    
