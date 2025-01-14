# Delta_Sigma_first

This project is very much a work in progress.

This project is for me to learn how a sigma-delta (delta-sigma) modulator works as well as implement it on an FPGA. The Nokia driver (from Nokia5110_Driver_Block) is also included as a way to view the data and waveforms created by the delta-sigma block.

### Delta_Sigma_Converter

LVDS input at 20Mhz is sampled 2048 times. If the input is high (1), a value counter is incremented. If the input is low (0), the value counter is decremented. After 2048 samples, the value counter is stored in a register to be output while the value counter is reset to half its maximum value. This could probably be simplified to simply reset to zero and be 1 bit smaller but I haven't done that yet.

Getting the LVDS input requires the positive input to be connect to the analog signal to be measured (between 0V and 3.3V). The previous value from the LVDS is fed back out of the FPGA through a standard IO pin (0 or 3.3V) and passed through a low pass filter to the negative side input of the LVDS. This LVDS feedback process results in a pulse signal where taking the average duration of high states for a given time will equate to the average percentage of the maximum voltage of the LVDS feedback system.

e.g. if an analog signal is changing over time linearly from 0V to 1V, its average voltage for the duration should be .5V. If the LVDS system operates between 0V and 1V, the pulse signal should be high for 50% of the time. This will not be a clean PWM signal but instead a very busy signal with seemingly random durations of high and low states.

These high and low states are the result of the feedback LVDS system "narrowing in" on the analog signal's voltage level. It will be high until the negative LVDS input rises above the analog signal being fed into the positive LVDS input. The LVDS will then output '0' and the negative LVDS input will begin to fall in voltage until it is below the analog signal being fed into the LVDS system.

Probably. More analysis will follow.

The following is a screenshot of the analog signal (sine wave at 500Hz) as it is being affected by the LVDS feedback and the pulse signal being generated by the LVDS feedback system.

![LVDS feedback](images/LabNation_Screenshot0.png)

### Nokia5110 Driver

[see Nokia Driver Block](../Nokia5110_Driver_Block)

Why isn't it a Libero "Block" as the previous project intended? Because the exported files from the block throw "multiple HDL" errors when I include it in my project.
