
# Design and analysis of CMOS inverter using Sky130 pdk


![Logo](Images/LOGO.png)


Welcome to the **CMOS Inverter Design** project using the open-source **SKY130 PDK**!  

This repository showcases the complete workflow for designing, simulating, and (soon) laying out a CMOS inverter along with a detailed pre-layout and post-layput analysis.

The entire operation is done by using the standard `1.8v nfet` and `1.8v pfet`. However I have used the latest iteration of the pdk `sky130B` for the entire project.


## 📚 Contents

| Section | Description |
|--------|-------------|
| [Design and analysis of CMOS inverter using Sky130 pdk](#design-and-analysis-of-cmos-inverter-using-sky130-pdk) | Introduction and overview |
| [Getting Started](#getting-started) | How to clone the repo, install tools, and run simulations |
| [Pre-Layout Analysis](#pre-layout-analysis) | Signal strength behavior of individual NMOS and PMOS |
| [CMOS Inverter Design](#cmos-inverter-design) | Why CMOS is used and how an inverter is formed |
| [Idea of Inverter](#idea-of-inverter) | Logic explanation of the NOT gate and its importance |
| [CMOS VTC analysis](#cmos-vtc-analysis) | VTC plot, threshold voltage, and schematic/simulation |
| [CMOS Noise Analysis](#cmos-noise-analysis) | Noise margin extraction and gain curve |



## Progress 

| Jobs             | Status                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Transistor Analysis| ✅ Completed   |
| Schematic Design | ✅ Completed   |
| Layout Design | ⏳ To be done |
| Layout vs Schematic(LVS) | ⏳ To be done |




## Getting Started

To get a hands-on on this project:

```bash
  git clone https://github.com/Krishanu-007/cmos_inverter_sky130.git
  cd cmos_inverter_sky130
```
Ensure to have all the necessary tools:
```bash
 Xschem
 Ngspice
 Magic VLSI
 Netgen
 ```
 To install all the tools please refer to my another repository named: [transistor_analysis_sky130](https://github.com/Krishanu-007/transistor_analysis_sky130)

**Open the schematic**:  
- Launch Xschem and open the `inv.sch` file located in the `Xschem` directory. This file contains the schematic of the CMOS inverter.
- You can view the symbolic representation of the inverter by opening the `inv.sym` file in the same directory.
- The resulting test bench schematic is available in the `inv_test.sch` file.

**Run simulations**:
- first, ensure Ngspice is installed and configured correctly.
- On the schematic editor press `shift+a` to activate the netlist viewer
- Click on `Netlist` Icon then save the netlist, I have saved it in the `Simulation` directory with the corresponding name i.e. `inv_test` folder.
- As the simulation is done you can view the results by following the necessary steps in Ngspice.

**Layout and LVS (future work)**:
- The layout design is to be done in future. Once completed, the layout will be able to open in Magic VLSI.
- After the layout is created, you can run LVS using Netgen to verify that the layout matches the schematic.

I have created a seperate schematic for every analysis and test, however the basic circuit remains the same .i.e. `inv.sym`


## Pre-Layout Analysis

The starting of the pre-layout analysis starts by testing the feasibility of signal transmission by both mosfets- `nfet` and `pfet`. These are the basics that are needed.

### *Strong '0's and Weak '1's*:
In the below figure, the NMOS transistor is used to transmit both '0'(LOW) and '1'(HIGH) signals. As it can be seen that for '0' signal, the NMOS transistor is fully on, allowing a strong '0' to be transmitted. However, '1' signal the out response is not what is expected. You can see that, when a square wave is applied to the input of NMOS, when it is `LOW(0V)`, the output goes to `HIGH(1.8V)`. But when the input is `HIGH(1.8V)`, the output goes to a value that is much `larger than 0V`. This is due to the fact that when `Vgs is 1.8V`, the NMOS is in `linear region`. This is where the MOSFET acts as a voltage controlled resistor. At this point, the output is connected to a Voltage Divider Configuration. That is the output takes the value which is defined by the voltage across the resistance of the mosfet. Hence, NMOS is able to transmit Strong '0', but not a Strong '1'.

**Schematic**:
<p align="center">
  <img src="Images/nmos/nmos_test.png" alt="NMOS_Schem" width="600"/>
</p>

**Sim_Window and Sim_Graph**:

<p align="center">
  <img src="Images/nmos/nmos_test_sim_windw.png" alt="NMOS_Commn" width="400"/>
  <img src="Images/nmos/nmos_test_grph.png" alt="NMOS_Graph" width="500"/>
</p>

### *Strong '1's and Weak '0's*:
The same explanation applies for PMOS, with the necessary changes. The test schematic and graph are shown below:

**Schematic**:

<p align="center">
  <img src="Images/pmos/pmos_test.png" alt="PMOS_Schem" width="600"/>
</p>

**Sim_Window and Sim_Graph**:
<p align="center">
  <img src="Images/pmos/pmos_test_sim_windw.png" alt="PMOS_Commn" width="400"/>
  <img src="Images/pmos/pmos_test_grph.png" alt="PMOS_Graph" width="525"/>
</p>

## CMOS Inverter Design

### Why CMOS circuits?

 An interesting obseration was made in the previous section, where we realised that neither NMOS nor PMOS can be used for design that can produce either values, HIGH and LOW. But another thing that is worth notice is how they complement each other. This is what gave rise to an idea of attaching them together. Since, PMOS is a Strong 1, we put it between VDD and Vout and NMOS being a STRONG 0, it is placed between Vout and GND. This way, either can act as a load to the other transistor, since both are never ON together (Are they?). The configuration looks like what we have below. This is referred to as Complimentary Metal Oxide Semiconductor(CMOS) Configuration and it also represents the simplest circuit known as the CMOS Inverter.

 CMOS Circuits generally consists of a network split into two parts, Upper one referred to as a pull up network and the lower half as a pull down network. The former consists of P-channel MOSFETs and later N-Channel MOSFETs. Reason is simple. As one transistor is one, another is off. This eliminates the issue of an resistive path to the ground and hence, no voltage division occurs(At least not a significant one). This way, one can easily achieve a Strong High and a Strong LOW from the same network. PULL UP is what offers a low resistance path to the VDD and PULL DOWN is what offers a low resistance path the GND.

 **CMOS Network**:

 <p align="center">
  <img src="Images/cmos_placeholder.png" alt="CMOS_Schematic" width="600"/>
</p>

### Idea of Inverter:
Before, I start with the CMOS inverter, I believe it is worth mentioning what an Inverter is. Inverter is something that inverts. In electronics it is very popularly explained as something that performs the NOT logic, that is complements the input. So a HIGH(1.8V) becomes LOW(0V) and vice versa. Ideally, the output follows the input and there is no delay or propogation issues of the circuit. But in reality, an inverter can be a real piece of work. It can have serveral issues like how fast can it react to the changes in the input, how much load can it tolerate before it's output breaks and so many more including noise, bandwidth, etc.

All these parameters are what will always plague any analog design or design with transistor in general. Hence, with inverter many like to explore them all. So it justifies why Inverter is referred to as Hello World! of transistor level design. Atleast, I say that 🤣. So in this section that took me aeons to reach to, we finally start with all the important analysis and parameters to be evaluated for an Inverter. I first start with a schematic diagram, then I evaluate all the parameters, that is, measuring them, experimenting with them and reaching a conclusive value and Finally reach a schematic circuit that is capable of things we lay down at the beginning.


**NOT(Inverter) Gate**:

<p align="center">
  <img src="Images/not_gate_place holder.png" alt="NOT_Gate" width="500"/>
</p>

----
### CMOS VTC analysis:

**VTC** is a plot of **output voltage (Vout)** vs **input voltage (Vin)** for a CMOS inverter.

#### Key Regions:
- **Vin ≈ 0V** → PMOS ON, NMOS OFF → **Vout ≈ VDD**
- **Vin ≈ Vth** → Both ON → **Vout drops sharply**
- **Vin ≈ VDD** → NMOS ON, PMOS OFF → **Vout ≈ 0V**

#### Why VTC Matters:
- Shows inverter switching behavior
- Helps determine **Vth** (threshold voltage)
- Used to evaluate **noise margins** and **transistor sizing**


<p align="center">
  <img src="Images/vtc_placeholder.png" alt="NOT_Gate" width="500"/>
</p>


The analysis starts with designing of the `inverter schematic` after which I have have converted it into a `symbol` such that it can be used for my future projects. Initially the **(W/L)** ratio of the PUN and PDN is not changed(kept the standard value) and is used for the simulations, results of which are shown below:

#### Schematic and Symbol:
The internal schematic:

<p align="center">
  <img src="Images/inverter/inv_internal_v1.png" alt="inv_internal_v1" width="600"/>
</p>

The custom symbol created:

<p align="center">
  <img src="Images/inverter/inv_symbol.png" alt="inv_symbol" width="600"/>
</p>

#### Simulation result from the above:

The test bench created to test the inverter:

<p align="center">
  <img src="Images/inverter/inv_test.png" alt="inv_test" width="600"/>
</p>

The graph obtained (left) and zoomed version (right):

<p align="center">
  <img src="Images/inverter/inv_test_grph_whole_v1.png" alt="inv_test_gph_whole_v1" width="400"/>
  <img src="Images/inverter/inv_test_grph_zoomed_v1.png" alt="inv_test_gph_zoomed_v1" width="400"/>
</p>

Value of Vth:

<p align="center">
  <img src="Images/inverter/Vth_v1.png" alt="Vth_v1" width="600"/>
</p>

As it can be seen that the Vth obtained is not exactly what is expected, this is because of the ratio that is used here. This **(W/L)** ratio is also called `aspect ratio` and from now on I am going to use **S** for referring it.

The **S** value for the inverter is to be adjusted such that the Vth obtained can be exactly near the mid point i.e. `0.9V`. However, it is to be taken into consideration the penalty of size. From the above obtained VTC graph, the sizing of the transistors can be done by following this trend:

<p align="center">
  <img src="Images/vtc_adjust.png" alt="vtc_adjust" width="600"/>
</p>



#### Optimised Version:

In this version, I have increased the aspect ratio of the PMOS by 2.5 times that of the NMOS.  
That is:  
`(W/L) ratio of PMOS = 2.5 × (W/L) ratio of NMOS`,where the `(W/L)` ratio of NMOS is kept at `1/0.15 microns`.


**Schematic:**

<p align="center">
  <img src="Images/inverter/inv_internal_v2.png" alt="inv_internal_v2" width="600"/>
</p>


**Simulation Result from the above:**

Test bench used for simulation:

<p align="center">
  <img src="Images/inverter/inv_test.png" alt="inv_test" width="600"/>
</p>

Graph obtained (left) and zoomed version (right):

<p align="center">
  <img src="Images/inverter/inv_test_grph_whole_v2.png" alt="inv_test_gph_whole_v2" width="400"/>
  <img src="Images/inverter/inv_test_grph_zoomed_v2.png" alt="inv_test_gph_zoomed_v2" width="400"/>
</p>

Value of Vth:

<p align="center">
  <img src="Images/inverter/Vth_v2.png" alt="Vth_v2" width="600"/>
</p>


Hence the finalised `threshold voltage` of the inverter is `0.88v`. As it can be seen that the value is not exactly half of the `Vdd` .i.e `0.9V`. This is because of the sizing limitations that I have applied(in terms of aspect ratios).


### CMOS Noise Analysis

**Noise Analysis** determines how much unwanted signal variation (noise) a CMOS logic gate can tolerate without malfunctioning.

#### Key Terms:

- **VIL**: Max input voltage still read as logic LOW  
- **VIH**: Min input voltage still read as logic HIGH  
- **VOL**: Max output voltage for logic LOW  
- **VOH**: Min output voltage for logic HIGH  

#### Noise Margins:

- **Noise Margin Low (NML)**  
  `= VIL − VOL`

- **Noise Margin High (NMH)**  
  `= VOH − VIH`

These define how much noise can be added to a signal without changing its logic value.

#### Why Noise Analysis Matters:

- Ensures **reliable logic level detection**
- Guides **robust circuit design**
- Helps maintain performance in presence of **power supply or crosstalk noise**

**Gain Curve**:

<p align="center">
  <img src="Images/Noise_Analysis/Gain_Curve.png" alt="Gain_Curve" width="600"/>
</p>

Simulation Window(left) and Entire Graph (right):

<p align="center">
  <img src="Images/Noise_Analysis/Entire_sim_windw.png" alt="Noise_sim_windw" width="400"/>
  <img src="Images/Noise_Analysis/Entire_Graph.png" alt="Entire_Graph" width="400"/>
</p>


From the analysis, we get the following values:
| Name             | Value                                                                |
| ----------------- | ------------------------------------------------------------------ |
| `Vth`|  `0.882V`  |
| `VIL` |   `0.756V` |
| `VIH` | `1.001V` |
| `VOL` | `0.069V` |
| `VOH` | `1.747V` |


Hence the calculated Noise Margins are:

 **NML = 0.687V** and **NMH = 0.746**.

 Now, they aren't equal. But if we were to take some more effort to get the values of Vth closet to Vdd/2 (0.9V), then we can get NML = NMH. But for our case they are close enough.


 **AS OF NOW THIS MUCH IS UPDATED**