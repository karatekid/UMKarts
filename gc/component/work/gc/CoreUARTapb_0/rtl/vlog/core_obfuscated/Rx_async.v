// Actel Corporation Proprietary and Confidential
//  Copyright 2008 Actel Corporation.  All rights reserved.
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//  Revision Information:
// Jun09    Revision 4.1
// Aug10    Revision 4.2
// SVN Revision Information:
// SVN $Revision: 8508 $
// SVN $Date: 2009-06-15 16:49:49 -0700 (Mon, 15 Jun 2009) $
`timescale 1ns/1ns
module
gc_CoreUARTapb_0_Rx_async
(
CUARTII
,
CUARTIl
,
CUARTlI
,
CUARTlO1
,
CUARTOI1
,
CUARTII1
,
CUARTI1I
,
CUARTO0l
,
CUARTO01
,
CUARTI01
,
CUARTl01
,
CUARTl0l
,
CUARTOlI
,
CUARTOOl
,
CUARTllI
,
CUARTll1
,
CUARTI0l
,
CUARTl1l
,
CUARTll0
,
CUARTO00
)
;
parameter
RX_FIFO
=
0
;
input
CUARTII
;
input
CUARTIl
;
input
CUARTlI
;
input
CUARTlO1
;
input
CUARTOI1
;
input
CUARTII1
;
input
CUARTI1I
;
input
CUARTO0l
;
input
CUARTI0l
;
input
CUARTO01
;
output
CUARTI01
;
output
CUARTl01
;
output
CUARTl0l
;
output
CUARTOlI
;
output
[
7
:
0
]
CUARTOOl
;
output
CUARTllI
;
output
CUARTll1
;
output
CUARTl1l
;
output
CUARTll0
;
output
CUARTO00
;
reg
CUARTll1
;
reg
CUARTll0
;
reg
CUARTI01
;
reg
CUARTl01
;
reg
CUARTllI
;
wire
CUARTOlI
;
reg
[
7
:
0
]
CUARTOOl
;
reg
[
1
:
0
]
CUARTOl0
;
reg
[
3
:
0
]
CUARTl0Ol
;
reg
CUARTO1Ol
;
reg
[
8
:
0
]
CUARTI1Ol
;
reg
CUARTl1Ol
;
reg
[
3
:
0
]
CUARTOOIl
;
reg
CUARTIOIl
;
reg
[
2
:
0
]
CUARTlOIl
;
reg
CUARTOIIl
;
reg
CUARTIIIl
;
reg
CUARTl0l
;
reg
CUARTl1l
;
wire
[
1
:
0
]
CUARTlIIl
;
wire
[
1
:
0
]
CUARTOlIl
;
wire
[
3
:
0
]
CUARTIlIl
;
parameter
CUARTllIl
=
0
;
parameter
CUARTO0Il
=
1
;
parameter
CUARTI0Il
=
2
;
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTl0Il
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTlOIl
<=
3
'b
000
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
CUARTlOIl
[
1
:
0
]
<=
CUARTlOIl
[
2
:
1
]
;
CUARTlOIl
[
2
]
<=
CUARTO01
;
end
end
end
always
@
(
CUARTlOIl
)
begin
case
(
CUARTlOIl
)
3
'b
000
:
begin
CUARTO1Ol
<=
1
'b
0
;
end
3
'b
001
:
begin
CUARTO1Ol
<=
1
'b
0
;
end
3
'b
010
:
begin
CUARTO1Ol
<=
1
'b
0
;
end
3
'b
011
:
begin
CUARTO1Ol
<=
1
'b
1
;
end
3
'b
100
:
begin
CUARTO1Ol
<=
1
'b
0
;
end
3
'b
101
:
begin
CUARTO1Ol
<=
1
'b
1
;
end
3
'b
110
:
begin
CUARTO1Ol
<=
1
'b
1
;
end
default
:
begin
CUARTO1Ol
<=
1
'b
1
;
end
endcase
end
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTO1Il
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTl0Ol
<=
4
'b
0000
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTOl0
==
CUARTllIl
&
(
CUARTO1Ol
==
1
'b
1
|
CUARTl0Ol
==
4
'b
1000
)
)
begin
CUARTl0Ol
<=
4
'b
0000
;
end
else
begin
CUARTl0Ol
<=
CUARTl0Ol
+
1
'b
1
;
end
end
end
end
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTI1Il
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTI01
<=
1
'b
0
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTOIIl
==
1
'b
1
)
begin
CUARTI01
<=
1
'b
1
;
end
end
if
(
CUARTI1I
==
1
'b
1
)
begin
CUARTI01
<=
1
'b
0
;
end
end
end
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTl1Il
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTll1
<=
1
'b
0
;
end
else
if
(
CUARTI0l
==
1
'b
1
)
begin
CUARTll1
<=
1
'b
0
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTIIIl
==
1
'b
1
)
begin
CUARTll1
<=
1
'b
1
;
end
end
else
begin
CUARTll1
<=
CUARTll1
;
end
end
end
assign
CUARTIlIl
=
CUARTlO1
==
1
'b
0
&
CUARTOI1
==
1
'b
0
?
4
'b
0111
:
CUARTlO1
==
1
'b
0
&
CUARTOI1
==
1
'b
1
?
4
'b
1000
:
CUARTlO1
==
1
'b
1
&
CUARTOI1
==
1
'b
0
?
4
'b
1000
:
4
'b
1001
;
assign
CUARTO00
=
(
CUARTOl0
==
CUARTllIl
)
;
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTOOll
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTOl0
<=
CUARTllIl
;
CUARTOOl
<=
8
'b
00000000
;
CUARTOIIl
<=
1
'b
0
;
CUARTIIIl
<=
1
'b
0
;
CUARTll0
<=
1
'b
0
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
CUARTOIIl
<=
1
'b
0
;
CUARTll0
<=
1
'b
0
;
CUARTIIIl
<=
1
'b
0
;
case
(
CUARTOl0
)
CUARTllIl
:
begin
if
(
CUARTl0Ol
==
4
'b
1000
)
begin
CUARTOl0
<=
CUARTO0Il
;
end
else
begin
CUARTOl0
<=
CUARTllIl
;
end
end
CUARTO0Il
:
begin
if
(
CUARTOOIl
==
CUARTIlIl
)
begin
CUARTOl0
<=
CUARTI0Il
;
CUARTOIIl
<=
CUARTIOIl
;
if
(
CUARTIOIl
==
1
'b
0
)
begin
CUARTOOl
<=
{
(
CUARTlO1
&
CUARTI1Ol
[
7
]
)
,
CUARTI1Ol
[
6
:
0
]
}
;
end
end
else
begin
CUARTOl0
<=
CUARTO0Il
;
end
end
CUARTI0Il
:
begin
if
(
CUARTl0Ol
==
4
'b
1110
)
begin
if
(
CUARTO1Ol
==
1
'b
0
)
begin
CUARTIIIl
<=
1
'b
1
;
end
end
else
if
(
CUARTl0Ol
==
4
'b
1111
)
begin
CUARTll0
<=
1
'b
1
;
CUARTOl0
<=
CUARTllIl
;
end
else
begin
CUARTOl0
<=
CUARTI0Il
;
end
end
default
:
begin
CUARTOl0
<=
CUARTllIl
;
end
endcase
end
end
end
assign
CUARTlIIl
=
{
CUARTlO1
,
CUARTOI1
}
;
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTIOll
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTI1Ol
[
8
:
0
]
<=
9
'b
000000000
;
CUARTOOIl
<=
4
'b
0000
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTOl0
==
CUARTllIl
)
begin
CUARTI1Ol
[
8
:
0
]
<=
9
'b
000000000
;
CUARTOOIl
<=
4
'b
0000
;
end
else
if
(
CUARTl0Ol
==
4
'b
1111
)
begin
CUARTOOIl
<=
CUARTOOIl
+
1
'b
1
;
case
(
CUARTlIIl
)
2
'b
00
:
begin
CUARTI1Ol
[
5
:
0
]
<=
CUARTI1Ol
[
6
:
1
]
;
CUARTI1Ol
[
6
]
<=
CUARTO1Ol
;
end
2
'b
11
:
begin
CUARTI1Ol
[
7
:
0
]
<=
CUARTI1Ol
[
8
:
1
]
;
CUARTI1Ol
[
8
]
<=
CUARTO1Ol
;
end
default
:
begin
CUARTI1Ol
[
6
:
0
]
<=
CUARTI1Ol
[
7
:
1
]
;
CUARTI1Ol
[
7
]
<=
CUARTO1Ol
;
end
endcase
end
end
end
end
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTlOll
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTl1Ol
<=
1
'b
0
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTl0Ol
==
4
'b
1111
&
CUARTOI1
==
1
'b
1
)
begin
CUARTl1Ol
<=
CUARTl1Ol
^
CUARTO1Ol
;
end
if
(
CUARTOl0
==
CUARTI0Il
)
begin
CUARTl1Ol
<=
1
'b
0
;
end
end
end
end
assign
CUARTOlIl
=
{
CUARTlO1
,
CUARTII1
}
;
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTOIll
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTl01
<=
1
'b
0
;
end
else
begin
if
(
CUARTIl
==
1
'b
1
&
CUARTOI1
==
1
'b
1
&
CUARTl0Ol
==
4
'b
1111
)
begin
case
(
CUARTOlIl
)
2
'b
00
:
begin
if
(
CUARTOOIl
==
4
'b
0111
)
begin
CUARTl01
<=
CUARTl1Ol
^
CUARTO1Ol
;
end
end
2
'b
01
:
begin
if
(
CUARTOOIl
==
4
'b
0111
)
begin
CUARTl01
<=
~
(
CUARTl1Ol
^
CUARTO1Ol
)
;
end
end
2
'b
10
:
begin
if
(
CUARTOOIl
==
4
'b
1000
)
begin
CUARTl01
<=
CUARTl1Ol
^
CUARTO1Ol
;
end
end
2
'b
11
:
begin
if
(
CUARTOOIl
==
4
'b
1000
)
begin
CUARTl01
<=
~
(
CUARTl1Ol
^
CUARTO1Ol
)
;
end
end
default
:
begin
CUARTl01
<=
1
'b
0
;
end
endcase
end
if
(
CUARTO0l
==
1
'b
1
)
begin
CUARTl01
<=
1
'b
0
;
end
end
end
always
@
(
posedge
CUARTII
or
negedge
CUARTlI
)
begin
:
CUARTIIll
if
(
CUARTlI
==
1
'b
0
)
begin
CUARTIOIl
<=
1
'b
0
;
CUARTllI
<=
1
'b
1
;
CUARTl0l
<=
1
'b
0
;
CUARTl1l
<=
1
'b
0
;
end
else
begin
CUARTllI
<=
1
'b
1
;
CUARTl0l
<=
1
'b
0
;
CUARTl1l
<=
1
'b
0
;
if
(
CUARTIl
==
1
'b
1
)
begin
if
(
CUARTlO1
==
1
'b
1
)
begin
if
(
CUARTOI1
==
1
'b
1
)
begin
if
(
CUARTOOIl
==
4
'b
1001
&
CUARTOl0
==
CUARTO0Il
)
begin
CUARTllI
<=
1
'b
0
;
CUARTl0l
<=
1
'b
1
;
CUARTl1l
<=
1
'b
1
;
if
(
RX_FIFO
==
1
'b
0
)
begin
CUARTIOIl
<=
1
'b
1
;
end
end
end
else
begin
if
(
CUARTOOIl
==
4
'b
1000
&
CUARTOl0
==
CUARTO0Il
)
begin
CUARTllI
<=
1
'b
0
;
CUARTl0l
<=
1
'b
1
;
CUARTl1l
<=
1
'b
1
;
if
(
RX_FIFO
==
1
'b
0
)
begin
CUARTIOIl
<=
1
'b
1
;
end
end
end
end
else
begin
if
(
CUARTOI1
==
1
'b
1
)
begin
if
(
CUARTOOIl
==
4
'b
1000
&
CUARTOl0
==
CUARTO0Il
)
begin
CUARTllI
<=
1
'b
0
;
CUARTl0l
<=
1
'b
1
;
CUARTl1l
<=
1
'b
1
;
if
(
RX_FIFO
==
1
'b
0
)
begin
CUARTIOIl
<=
1
'b
1
;
end
end
end
else
begin
if
(
CUARTOOIl
==
4
'b
0111
&
CUARTOl0
==
CUARTO0Il
)
begin
CUARTllI
<=
1
'b
0
;
CUARTl0l
<=
1
'b
1
;
CUARTl1l
<=
1
'b
1
;
if
(
RX_FIFO
==
1
'b
0
)
begin
CUARTIOIl
<=
1
'b
1
;
end
end
end
end
end
if
(
CUARTI1I
==
1
'b
1
)
begin
CUARTIOIl
<=
1
'b
0
;
end
end
end
assign
CUARTOlI
=
CUARTIOIl
;
endmodule
