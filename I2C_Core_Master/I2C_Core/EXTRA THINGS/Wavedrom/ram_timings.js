{signal: [
   {name: 'clk',			wave: 'P.....'},
  ['RAM Write',
   {name: 'mem_op_req',		wave: '01..0.'},
   {name: 'mem_done',		wave: '0..1.0'},
   {name: 'mem_delay',		wave: '0.10..'},
   {name: 'C_ADDR',			wave: 'x=...x'},
   {name: 'C_DIN',			wave: 'x=...x'},
   {name: 'C_WEN',			wave: '010...'},
   {name: 'RAM_Value',		wave: 'x.=...'},
  ],
  ['RAM Read',
   {name: 'mem_op_req',		wave: '01..0.'},
   {name: 'mem_done',		wave: '0..1.0'},
   {name: 'mem_delay',		wave: '0.10..'},
   {name: 'AB_ADDR',		wave: 'x=...x'},
   {name: 'AB_DOUT',		wave: 'x.=..x'},
   {name: 'RAM_Value',		wave: '=.....'},
  ],
]}