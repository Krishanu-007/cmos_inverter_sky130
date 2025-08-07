v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 80 -120 160 -120 {lab=GND}
N 120 -120 120 -100 {lab=GND}
C {inv.sym} 280 0 0 0 {name=x1}
C {vsource.sym} 80 -150 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} 160 -150 0 0 {name=Vin value="PULSE(0 1.8 0 500ps 500ps 4ns 8ns)" savecurrent=false}
C {gnd.sym} 500 -170 0 0 {name=l1 lab=GND}
C {gnd.sym} 120 -100 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 80 -180 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 160 -180 2 0 {name=p2 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 510 -250 1 0 {name=p3 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 440 -210 0 0 {name=p4 sig_type=std_logic lab=Vin}
C {lab_pin.sym} 560 -210 2 0 {name=p5 sig_type=std_logic lab=Vout}
C {code_shown.sym} 40 -410 0 0 {name=Delay_Analysis only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.tran 100ps 20ns
.save all
.end"}
