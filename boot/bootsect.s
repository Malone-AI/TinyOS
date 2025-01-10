mov ax,0x07c0
mov ds,ax   ; ds <- 0x07c0
mov ax,0x9000
mov es,ax   ; es <- 0x9000
mov cx,#256
xor si,si   ; si <- 0
xor di,di   ; di <- 0
rep movw    ; es:di <- ds:si, repeat 256 times
jmpi go,0x9000  ; ip <- segment go, cs <- 0x9000
go:
mov ax,cs
mov ds,ax   ; ds <- 0x9000
mov es,ax   ; es <- 0x9000
mov ss,ax   ; ss <- 0x9000
mov sp,#0xFF00  ; sp <- 0x9000, the stack address ss:sp is 0x9000 * 0x0010 + 0xFF00 = 0x9FF00
load_setup:
mov dx,#0x0000
mov cx,#0x0002
mov bx,#0x0200
mov ax,#0x0200+4
int 0x13
jnc ok_load_setup
mov dx,#0x0000
mov ax,#0x0000
int 0x13
jmp load_setup
ok_load_setup:
    ; ...
    mov ax,#0x1000
    mov es,ax       ; segment of 0x10000
    call read_it
    ; ...
    jmpi 0,0x9020