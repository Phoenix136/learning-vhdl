# Nokia5110_Driver_Block

This project builds off of the Nokia5110_first project and is intended to create a self contained Block component that can be easily included in any future projects and used to drive a Nokia5110 LCD.

Nokia5110_Driver.vhd describes the control logic for an SPI master to the LCD, control logic to read/write to hard uSRAM blocks located within the FPGA fabric, and an APB slave interface to connect to the larger system.

This code needs to be cleaned up.

The uSRAM has been changed from catalog cores to inferred uSRAM blocks. These are written in a way that Synplify Pro will infer the HDL to the appropriate number of hard uSRAM blocks. Will this break with new software updates? Who knows. This also allows for the use of generate statements that can enable or disable a frame buffer to eliminate screen tearing as well as a single VHDL file to import to other projects.
The frame buffer is a duplicated memory block that an external Master can write to. Upon completion of a frame the Master will toggle a bit in the control register that sets future writes to the alternate frame memory and tells the LCD driver to read from the completed frame memroy, this is equivalent to basic Vsync on computers today.

The SPI master operates on an 8 bit frame, and a trigger signal to initiate an update of the entire LCD screen from the driver memory. Each screen update consists of an update of the LCD control registers, these are unlikely to change but if an error occurs on the LCD it will be corrected and any updates to the LCD display settings will propogate on their own. Each frame consists of 8 bits. At the start of a frame, a frame_start signal is set directing the driver to read a new byte from either the control registers or the display data. Each bit within the frame sets a frame_bit signal which shifts the SPI output buffer and puts the next bit on the SPI data out pin. If the frame_start signal is asserted but no new information is to be sent, the driver exits and enters an idle state.

The APB registers include 2 registers that define the X[0:83] and Y[0:5] data byte that represents the display data. This two 8 bit register implementation is used to keep the APB data bus to 8 bits for all registers. This does however conflict with the uSRAM which uses a simple continuous address from 0 to 503. A conversion between the X and Y coordinates to the uSRAM memory address follows the equation (Addr = Y * 84 + X). In lieu of adding multiplication logic, a mux is used before the product is added to the X value.
