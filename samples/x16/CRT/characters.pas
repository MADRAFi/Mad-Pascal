uses crt;

var
    i,j: byte;


    newfont: array of byte = [
        $00, $00, $00, $00, $00, $00, $00, $00,	// Char 000 (.)
        $20, $7E, $81, $A5, $81, $BD, $99, $81,	// Char 001 (.)
        $7E, $7E, $FF, $DB, $FF, $C3, $E7, $FF,	// Char 002 (.)
        $7E, $6C, $FE, $FE, $FE, $7C, $38, $10,	// Char 003 (.)
        $00, $10, $38, $7C, $FE, $7C, $38, $10,	// Char 004 (.)
        $00, $38, $7C, $38, $FE, $FE, $7C, $38,	// Char 005 (.)
        $7C, $10, $10, $38, $7C, $FE, $7C, $38,	// Char 006 (.)
        $7C, $00, $00, $18, $3C, $3C, $18, $00,	// Char 007 (.)
        $00, $FF, $FF, $E7, $C3, $C3, $E7, $FF,	// Char 008 (.)
        $FF, $00, $3C, $66, $42, $42, $66, $3C,	// Char 009 (.)
        $00, $FF, $C3, $99, $BD, $BD, $99, $C3,	// Char 010 (.)
        $FF, $0F, $07, $0F, $7D, $CC, $CC, $CC,	// Char 011 (.)
        $78, $3C, $66, $66, $66, $3C, $18, $7E,	// Char 012 (.)
        $18, $3F, $33, $3F, $30, $30, $70, $F0,	// Char 013 (.)
        $E0, $7F, $63, $7F, $63, $63, $67, $E6,	// Char 014 (.)
        $C0, $99, $5A, $3C, $E7, $E7, $3C, $5A,	// Char 015 (.)
        $99, $80, $E0, $F8, $FE, $F8, $E0, $80,	// Char 016 (.)
        $00, $02, $0E, $3E, $FE, $3E, $0E, $02,	// Char 017 (.)
        $00, $18, $3C, $7E, $18, $18, $7E, $3C,	// Char 018 (.)
        $18, $66, $66, $66, $66, $66, $00, $66,	// Char 019 (.)
        $00, $7F, $DB, $DB, $7B, $1B, $1B, $1B,	// Char 020 (.)
        $00, $3E, $63, $38, $6C, $6C, $38, $CC,	// Char 021 (.)
        $78, $00, $00, $00, $00, $7E, $7E, $7E,	// Char 022 (.)
        $00, $18, $3C, $7E, $18, $7E, $3C, $18,	// Char 023 (.)
        $FF, $18, $3C, $7E, $18, $18, $18, $18,	// Char 024 (.)
        $00, $18, $18, $18, $18, $7E, $3C, $18,	// Char 025 (.)
        $00, $00, $18, $0C, $FE, $0C, $18, $00,	// Char 026 (.)
        $00, $00, $30, $60, $FE, $60, $30, $00,	// Char 027 (.)
        $00, $00, $00, $C0, $C0, $C0, $FE, $00,	// Char 028 (.)
        $00, $00, $24, $66, $FF, $66, $24, $00,	// Char 029 (.)
        $00, $00, $18, $3C, $7E, $FF, $FF, $00,	// Char 030 (.)
        $00, $00, $FF, $FF, $7E, $3C, $18, $00,	// Char 031 (.)
        $00, $00, $00, $00, $00, $00, $00, $00,	// Char 032 ( )
        $00, $30, $78, $78, $30, $30, $00, $30,	// Char 033 (!)
        $00, $6C, $6C, $6C, $00, $00, $00, $00,	// Char 034 (")
        $00, $6C, $6C, $FE, $6C, $FE, $6C, $6C,	// Char 035 (#)
        $00, $30, $7C, $C0, $78, $0C, $F8, $30,	// Char 036 ($)
        $00, $00, $C6, $CC, $18, $30, $66, $C6,	// Char 037 (%)
        $00, $38, $6C, $38, $76, $DC, $CC, $76,	// Char 038 (&)
        $00, $60, $60, $C0, $00, $00, $00, $00,	// Char 039 (')
        $00, $18, $30, $60, $60, $60, $30, $18,	// Char 040 (()
        $00, $60, $30, $18, $18, $18, $30, $60,	// Char 041 ())
        $00, $00, $66, $3C, $FF, $3C, $66, $00,	// Char 042 (*)
        $00, $00, $30, $30, $FC, $30, $30, $00,	// Char 043 (+)
        $00, $00, $00, $00, $00, $00, $30, $30,	// Char 044 (,)
        $60, $00, $00, $00, $FC, $00, $00, $00,	// Char 045 (-)
        $00, $00, $00, $00, $00, $00, $30, $30,	// Char 046 (.)
        $00, $06, $0C, $18, $30, $60, $C0, $80,	// Char 047 (/)
        $00, $FE, $86, $8E, $D2, $E2, $C2, $FE,	// Char 048 (0)
        $00, $10, $10, $10, $30, $30, $30, $30,	// Char 049 (1)
        $00, $3C, $46, $06, $0C, $30, $60, $7E,	// Char 050 (2)
        $00, $3C, $46, $06, $1C, $02, $62, $7C,	// Char 051 (3)
        $00, $4C, $4C, $44, $44, $7C, $0C, $0C,	// Char 052 (4)
        $00, $7E, $40, $7C, $02, $02, $62, $7C,	// Char 053 (5)
        $00, $3C, $66, $40, $7C, $62, $62, $3C,	// Char 054 (6)
        $00, $7C, $0C, $04, $04, $0C, $0C, $0C,	// Char 055 (7)
        $00, $3C, $46, $46, $3C, $62, $62, $3C,	// Char 056 (8)
        $00, $3C, $46, $46, $3E, $02, $62, $3C,	// Char 057 (9)
        $00, $00, $30, $30, $00, $00, $30, $30,	// Char 058 (:)
        $00, $00, $30, $30, $00, $00, $30, $30,	// Char 059 (;)
        $60, $18, $30, $60, $C0, $60, $30, $18,	// Char 060 (<)
        $00, $00, $00, $FC, $00, $00, $FC, $00,	// Char 061 (=)
        $00, $60, $30, $18, $0C, $18, $30, $60,	// Char 062 (>)
        $00, $78, $CC, $0C, $18, $30, $00, $30,	// Char 063 (?)
        $00, $7C, $C6, $DE, $DE, $DE, $C0, $78,	// Char 064 (@)
        $00, $7E, $46, $42, $42, $7E, $62, $62,	// Char 065 (A)
        $00, $7C, $4C, $44, $7E, $62, $62, $7E,	// Char 066 (B)
        $00, $7E, $46, $40, $60, $60, $62, $7E,	// Char 067 (C)
        $00, $7C, $46, $46, $42, $62, $62, $7C,	// Char 068 (D)
        $00, $7E, $46, $40, $78, $60, $62, $7E,	// Char 069 (E)
        $00, $7E, $46, $40, $78, $60, $60, $60,	// Char 070 (F)
        $00, $7E, $46, $40, $4E, $62, $62, $7E,	// Char 071 (G)
        $00, $4C, $4C, $44, $7C, $64, $64, $64,	// Char 072 (H)
        $00, $10, $10, $10, $18, $18, $18, $18,	// Char 073 (I)
        $00, $06, $06, $02, $02, $62, $62, $7E,	// Char 074 (J)
        $00, $46, $46, $4C, $78, $64, $62, $62,	// Char 075 (K)
        $00, $40, $40, $40, $60, $60, $60, $7E,	// Char 076 (L)
        $00, $C6, $EE, $BE, $92, $D2, $C2, $C2,	// Char 077 (M)
        $00, $46, $46, $62, $52, $6A, $66, $62,	// Char 078 (N)
        $00, $7E, $46, $46, $62, $62, $62, $7E,	// Char 079 (O)
        $00, $7E, $46, $46, $7E, $60, $60, $60,	// Char 080 (P)
        $00, $7E, $46, $46, $62, $62, $7E, $1C,	// Char 081 (Q)
        $04, $7E, $46, $46, $7C, $68, $64, $62,	// Char 082 (R)
        $00, $7E, $46, $60, $18, $06, $62, $7E,	// Char 083 (S)
        $00, $7E, $16, $10, $18, $18, $18, $18,	// Char 084 (T)
        $00, $46, $46, $42, $62, $62, $62, $7E,	// Char 085 (U)
        $00, $46, $46, $46, $42, $64, $38, $10,	// Char 086 (V)
        $00, $86, $86, $82, $D2, $FA, $EE, $C6,	// Char 087 (W)
        $00, $86, $86, $4C, $30, $68, $E4, $C2,	// Char 088 (X)
        $00, $46, $46, $42, $3C, $18, $18, $18,	// Char 089 (Y)
        $00, $FE, $06, $08, $10, $20, $C0, $FE,	// Char 090 (Z)
        $00, $78, $60, $60, $60, $60, $60, $78,	// Char 091 ([)
        $00, $C0, $60, $30, $18, $0C, $06, $02,	// Char 092 (\)
        $00, $78, $18, $18, $18, $18, $18, $78,	// Char 093 (])
        $00, $10, $38, $6C, $C6, $00, $00, $00,	// Char 094 (^)
        $00, $00, $00, $00, $00, $00, $00, $00,	// Char 095 (_)
        $FF, $30, $30, $18, $00, $00, $00, $00,	// Char 096 (`)
        $00, $00, $00, $7E, $06, $7E, $62, $7E,	// Char 097 (a)
        $00, $40, $40, $40, $7E, $62, $62, $7E,	// Char 098 (b)
        $00, $00, $00, $7E, $46, $60, $60, $7E,	// Char 099 (c)
        $00, $06, $06, $02, $7E, $62, $62, $7E,	// Char 100 (d)
        $00, $00, $00, $7E, $46, $7E, $60, $7E,	// Char 101 (e)
        $00, $0C, $1C, $20, $78, $60, $60, $60,	// Char 102 (f)
        $00, $00, $00, $7E, $46, $42, $7E, $06,	// Char 103 (g)
        $78, $40, $40, $40, $7E, $62, $62, $62,	// Char 104 (h)
        $00, $10, $00, $10, $10, $18, $18, $18,	// Char 105 (i)
        $00, $0C, $00, $0C, $04, $04, $64, $64,	// Char 106 (j)
        $7C, $40, $40, $46, $4C, $78, $64, $62,	// Char 107 (k)
        $00, $10, $10, $10, $10, $18, $18, $18,	// Char 108 (l)
        $00, $00, $00, $FE, $96, $96, $D2, $D2,	// Char 109 (m)
        $00, $00, $00, $7E, $46, $62, $62, $62,	// Char 110 (n)
        $00, $00, $00, $7E, $46, $62, $62, $7E,	// Char 111 (o)
        $00, $00, $00, $7E, $46, $42, $7E, $60,	// Char 112 (p)
        $60, $00, $00, $7E, $46, $42, $7E, $02,	// Char 113 (q)
        $02, $00, $00, $7E, $46, $60, $60, $60,	// Char 114 (r)
        $00, $00, $00, $7C, $40, $7C, $04, $7C,	// Char 115 (s)
        $00, $10, $10, $3C, $10, $10, $18, $1C,	// Char 116 (t)
        $00, $00, $00, $46, $46, $62, $62, $7E,	// Char 117 (u)
        $00, $00, $00, $46, $46, $66, $34, $18,	// Char 118 (v)
        $00, $00, $00, $86, $96, $D2, $FE, $6C,	// Char 119 (w)
        $00, $00, $00, $46, $2C, $18, $34, $62,	// Char 120 (x)
        $00, $00, $00, $46, $46, $62, $7E, $02,	// Char 121 (y)
        $7C, $00, $00, $7E, $0C, $18, $30, $7E,	// Char 122 (z)
        $00, $1C, $30, $30, $E0, $30, $30, $1C,	// Char 123 ({)
        $00, $18, $18, $18, $00, $18, $18, $18,	// Char 124 (|)
        $00, $E0, $30, $30, $1C, $30, $30, $E0,	// Char 125 (})
        $00, $76, $DC, $00, $00, $00, $00, $00,	// Char 126 (~)
        $00, $00, $10, $38, $6C, $C6, $C6, $FE,	// Char 127 (.)
        $00, $7E, $46, $40, $60, $62, $7E, $0C,	// Char 128 (.)
        $18, $00, $66, $00, $46, $62, $62, $7E,	// Char 129 (.)
        $00, $1C, $00, $7E, $46, $7E, $60, $7E,	// Char 130 (.)
        $00, $3C, $42, $3C, $06, $7E, $62, $7E,	// Char 131 (.)
        $00, $66, $00, $7E, $06, $7E, $62, $7E,	// Char 132 (.)
        $00, $70, $00, $7E, $06, $7E, $62, $7E,	// Char 133 (.)
        $00, $30, $30, $78, $0C, $7C, $CC, $7E,	// Char 134 (.)
        $00, $00, $00, $7E, $46, $60, $7E, $0C,	// Char 135 (.)
        $38, $3C, $42, $3C, $66, $7E, $60, $7E,	// Char 136 (.)
        $00, $66, $00, $7E, $46, $7E, $60, $7E,	// Char 137 (.)
        $00, $70, $00, $7E, $46, $7E, $60, $7E,	// Char 138 (.)
        $00, $66, $00, $10, $10, $18, $18, $18,	// Char 139 (.)
        $00, $38, $44, $10, $10, $18, $18, $18,	// Char 140 (.)
        $00, $60, $00, $10, $10, $18, $18, $18,	// Char 141 (.)
        $00, $C6, $38, $4C, $86, $FE, $C2, $C2,	// Char 142 (.)
        $00, $18, $18, $00, $3C, $46, $7E, $62,	// Char 143 (.)
        $00, $1C, $00, $7E, $42, $78, $60, $7E,	// Char 144 (.)
        $00, $00, $00, $7F, $0C, $7F, $CC, $7F,	// Char 145 (.)
        $00, $3E, $6C, $CC, $FE, $CC, $CC, $CE,	// Char 146 (.)
        $00, $18, $2C, $00, $7E, $46, $62, $7E,	// Char 147 (.)
        $00, $00, $66, $00, $7E, $46, $62, $7E,	// Char 148 (.)
        $00, $00, $70, $00, $7E, $46, $62, $7E,	// Char 149 (.)
        $00, $18, $2C, $00, $46, $46, $62, $7E,	// Char 150 (.)
        $00, $00, $70, $00, $46, $46, $62, $7E,	// Char 151 (.)
        $00, $00, $6E, $00, $46, $66, $7E, $02,	// Char 152 (.)
        $7C, $C3, $3C, $46, $46, $62, $62, $7E,	// Char 153 (.)
        $00, $66, $00, $46, $46, $62, $62, $7E,	// Char 154 (.)
        $00, $18, $18, $7E, $C0, $C0, $7E, $18,	// Char 155 (.)
        $18, $38, $6C, $64, $F0, $60, $E6, $FC,	// Char 156 (.)
        $00, $CC, $CC, $78, $FC, $30, $FC, $30,	// Char 157 (.)
        $30, $F8, $CC, $CC, $FA, $C6, $CF, $C6,	// Char 158 (.)
        $C7, $0E, $1B, $18, $3C, $18, $18, $D8,	// Char 159 (.)
        $70, $0E, $00, $7E, $06, $7E, $62, $7E,	// Char 160 (.)
        $00, $1C, $00, $20, $20, $30, $30, $30,	// Char 161 (.)
        $00, $00, $0E, $00, $7E, $46, $62, $7E,	// Char 162 (.)
        $00, $00, $0E, $00, $46, $46, $62, $7E,	// Char 163 (.)
        $00, $32, $4C, $00, $7E, $46, $62, $62,	// Char 164 (.)
        $00, $7E, $00, $46, $66, $72, $6A, $66,	// Char 165 (.)
        $00, $3C, $0C, $3C, $3C, $00, $3C, $00,	// Char 166 (.)
        $00, $3C, $24, $34, $3C, $00, $3C, $00,	// Char 167 (.)
        $00, $30, $00, $30, $60, $C0, $CC, $78,	// Char 168 (.)
        $00, $00, $00, $00, $FC, $C0, $C0, $00,	// Char 169 (.)
        $00, $00, $00, $00, $FC, $0C, $0C, $00,	// Char 170 (.)
        $00, $C3, $C6, $CC, $DE, $33, $66, $CC,	// Char 171 (.)
        $0F, $C3, $C6, $CC, $DB, $37, $6F, $CF,	// Char 172 (.)
        $03, $18, $18, $00, $18, $18, $18, $18,	// Char 173 (.)
        $00, $00, $33, $66, $CC, $66, $33, $00,	// Char 174 (.)
        $00, $00, $CC, $66, $33, $66, $CC, $00,	// Char 175 (.)
        $00, $22, $88, $22, $88, $22, $88, $22,	// Char 176 (.)
        $88, $55, $AA, $55, $AA, $55, $AA, $55,	// Char 177 (.)
        $AA, $DB, $77, $DB, $EE, $DB, $77, $DB,	// Char 178 (.)
        $EE, $18, $18, $18, $18, $18, $18, $18,	// Char 179 (.)
        $18, $18, $18, $18, $18, $F8, $18, $18,	// Char 180 (.)
        $18, $18, $18, $F8, $18, $F8, $18, $18,	// Char 181 (.)
        $18, $36, $36, $36, $36, $F6, $36, $36,	// Char 182 (.)
        $36, $00, $00, $00, $00, $FE, $36, $36,	// Char 183 (.)
        $36, $00, $00, $F8, $18, $F8, $18, $18,	// Char 184 (.)
        $18, $36, $36, $F6, $06, $F6, $36, $36,	// Char 185 (.)
        $36, $36, $36, $36, $36, $36, $36, $36,	// Char 186 (.)
        $36, $00, $00, $FE, $06, $F6, $36, $36,	// Char 187 (.)
        $36, $36, $36, $F6, $06, $FE, $00, $00,	// Char 188 (.)
        $00, $36, $36, $36, $36, $FE, $00, $00,	// Char 189 (.)
        $00, $18, $18, $F8, $18, $F8, $00, $00,	// Char 190 (.)
        $00, $00, $00, $00, $00, $F8, $18, $18,	// Char 191 (.)
        $18, $18, $18, $18, $18, $1F, $00, $00,	// Char 192 (.)
        $00, $18, $18, $18, $18, $FF, $00, $00,	// Char 193 (.)
        $00, $00, $00, $00, $00, $FF, $18, $18,	// Char 194 (.)
        $18, $18, $18, $18, $18, $1F, $18, $18,	// Char 195 (.)
        $18, $00, $00, $00, $00, $FF, $00, $00,	// Char 196 (.)
        $00, $18, $18, $18, $18, $FF, $18, $18,	// Char 197 (.)
        $18, $18, $18, $1F, $18, $1F, $18, $18,	// Char 198 (.)
        $18, $36, $36, $36, $36, $37, $36, $36,	// Char 199 (.)
        $36, $36, $36, $37, $30, $3F, $00, $00,	// Char 200 (.)
        $00, $00, $00, $3F, $30, $37, $36, $36,	// Char 201 (.)
        $36, $36, $36, $F7, $00, $FF, $00, $00,	// Char 202 (.)
        $00, $00, $00, $FF, $00, $F7, $36, $36,	// Char 203 (.)
        $36, $36, $36, $37, $30, $37, $36, $36,	// Char 204 (.)
        $36, $00, $00, $FF, $00, $FF, $00, $00,	// Char 205 (.)
        $00, $36, $36, $F7, $00, $F7, $36, $36,	// Char 206 (.)
        $36, $18, $18, $FF, $00, $FF, $00, $00,	// Char 207 (.)
        $00, $36, $36, $36, $36, $FF, $00, $00,	// Char 208 (.)
        $00, $00, $00, $FF, $00, $FF, $18, $18,	// Char 209 (.)
        $18, $00, $00, $00, $00, $FF, $36, $36,	// Char 210 (.)
        $36, $36, $36, $36, $36, $3F, $00, $00,	// Char 211 (.)
        $00, $18, $18, $1F, $18, $1F, $00, $00,	// Char 212 (.)
        $00, $00, $00, $1F, $18, $1F, $18, $18,	// Char 213 (.)
        $18, $00, $00, $00, $00, $3F, $36, $36,	// Char 214 (.)
        $36, $36, $36, $36, $36, $FF, $36, $36,	// Char 215 (.)
        $36, $18, $18, $FF, $18, $FF, $18, $18,	// Char 216 (.)
        $18, $18, $18, $18, $18, $F8, $00, $00,	// Char 217 (.)
        $00, $00, $00, $00, $00, $1F, $18, $18,	// Char 218 (.)
        $18, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	// Char 219 (.)
        $FF, $00, $00, $00, $00, $FF, $FF, $FF,	// Char 220 (.)
        $FF, $F0, $F0, $F0, $F0, $F0, $F0, $F0,	// Char 221 (.)
        $F0, $0F, $0F, $0F, $0F, $0F, $0F, $0F,	// Char 222 (.)
        $0F, $FF, $FF, $FF, $FF, $00, $00, $00,	// Char 223 (.)
        $00, $00, $00, $76, $DC, $C8, $DC, $76,	// Char 224 (.)
        $00, $00, $78, $CC, $F8, $CC, $F8, $C0,	// Char 225 (.)
        $C0, $00, $FC, $CC, $C0, $C0, $C0, $C0,	// Char 226 (.)
        $00, $00, $FE, $6C, $6C, $6C, $6C, $6C,	// Char 227 (.)
        $00, $FC, $CC, $60, $30, $60, $CC, $FC,	// Char 228 (.)
        $00, $00, $00, $7E, $D8, $D8, $D8, $70,	// Char 229 (.)
        $00, $00, $66, $66, $66, $66, $7C, $60,	// Char 230 (.)
        $C0, $00, $76, $DC, $18, $18, $18, $18,	// Char 231 (.)
        $00, $FC, $30, $78, $CC, $CC, $78, $30,	// Char 232 (.)
        $FC, $38, $6C, $C6, $FE, $C6, $6C, $38,	// Char 233 (.)
        $00, $38, $6C, $C6, $C6, $6C, $6C, $EE,	// Char 234 (.)
        $00, $1C, $30, $18, $7C, $CC, $CC, $78,	// Char 235 (.)
        $00, $00, $00, $7E, $DB, $DB, $7E, $00,	// Char 236 (.)
        $00, $06, $0C, $7E, $DB, $DB, $7E, $60,	// Char 237 (.)
        $C0, $38, $60, $C0, $F8, $C0, $60, $38,	// Char 238 (.)
        $00, $78, $CC, $CC, $CC, $CC, $CC, $CC,	// Char 239 (.)
        $00, $00, $FC, $00, $FC, $00, $FC, $00,	// Char 240 (.)
        $00, $30, $30, $FC, $30, $30, $00, $FC,	// Char 241 (.)
        $00, $60, $30, $18, $30, $60, $00, $FC,	// Char 242 (.)
        $00, $18, $30, $60, $30, $18, $00, $FC,	// Char 243 (.)
        $00, $0E, $1B, $1B, $18, $18, $18, $18,	// Char 244 (.)
        $18, $18, $18, $18, $18, $18, $D8, $D8,	// Char 245 (.)
        $70, $30, $30, $00, $FC, $00, $30, $30,	// Char 246 (.)
        $00, $00, $76, $DC, $00, $76, $DC, $00,	// Char 247 (.)
        $00, $38, $6C, $6C, $38, $00, $00, $00,	// Char 248 (.)
        $00, $00, $00, $00, $18, $18, $00, $00,	// Char 249 (.)
        $00, $00, $00, $00, $00, $18, $00, $00,	// Char 250 (.)
        $00, $0F, $0C, $0C, $0C, $EC, $6C, $3C,	// Char 251 (.)
        $1C, $78, $6C, $6C, $6C, $6C, $00, $00,	// Char 252 (.)
        $00, $70, $18, $30, $60, $78, $00, $00,	// Char 253 (.)
        $00, $00, $00, $3C, $3C, $3C, $3C, $00,	// Char 254 (.)
        $00, $00, $00, $00, $00, $00, $00, $00	// Char 255 (.)
    ];

begin
    write(X16_ISO_ON);
    writeln('press any key to continue');
    repeat until keypressed;

    TextCharset(@newfont);
    writeln;
    writeln('printable characters $00 - $7f');
    writeln;
    j:=1;
    for i:=$00 to $7f do begin
        write(HexStr(i,2),':');
        write(X16_VERBATIM_MODE);
        write(chr(i));
        write(' ');
        inc(j);
        if (j>10) then begin
            writeln;
            j:=1;
        end;
    end;
    
    writeln;
    writeln;
    writeln('printable characters $80 - $ff');
    writeln;
    j:=1;
    for i:=$80 to $ff do begin
        write(HexStr(i,2));
        write(':');
        // write(X16_REVERSE_ON);
        write(X16_VERBATIM_MODE);
        write(chr(i));
        // write(X16_REVERSE_OFF);
        write(' ');
        inc(j);
        if (j>10) then begin
            writeln;
            j:=1;
        end;
    end;
    repeat until keypressed;
end.
