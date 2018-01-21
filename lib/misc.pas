
unit misc;

{

DetectCPU
DetectCPUSpeed
DetectEvie
DetectHighMem
DetectMapRam
DetectMem
DetectStereo
DetectVBXE

}

interface

var
	banks: array [0..63] of byte absolute $0101;

	function DetectCPU: byte; assembler;
	function DetectCPUSpeed: real;
	function DetectEvie: Boolean; assembler;
	function DetectHighMem: word;
	function DetectMapRam: Boolean; assembler;
	function DetectMem: byte; assembler;
	function DetectStereo: Boolean; assembler;
	function DetectVBXE(var p: word): Boolean; assembler; register;


implementation


function DetectHighMem: word;
// http://atariki.krap.pl/index.php/Obliczenie_rozmiaru_pami%C4%99ci_liniowej
begin

 Result:=0;

 if DetectCPU > $7f then

asm
{
adr	= eax
bcnt	= Result
bfirst	= Result+1

	opt c+

	stx @sp

	sei
	inc nmien

ramsize	stz adr
	stz adr+1
	lda #$01
	sta adr+2

	stz bfirst
	stz bcnt

?lp0	stz.w $0000

	lda [adr]
	eor #$ff
	sta [adr]
	cmp [adr]
	bne ?nx
	ldx.w $0000
	bne ?nx
	eor #$ff
	sta [adr]
	bra ?fnd

?nx	inc adr+2
	bne ?lp0

	bra ?abt

?fnd	lda adr+2
	sta bfirst

	inc adr+2
	inc bcnt

?lp1	stz.w $0000

	lda [adr]
	eor #$ff
	sta [adr]
	cmp [adr]
	bne ?abt
	ldx.w $0000
	bne ?abt
	eor #$ff
	sta [adr]
	inc bcnt
	inc adr+2
	bne ?lp1

        dec bcnt

?abt
	dec nmien
	cli

	ldx #0
@sp	equ *-1

	opt c-
};
end;


function DetectVBXE(var p: word): Boolean; assembler; register;
asm
{	txa:pha

	jsr @vbxe_detect

	ldy #0		; core
	sta (p),y

	lda fxptr+1
	sta Result

	iny		; page
	sta (p),y

	pla:tax
};
end;


function DetectEvie: Boolean; assembler;
asm
{	ldy #3
lp	lda $d2fa,y
	cmp _evie,y
	bne _no
	dey
	bpl lp

_yes	lda #true
	dta $2c

_no	lda #false
	sta Result

	jmp stop

_evie	dta c'Evie'

stop
};
end;


function DetectStereo: Boolean; assembler;
(*
 second POKEY detect routine answer in A register:
 $00 - absent
 $80 - present
 code & idea: Seban/SLIGHT
 (c) 1995,96 Slight!
*)
asm
{	txa:pha

pokey1	= $d200
pokey2	= $d210

	sei
	inc nmien

	lda #$03
	sta pokey2+$0f
	sta pokey2
	ldx #$00
	stx pokey2+$01
	inx
	stx pokey2+$0e

	ldx:rne vcount

	stx pokey2+$09
loop	ldx vcount
	bmi stop
	lda #$01
	bit irqen
	bne loop

stop	lda $10
	sta irqen

	dec nmien
	cli

	stx Result

	pla:tax
};
end;


function DetectCPU: byte; assembler;
(*
 How to detect on which CPU the assembler code is running

 (This information is from Draco, the author of SYSINFO 2.0)

 You can test on plain 6502-Code if there is a 65c816 CPU, the 16-Bit processor avaible
 in some XLs as a turbo-board, avaible. Draco told me how to do this:

 First we make sure, whether we are running on NMOS-CPU (6502) or CMOS (65c02,65c816).
 I will just show the "official" way which doesn`t uses "illegal opcodes":

 result in regA:
 $00 - 6502
 $01 - 65c02
 $80 - 65816
*)
asm
{	txa:pha

	opt c+

;detekcja zainstalowanego procesora
	lda #$99
	clc
	sed
	adc #$01
	cld
	beq DetectCPU_CMOS

DetectCPU_02
	lda #0
	jmp stop

DetectCPU_CMOS
	lda #0
	rep #%00000010		;wyzerowanie bitu Z
	bne DetectCPU_C816

DetectCPU_C02
	lda #1
	jmp stop

DetectCPU_C816
	lda #$80

stop	sta Result

	opt c-

	pla:tax
};
end;


function DetectCPUSpeed: real;
(*
	by Draco
*)
var clkm, fr0: word;
begin

asm
{	stx @sp

	tsx
	stx	stk

	lda	vvblki
	sta	lvbl

	lda	vvblki+1
	sta	hvbl

	sei

	ldx	<stop2
	ldy	>stop2

bogo2	lda	vcount
	cmp	#112
	bne	bogo2

	stx	vvblki
	sty	vvblki+1

	lda	#$00
	sta	fr0+1
	tax
	tay

	sta	wsync

loop2	iny
	bne	loop2
	inx
	bne	loop2
	clc
	adc	#$01
	bne	loop2

stop2
	pla
	sta	clkm
	pla
	sta	clkm+1
	pla
;	sta	clkm+2
	sta	fr0

	ldx	#0
stk	equ *-1
	txs

	lda	#0
lvbl	equ *-1
	sta vvblki

	lda	#0
hvbl	equ *-1
	sta vvblki+1

	cli
	ldx #0
@sp	equ *-1
};
	Result := (real((fr0 shl 16) + clkm) / 487.0) * 1.7734;
end;


function DetectMem: byte; assembler;
asm
{	txa:pha

bsav	= @buf

ext_b	= $4000		;cokolwiek z zakresu $4000-$7FFF

	ldy #0
mov	mva copy,y detect,y
	iny
	cpy #.sizeof(detect)
	bne mov

	jsr detect

	jmp stop

copy

.local	detect,$0600

	lda portb
	pha

	lda #$ff
	sta portb

	lda ext_b
	pha

	ldx #$0f	;zapami�tanie bajt�w ext (z 16 blok�w po 64k)
_p0	jsr setpb
	lda ext_b
	sta bsav,x
	dex
	bpl _p0

	ldx #$0f	;wyzerowanie ich (w oddzielnej p�tli, bo nie wiadomo
_p1	jsr setpb	;kt�re kombinacje bit�w PORTB wybieraj� te same banki)
	lda #$00
	sta ext_b
	dex
	bpl _p1

	stx portb	;eliminacja pami�ci podstawowej
	stx ext_b
	stx $00		;niezb�dne dla niekt�rych rozszerze� do 256k

	ldy #$00	;p�tla zliczaj�ca bloki 64k
	ldx #$0f
_p2	jsr setpb
	lda ext_b	;je�li ext_b jest r�ne od zera, blok 64k ju� zliczony
	bne _n2

	dec ext_b	;w przeciwnym wypadku zaznacz jako zliczony

	lda ext_b	;sprawdz, czy sie zaznaczyl; jesli nie -> cos nie tak ze sprzetem
	bpl _n2

	lda portb	;wpisz warto�� PORTB do tablicy dla banku 0

	and #$fe

	sta adr.banks,y
	eor #%00000100	;uzupe�nij warto�ci dla bank�w 1, 2, 3
	sta adr.banks+1,y
	eor #%00001100
	sta adr.banks+2,y
	eor #%00000100
	sta adr.banks+3,y
	iny
	iny
	iny
	iny

_n2	dex
	bpl _p2

	ldx #$0f	;przywr�cenie zawarto�ci ext
_p3	jsr setpb
	lda bsav,x
	sta ext_b
	dex
	bpl _p3

	stx portb	;X=$FF

	pla
	sta ext_b

	pla
	sta portb

	sty Result

	rts

; podprogramy
setpb	txa		;zmiana kolejno�ci bit�w: %0000dcba -> %cba000d0
	lsr
	ror
	ror
	ror
	adc #$01	;ustawienie bitu nr 1 w zaleznosci od stanu C
	ora #$01	;ustawienie bitu steruj�cego OS ROM na wartosc domyslna
	sta portb
	rts

.endl

stop	pla:tax

};
end;


function DetectMapRam: Boolean; assembler;
asm
{
; http://xxl.atari.pl/mapram/

bsav	= DX
ext_b	= $5000		;cokolwiek z zakresu $5000-$57FF

	txa:pha

	ldy #.sizeof(detect)-1
	mva:rpl copy,y detect,y-

	jsr detect

	jmp stop

copy

.local	detect,@buf

	sei
	inc nmien

	mva #FALSE Result

	lda portb
	pha

	lda #$ff
	sta portb

	lda ext_b
	pha

_p0	jsr setb
	lda ext_b
	sta bsav

	lda #$00
	sta ext_b

	lda #$ff
	sta portb	;eliminacja pami�ci podstawowej
	sta ext_b

_p2	jsr setb

	inc ext_b
	beq _p3

	mva #TRUE Result

_p3	lda bsav
	sta ext_b

	lda #$ff
	sta portb

	pla
	sta ext_b

	pla
	sta portb

	dec nmien
	cli

	rts

setb	lda portb
	and #%01001110	; !!!
	ora #%00110000  ; MAPRAM ON
	sta portb
	rts

.endl

stop	pla:tax

};
end;

end.

