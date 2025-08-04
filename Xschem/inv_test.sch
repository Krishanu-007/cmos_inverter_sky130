v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 530 -30 570 -30 {lab=GND}
N 530 -30 530 -20 {lab=GND}
N 490 -30 530 -30 {lab=GND}
N 90 -140 120 -140 {lab=Vin}
N 190 -210 190 -180 {lab=Vdd}
N 240 -140 270 -140 {lab=Vout}
N 490 -110 490 -90 {lab=Vin}
N 570 -110 570 -90 {lab=Vdd}
C {inv.sym} -40 70 0 0 {name=x1}
C {vsource.sym} 490 -60 0 0 {name=vin value=0 savecurrent=false}
C {vsource.sym} 570 -60 0 0 {name=vdd value=1.8 savecurrent=false}
C {gnd.sym} 530 -20 0 0 {name=l1 lab=GND}
C {gnd.sym} 180 -100 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 270 -140 2 0 {name=p1 sig_type=std_logic lab=Vout}
C {code_shown.sym} 270 -330 0 0 {name=VTC only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.dc vin 0 1.8 1m
.save all
.end"}
C {lab_pin.sym} 90 -140 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 190 -210 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 490 -110 0 0 {name=p4 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 570 -110 2 0 {name=p5 sig_type=std_logic lab=Vdd}
