v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -160 170 -140 {lab=Vout}
N 130 -160 130 -110 {lab=Vin}
N 130 -220 130 -160 {lab=Vin}
N 170 -190 170 -160 {lab=Vout}
N 80 -160 130 -160 {lab=Vin}
N 170 -160 240 -160 {lab=Vout}
N 170 -80 170 -50 {lab=Vss}
N 170 -280 170 -250 {lab=Vdd}
C {sky130_fd_pr/nfet3_01v8.sym} 150 -110 0 0 {name=M1
W=1
L=0.15
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 150 -220 0 0 {name=M2
W=2.5
L=0.15
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 80 -160 0 0 {name=p1 lab=Vin}
C {ipin.sym} 170 -50 3 0 {name=p2 lab=Vss}
C {ipin.sym} 170 -280 1 0 {name=p4 lab=Vdd}
C {opin.sym} 240 -160 0 0 {name=p5 lab=Vout}
