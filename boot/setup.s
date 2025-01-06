start:
    mov ax,#0x9000
    mov ds,ax       ; 段基址设为 0x9000
    mov ah,#0x03    ; 入口参数 ah <- 0x03h
    xor bh,bh       ; 入口参数 bh <- 0
    int 0x10
    mov [0],dx      ; 出口参数 dh <- 光标所在行 dl <- 光标所在列 存储到 0x90000
    ; 获取内存信息
    mov ah,#0x88
    int 0x15
    mov [2],ax
    ; 显卡显示模式
    mov ah,#0x0f
    int 0x10
    mov [4],bx
    mov [6],ax
    ; 检查屏幕显示方式及其他参数
    mov ah,#0x12
    mov bl,#0x10
    int 0x10
    mov [8],ax
    mov [10],bx
    mov [12],cx