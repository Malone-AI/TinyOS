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
    ; 获取第一块硬盘的信息。
    mov ax,#0x0000
    mov ds,ax
    lds si,[4*0x41]
    mov ax,#INITSEG
    mov es,ax
    mov di,#0x0080
    mov cx,#0x10
    rep
    movsb
    ; 获取第二块硬盘的信息。
    mov ax,#0x0000
    mov ds,ax
    lds si,[4*0x46]
    mov ax,#INITSEG
    mov es,ax
    mov di,#0x0090
    mov cx,#0x10
    rep
    movsb
    cli ; 关中断

    mov ax,#0x0000
    cld
do_move:
    mov es,ax
    add ax,#0x1000
    cmp ax,#0x9000
    jz  end_move
    mov ds,ax
    sub di,di
    sub si,si
    mov cx,#0x8000
    rep movsw
    jmp do_move
end_move:
    ; ...
    lidt  idt_48
    lgdt  gdt_48

idt_48:
    .word   0
    .word   0,0