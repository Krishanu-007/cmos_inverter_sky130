v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 480 -160 520 -160 {lab=Vout}
N 520 -160 520 -140 {lab=Vout}
N 100 -80 140 -80 {lab=GND}
N 100 -80 100 -60 {lab=GND}
N 70 -80 100 -80 {lab=GND}
C {inv.sym} 200 50 0 0 {name=x1}
C {vsource.sym} 70 -110 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} 140 -110 0 0 {name=Vin value="PULSE(0 1.8 0 500ps 500ps 4ns 10ns)" savecurrent=false}
C {capa.sym} 520 -110 0 0 {name=C1
m=1
value=50f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 70 -140 0 0 {name=p1 sig_type=std_logic lab=Vdd
}
C {gnd.sym} 420 -120 0 0 {name=l1 lab=GND}
C {gnd.sym} 520 -80 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 430 -200 1 0 {name=p2 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} 360 -160 0 0 {name=p3 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} 140 -140 2 0 {name=p4 sig_type=std_logic lab=Vin
}
C {lab_pin.sym} 520 -160 2 0 {name=p5 sig_type=std_logic lab=Vout
}
C {gnd.sym} 100 -60 0 0 {name=l3 lab=GND}
C {code_shown.sym} 20 -350 0 0 {name=Power_Analysis only_toplevel=false value=".lib /usr/local/share/pdk/sky130B/libs.tech/ngspice/sky130.lib.spice tt
.tran 100ps 30ns
.save all
.end"}
