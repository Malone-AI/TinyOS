mov ax,0x07c0
mov ds,ax   ; ds <- 0x07c0
mov ax,0x9000
mov es,ax   ; es <- 0x9000
mov cx,#256
xor si,si   ; si <- 0
xor di,di   ; di <- 0
rep movw    ; es:di <- ds:si, repeat 256 times
jmpi go,0x9000  ; ip <- segment go, cs <- 0x9000
mov ax,cs
mov ds,ax   ; ds <- 0x9000
mov es,ax   ; es <- 0x9000
mov ss,ax   ; ss <- 0x9000
mov sp,#0xFF00  ; sp <- 0x9000, the stack address ss:sp is 0x9000 * 0x0010 + 0xFF00 = 0x9FF00