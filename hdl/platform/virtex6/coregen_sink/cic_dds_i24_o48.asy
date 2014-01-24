Version 4
SymbolType BLOCK
TEXT 32 32 LEFT 4 cic_dds_i24_o48
RECTANGLE Normal 32 32 736 480
LINE Normal 0 208 32 208
PIN 0 208 LEFT 36
PINATTR PinName s_axis_data_tvalid
PINATTR Polarity IN
LINE Normal 0 240 32 240
PIN 0 240 LEFT 36
PINATTR PinName s_axis_data_tready
PINATTR Polarity OUT
LINE Wide 0 272 32 272
PIN 0 272 LEFT 36
PINATTR PinName s_axis_data_tdata[23:0]
PINATTR Polarity IN
LINE Normal 0 304 32 304
PIN 0 304 LEFT 36
PINATTR PinName s_axis_data_tlast
PINATTR Polarity IN
LINE Normal 0 368 32 368
PIN 0 368 LEFT 36
PINATTR PinName aclk
PINATTR Polarity IN
LINE Normal 768 80 736 80
PIN 768 80 RIGHT 36
PINATTR PinName m_axis_data_tvalid
PINATTR Polarity OUT
LINE Wide 768 144 736 144
PIN 768 144 RIGHT 36
PINATTR PinName m_axis_data_tdata[55:0]
PINATTR Polarity OUT
LINE Normal 768 176 736 176
PIN 768 176 RIGHT 36
PINATTR PinName m_axis_data_tlast
PINATTR Polarity OUT
LINE Wide 768 208 736 208
PIN 768 208 RIGHT 36
PINATTR PinName m_axis_data_tuser[15:0]
PINATTR Polarity OUT
LINE Normal 768 272 736 272
PIN 768 272 RIGHT 36
PINATTR PinName event_tlast_unexpected
PINATTR Polarity OUT
LINE Normal 768 304 736 304
PIN 768 304 RIGHT 36
PINATTR PinName event_tlast_missing
PINATTR Polarity OUT

