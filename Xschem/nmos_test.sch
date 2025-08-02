v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -220 160 -170 {lab=Vout}
N 160 -190 290 -190 {lab=Vout}
N 290 -190 290 -120 {lab=Vout}
N 160 -110 160 -20 {lab=GND}
N 160 -20 190 -20 {lab=GND}
N 290 -60 290 -20 {lab=GND}
N 190 -20 290 -20 {lab=GND}
N 460 -60 460 -40 {lab=GND}
N 520 -60 520 -40 {lab=GND}
N 460 -40 490 -40 {lab=GND}
N 490 -40 520 -40 {lab=GND}
C {sky130_fd_pr/nfet3_01v8.sym} 140 -140 0 0 {name=M1
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
C {res.sym} 160 -250 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 290 -90 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 190 -20 0 0 {name=l1 lab=GND}
C {vsource.sym} 460 -90 0 1 {name=V1 value=pulse(0 1.8 0 500ps 500ps 4ns 10ns) savecurrent=false}
C {vsource.sym} 520 -90 0 0 {name=V2 value=1.8 savecurrent=false}
C {lab_pin.sym} 460 -120 0 0 {name=p1 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} 520 -120 0 0 {name=p2 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} 120 -140 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 160 -280 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 290 -190 2 0 {name=p5 sig_type=std_logic lab=Vout
}
C {gnd.sym} 490 -40 0 0 {name=l2 lab=GND}
C {code_shown.sym} 30 -410 0 0 {name=Strong_0_Weak_1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.tran 100ps 12ns
.save all
.end"}
