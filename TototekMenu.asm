; This is the disassembly for the tototek (tigersoft) snes flash linker menu program...
; I wrote a program that de-duplicates bsnes-plus logs and notes unique sequences just for this.

; I still need to go through and comment all of this, but this is essentially the entire code (might be missing a few things)

lorom
org $008000		; This is a unique sequence

romstart:
sei           
cld           
clc           
xce           
jsr @initsub  ; $8445
jsr @vraminit ; $85fb

lda #$00      
sta $1006     
lda #$40      
sta $1007     
lda #$0f      
sta $2100     
lda #$01      
sta $4200     
lda #$00      
sta $40       
sta $41       
sta $42       
sta $43       
sta $45       
sta $47       
lda #$00      
sta $60       
lda #$01      
sta $61       
lda #$01      
sta $44       
lda #$00      
sta $1520     
;subroutine dos not use any cpu reg data -- will be renaming jsr's
jsr $826c    

lda $61       
cmp #$01      
bne $8049

jmp $808a


$8049:     
jsr $826c     

;org $804c		; This is a unique sequence
jsr $80c2

lda $2d       
beq $8049     

;org $8053		; This is a unique sequence
lda $2d       
and #$10      
beq $805c     
jmp $808a  
$808a:   
lda $60       
asl a         
asl a         
asl a         
asl a         
asl a         
and #$e0      
ora #$1d      
tax           
lda @gametitle,x  ;$c000,x ;LOADING THE GAME TITLES   
and #$f0      
ora #$80      
sta $62       
lda @gametitle,x  ;$c000,x   
asl a         
asl a         
asl a         
asl a         
and #$f0      
sta $64       
inx           
lda @gametitle,x  ;$c000,x   
sta $63       
ldx #$00
$80b2:      
lda @wramcode,x   ;$e000,x ;This appears to be code... loaded into WRAM 
sta $7fff80,x 
inx           
cpx #$30      
bne $80b2 ;loop to copy all the code...     

jml $7fff80     ; execute code that we just loaded into WRAM    
;END OF MAIN LOOP

;org $00805c		; This is a unique sequence
$805c:
lda $2d       
and #$04      
beq $806d     
lda $61       
beq $806d     
dec           
cmp $60       
beq $806d     
inc $60       
$806d:
lda $2d       
and #$08      
beq $8079 
lda $60
beq $8079
dec $60    
$8079:
jsr $826c     

;org $00807c		; This is a unique sequence
$807c:
jsr $80c2     

;org $00807f		; This is a unique sequence
lda $2d       
and #$0f      
cmp #$00      
bne $807c     
;org $008087		; This is a unique sequence
jmp $8049 

initsub:      ; $8845: the initialization subroutine     
sep #$30      
lda #$8f      
sta $2100     
lda #$00      
sta $2101     
lda #$00      
sta $2102     
sta $2103     
lda #$00      
sta $2105     
lda #$00      
sta $2106     
lda #$00      
sta $2107     
lda #$00      
sta $2108     
lda #$00      
sta $2109     
lda #$00      
sta $210a     
lda #$00      
sta $210b     
lda #$00      
sta $210c     
lda #$00      
sta $210d     
sta $210d     
sta $210e     
sta $210e     
sta $210f     
sta $210f     
sta $2110     
sta $2110     
sta $2111     
sta $2111     
sta $2112     
sta $2112     
sta $2113     
sta $2113     
sta $2114     
sta $2114     
lda #$80      
sta $2115     
lda #$00      
sta $2116     
sta $2117     
sta $211a     
sta $211b     
lda #$01      
sta $211b     
lda #$00      
sta $211c     
sta $211c     
sta $211d     
sta $211d     
sta $211e     
lda #$01      
sta $211e     
lda #$00      
sta $211f     
sta $211f     
sta $2120     
sta $2120     
sta $2121     
sta $2123     
sta $2124     
sta $2125     
sta $2126     
sta $2127     
sta $2128     
sta $2129     
sta $212a     
sta $212b     
lda #$01      
sta $212c     
lda #$00      
sta $212d     
lda #$00      
sta $212e     
sta $212f     
lda #$30      
sta $2130     
lda #$00      
sta $2131     
lda #$e0      
sta $2132     
lda #$00      
sta $2133     
lda #$00      
sta $4200     
lda #$ff      
sta $4201     
lda #$00      
sta $4202     
sta $4203     
sta $4204     
sta $4205     
sta $4206     
sta $4207     
sta $4208     
sta $4209     
sta $420a     
sta $420b     
sta $420c     
sta $420d     
lda #$00      
sta $2105     
lda #$02      
sta $2101     
lda #$21      
sta $2107     
lda #$20      
sta $2108     
lda #$00      
sta $210b     
lda #$00      
sta $210d     
sta $210d     
sta $210e     
sta $210e     
sta $210f     
sta $210f     
sta $2110     
sta $2110     
lda #$13      
sta $212c     
lda #$30      
sta $2130     
lda #$00      
sta $2131     
lda #$e0      
sta $2132     
lda #$11      
sta $212c     
lda #$00      
sta $212d     
lda #$00      
sta $2121     
lda #$46      
sta $2122     
lda #$69      
sta $2122     
lda #$ff      
sta $2122     
sta $2122     
lda #$00      
sta $4200     
rep #$30      
sep #$20      
lda #$00      
sta $2102     
sta $2103     

ldx #$0100    
lda #$ff

oamloop:      ;$85e1: this is filling OAM with #$100 bytes of #$FF      
sta $2104     
sta $2104     
dex           
bpl @oamloop  ; $85e1     

;org $0085ea		; This is a unique sequence
ldx #$0010    
lda #$00

oamloop2:     ;$85ef: another OAM loop with #$10 bytes of #$00     
sta $2104     
sta $2104     
dex           
bpl @oamloop2 ;$85ef     

;org $0085f8		; This is a unique sequence
sep #$30      
rts           ; end of init sequence           


;THIS IS A SUBROUTINE
vraminit:     ;$85fb: initialize vram     
rep #$30      
sep #$20      
ldx #$0000    
stx $2116     
ldx #$0000    

vramzerofill: ;$8608: this is a loop that fills vram...
lda #$00      
sta $2118     
stz $2119     
inx           
cpx #$8000    
bne @vramzerofill ;$8608     

;org $008616		; This is a unique sequence
ldx #$0000    
stx $2116     
ldx #$0000

loadmenufont: ; $861f:    
lda @fontdata,x;$8683,x   ; This is where the menu font is located...   
sta $2118     
stz $2119     
inx           
cpx #$0200    
bne @loadmenufont ;$861f     

;org $00862e		; This is a unique sequence
ldx #$4000    
stx $2116     
ldx #$0000    

loadextafont: ; $8637: apparrently an afterthought
lda @fontetc,x ;$8663,x   
sta $2118     
stz $2119     
inx           
cpx #$0020    
bne @loadextrafont  ;$8637     

;org $008646		; This is a unique sequence
ldx #$2000    
stx $2116     
ldx #$0000    

loadtilemap:    ;$864f: it's the tile definitions...
lda @fontmap,x  ;$8883,x   
and #$3f      
sta $2118     
stz $2119     
inx           
cpx #$0400    
bne @loadtilemap  ;$864f   

;org $008660		; This is a unique sequence
sep #$30      
rts
;END OF SUBROUTINE
           

;NEED COMMENTARY BELOW! 
;SUBROUTINE 
$826c:
pha           
lda #$00      
sta $52       
sta $61       
lda #$0b      
sta $51       
ldx $52       
lda @gametitle,x  ;$c000,x   
cmp #$00      
beq $82dd     
ldx #$04      
ldy $51
$8277:       
lda $52       
lsr a         
lsr a         
lsr a         
lsr a         
lsr a         
pha
;subroutine uses A           
jsr $81d9

;subroutine uses X,Y,A           
ldx #$03      
ldy $51       
lda #$20      
jsr $81a1

pla           
cmp $60       
bne $82a2     
lda #$2a      
jsr $81a1     

;org $0082a2		; This is a unique sequence
$82a2:
ldx #$05      
ldy $51       
lda #$29      
jsr $81a1     

;org $0082ab		; This is a unique sequence
lda #$07      
sta $50       
ldy #$00      
ldx $52       
inx           
$82b4:
lda $c000,x   
phy           
phx           
cmp #$00      
beq $82c4     
ldx $50       
ldy $51       
jsr $81a1     

;org $0082c4		; This is a unique sequence
$82c4:
plx           
ply           
inx           
iny           
inc $50       
cpy #$14      
bne $82b4     

;org $0082ce		; This is a unique sequence
inc $51       
inc $51       
inc $61       
clc           
lda $52       
adc #$20      
sta $52       
bra $8277     

;org $0082dd		; This is a unique sequence
$82dd:
pla           
rts 
;END OF SUBROUTINE


;SUBROUTINE
$81d9:     
phy           
phx           
sta $e8       
txa           
and #$1f      
sta $e9       
tya           
and #$1f      
sta $ea       
lda $ea       
asl a         
asl a         
asl a         
asl a         
asl a         
ora $e9       
sta $2116     
sta $eb       
lda $ea       
lsr a         
lsr a         
lsr a         
and #$03      
clc           
adc #$20      
sta $ec       
sta $2117     
lda $e8       
tay           
lda $8215,y   
and #$3f      
sta $2118     
stz $2119     
plx           
ply           
rts
;END OF SUBROUTINE
   
;SUBROUTINE
$81a1:
phy           
phx           
sta $e8       
txa           
and #$1f      
sta $e9       
tya           
and #$1f      
sta $ea       
lda $ea       
asl a         
asl a         
asl a         
asl a         
asl a         
ora $e9       
sta $2116     
sta $eb       
lda $ea       
lsr a         
lsr a         
lsr a         
and #$03      
clc           
adc #$20      
sta $ec       
sta $2117     
lda $e8       
and #$3f      
sta $2118     
stz $2119     
plx           
ply           
rts
;END OF SUBROUTINE       

;SUBROUTINE
$80c2:     
lsr $4212     
bcs $80c2     
lda $4219     
sta $2d       
lsr $4212     
bcs $80c2     
rts
;END OF SUBROUTINE 

fontetc:
incbin .\0x663_MenuStarsNLines.bin   

fontdata:
incbin .\0x683_MENUFONT.bin

fontmap:
incbin .\0x883_MenuTileMap.bin  

org $C000
gametitle:
incbin .\0x4000_GameTitles.bin

org $E000
wramcode:
;$7fff80:        ;e000 (Original PC $6000)
lda $64       
sta $e88000   
lda $62       
sta $e08000   
lda $63       
sta $f08000   
lda $00fffc   
sta $7fffac   
lda $00fffd   
sta $7fffad   
lda #$00      
sta $7fffae   
sei           
sec           
xce           
jml @romstart   ; $008000