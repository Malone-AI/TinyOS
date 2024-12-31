mov ax,0x07c0
mov ds,ax
mov ax,0x9000
mov es,ax
mov cx,#256
xor si,si
xor di,di
rep movw