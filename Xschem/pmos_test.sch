v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 290 -270 290 -230 {lab=#net1}
N 420 -170 420 -150 {lab=Vout}
N 420 -100 420 -90 {lab=GND}
N 290 -170 420 -170 {lab=Vout}
N 290 -90 420 -90 {lab=GND}
N 290 -110 290 -90 {lab=GND}
N 660 -100 660 -80 {lab=GND}
N 660 -80 690 -80 {lab=GND}
N 690 -80 720 -80 {lab=GND}
N 720 -100 720 -80 {lab=GND}
C {sky130_fd_pr/pfet3_01v8.sym} 270 -200 0 0 {name=M1
W=1
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
C {res.sym} 290 -300 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} 420 -130 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 660 -130 0 0 {name=V1 value=1.8 savecurrent=false}
C {vsource.sym} 720 -130 0 0 {name=V2 value=pulse(0 1.8 0 500ps 500ps 4ns 10ns) savecurrent=false}
C {res.sym} 290 -140 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 290 -90 0 0 {name=l1 lab=GND}
C {gnd.sym} 690 -80 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 660 -160 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 720 -160 0 1 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 250 -200 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 290 -330 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 420 -170 0 1 {name=p5 sig_type=std_logic lab=Vout}
C {code_shown.sym} 310 -420 0 0 {name=Strong_1_Weak_0 only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.tran 100ps 12ns
.save all
.end"}
