v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
C {inv.sym} 10 -10 0 0 {name=x1}
C {vsource.sym} 430 -110 0 0 {name=V1 value=1.8 savecurrent=false}
C {lab_pin.sym} 430 -140 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {gnd.sym} 230 -180 0 0 {name=l1 lab=GND}
C {vsource.sym} 490 -110 0 0 {name=Vin value=0 savecurrent=false}
C {gnd.sym} 430 -80 0 0 {name=l2 lab=GND}
C {gnd.sym} 490 -80 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 240 -260 1 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 490 -140 2 0 {name=p3 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 170 -220 0 0 {name=p4 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 290 -220 2 0 {name=p5 sig_type=std_logic lab=Vout}
C {code_shown.sym} 220 -390 0 0 {name=Noise_VTC only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.dc Vin 0 1.8 1m
.save all
.end"}
