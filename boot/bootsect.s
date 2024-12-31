mov ax,0x07c0
mov ds,ax ; ds <- 0x07c0
mov ax,0x9000
mov es,ax ; es <- 0x9000
mov cx,#256
xor si,si ; si <- 0
xor di,di ; di <- 0
rep movw  ; es:di <- ds:si, repeat 256 times