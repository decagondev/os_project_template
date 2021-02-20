; the printing stuff goes here
; function println print the string held at bx
println:
    pusha ; store all registers on to the stack
    mov ah, 0x0e ; tty mode write char

    print_char:
        mov al, [bx] ; put the char at bx in to al
        cmp al, 0
        je done

        int 0x10 ; call the video int to put the char on screen

        add bx, 1 ; increment the bx pointer to point to the next char
        jmp print_char ; jump to our loop label

    done:
        call print_nl
        popa ; restore all registers to the cpu
        ret

print_nl:
    pusha ; store all registers on to the stack
    
    mov ah, 0x0e ; set tty mode
    mov al, 0x0a ; new line character
    int 0x10 ; write the char
    mov al, 0x0d ; carriage return character
    int 0x10 ; write the char

    popa ; restore all registers to the cpu
    ret
