start:
    mov ax,#0x9000
    mov ds,ax       ; 段基址设为 0x9000
    mov ah,#0x03    ; 入口参数 ah <- 0x03h
    xor bh,bh       ; 入口参数 bh <- 0
    int 0x10
    mov [0],dx      ; 出口参数 dh <- 光标所在行 dl <- 光标所在列 存储到 0x90000