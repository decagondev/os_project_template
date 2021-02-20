[org 0x7c00]
; entry point
mov bx, message_boot
call println
jmp $

; includes
%include "boot/printing.asm"
%include "boot/printing_hex.asm"
%include "boot/disk_tools.asm"
%include "boot/gdt.asm"
%include "boot/printing_pm.asm"


; data
message_boot db 'Booting OS', 0
message_protected_mode db 'Entered Protected Mode', 0

times 510 - ($ - $$) db 0
dw 0xaa55