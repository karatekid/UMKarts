//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Nov 20 19:24:45 2013
// Version: v11.0 11.0.0.23
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// gc
module gc(
    // Inputs
    CAPTURE_SWITCH,
    F2M_GPI_2,
    F2M_GPI_4,
    MSS_RESET_N,
    SPI_0_DI,
    UART_0_RXD,
    UART_1_RXD,
    VAREF0,
    // Outputs
    LMOTOR,
    LSERVO,
    PWM1,
    RMOTOR,
    RSERVO,
    SPEAKER_DAC,
    SPI_0_DO,
    TX,
    UART_0_TXD,
    UART_1_TXD,
    // Inouts
    SPI_0_CLK,
    SPI_0_SS,
    data
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  CAPTURE_SWITCH;
input  F2M_GPI_2;
input  F2M_GPI_4;
input  MSS_RESET_N;
input  SPI_0_DI;
input  UART_0_RXD;
input  UART_1_RXD;
input  VAREF0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output LMOTOR;
output LSERVO;
output PWM1;
output RMOTOR;
output RSERVO;
output SPEAKER_DAC;
output SPI_0_DO;
output TX;
output UART_0_TXD;
output UART_1_TXD;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout  SPI_0_CLK;
inout  SPI_0_SS;
inout  data;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          button_data_ready;
wire          CAPTURE_SWITCH;
wire          controller_init;
wire          CoreAPB3_0_APBmslave0_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_PRDATA;
wire          CoreAPB3_0_APBmslave0_PREADY;
wire          CoreAPB3_0_APBmslave0_PSELx;
wire          CoreAPB3_0_APBmslave0_PSLVERR;
wire          CoreAPB3_0_APBmslave0_PWRITE;
wire   [31:0] CoreAPB3_0_APBmslave1_PRDATA;
wire          CoreAPB3_0_APBmslave1_PREADY;
wire          CoreAPB3_0_APBmslave1_PSELx;
wire          CoreAPB3_0_APBmslave1_PSLVERR;
wire          CoreAPB3_0_APBmslave2_PREADY;
wire          CoreAPB3_0_APBmslave2_PSELx;
wire          CoreAPB3_0_APBmslave2_PSLVERR;
wire   [7:0]  count;
wire          data_net_0;
wire          F2M_GPI_2;
wire          F2M_GPI_4;
wire          gc_MSS_0_FAB_CLK;
wire          gc_MSS_0_M2F_RESET_N;
wire          gc_MSS_0_MSS_MASTER_APB_PENABLE;
wire   [31:0] gc_MSS_0_MSS_MASTER_APB_PRDATA;
wire          gc_MSS_0_MSS_MASTER_APB_PREADY;
wire          gc_MSS_0_MSS_MASTER_APB_PSELx;
wire          gc_MSS_0_MSS_MASTER_APB_PSLVERR;
wire   [31:0] gc_MSS_0_MSS_MASTER_APB_PWDATA;
wire          gc_MSS_0_MSS_MASTER_APB_PWRITE;
wire   [63:0] gc_receive_0_response;
wire          gc_response_apb_0_start_init;
wire          LMOTOR_net_0;
wire          LSERVO_net_0;
wire          MSS_RESET_N;
wire          PWM1_net_0;
wire          RMOTOR_net_0;
wire          RSERVO_net_0;
wire          send;
wire          send_query_0_wavebird_id_sent;
wire          SPEAKER_DAC_net_0;
wire          SPI_0_CLK;
wire          SPI_0_DI;
wire          SPI_0_DO_1;
wire          SPI_0_SS;
wire          TX_net_0;
wire          UART_0_RXD;
wire          UART_0_TXD_0;
wire          UART_1_RXD;
wire          UART_1_TXD_0;
wire          VAREF0;
wire   [23:0] wavebird_id;
wire          wavebird_id_ready;
wire          wavebird_id_send;
wire          UART_0_TXD_0_net_0;
wire          data_net_1;
wire          PWM1_net_1;
wire          LMOTOR_net_1;
wire          RMOTOR_net_1;
wire          LSERVO_net_1;
wire          RSERVO_net_1;
wire          UART_1_TXD_0_net_0;
wire          TX_net_1;
wire          SPI_0_DO_1_net_0;
wire          SPEAKER_DAC_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          VCC_net;
wire          GND_net;
wire   [31:0] IADDR_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:0] CoreAPB3_0_APBmslave0_PADDR;
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_1_4to0;
wire   [4:0]  CoreAPB3_0_APBmslave0_PADDR_1;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_0_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PADDR_0;
wire   [31:0] CoreAPB3_0_APBmslave0_PWDATA;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0_7to0;
wire   [7:0]  CoreAPB3_0_APBmslave0_PWDATA_0;
wire   [31:8] CoreAPB3_0_APBmslave2_PRDATA_0_31to8;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA_0_7to0;
wire   [31:0] CoreAPB3_0_APBmslave2_PRDATA_0;
wire   [7:0]  CoreAPB3_0_APBmslave2_PRDATA;
wire   [31:20]gc_MSS_0_MSS_MASTER_APB_PADDR_0_31to20;
wire   [19:0] gc_MSS_0_MSS_MASTER_APB_PADDR_0_19to0;
wire   [31:0] gc_MSS_0_MSS_MASTER_APB_PADDR_0;
wire   [19:0] gc_MSS_0_MSS_MASTER_APB_PADDR;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net               = 1'b1;
assign GND_net               = 1'b0;
assign IADDR_const_net_0     = 32'h00000000;
assign PRDATAS3_const_net_0  = 32'h00000000;
assign PRDATAS4_const_net_0  = 32'h00000000;
assign PRDATAS5_const_net_0  = 32'h00000000;
assign PRDATAS6_const_net_0  = 32'h00000000;
assign PRDATAS7_const_net_0  = 32'h00000000;
assign PRDATAS8_const_net_0  = 32'h00000000;
assign PRDATAS9_const_net_0  = 32'h00000000;
assign PRDATAS10_const_net_0 = 32'h00000000;
assign PRDATAS11_const_net_0 = 32'h00000000;
assign PRDATAS12_const_net_0 = 32'h00000000;
assign PRDATAS13_const_net_0 = 32'h00000000;
assign PRDATAS14_const_net_0 = 32'h00000000;
assign PRDATAS15_const_net_0 = 32'h00000000;
assign PRDATAS16_const_net_0 = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign UART_0_TXD_0_net_0 = UART_0_TXD_0;
assign UART_0_TXD         = UART_0_TXD_0_net_0;
assign data_net_1         = data_net_0;
assign data               = data_net_1;
assign PWM1_net_1         = PWM1_net_0;
assign PWM1               = PWM1_net_1;
assign LMOTOR_net_1       = LMOTOR_net_0;
assign LMOTOR             = LMOTOR_net_1;
assign RMOTOR_net_1       = RMOTOR_net_0;
assign RMOTOR             = RMOTOR_net_1;
assign LSERVO_net_1       = LSERVO_net_0;
assign LSERVO             = LSERVO_net_1;
assign RSERVO_net_1       = RSERVO_net_0;
assign RSERVO             = RSERVO_net_1;
assign UART_1_TXD_0_net_0 = UART_1_TXD_0;
assign UART_1_TXD         = UART_1_TXD_0_net_0;
assign TX_net_1           = TX_net_0;
assign TX                 = TX_net_1;
assign SPI_0_DO_1_net_0   = SPI_0_DO_1;
assign SPI_0_DO           = SPI_0_DO_1_net_0;
assign SPEAKER_DAC_net_1  = SPEAKER_DAC_net_0;
assign SPEAKER_DAC        = SPEAKER_DAC_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAPB3_0_APBmslave0_PADDR_1_4to0 = CoreAPB3_0_APBmslave0_PADDR[4:0];
assign CoreAPB3_0_APBmslave0_PADDR_1 = { CoreAPB3_0_APBmslave0_PADDR_1_4to0 };
assign CoreAPB3_0_APBmslave0_PADDR_0_7to0 = CoreAPB3_0_APBmslave0_PADDR[7:0];
assign CoreAPB3_0_APBmslave0_PADDR_0 = { CoreAPB3_0_APBmslave0_PADDR_0_7to0 };

assign CoreAPB3_0_APBmslave0_PWDATA_0_7to0 = CoreAPB3_0_APBmslave0_PWDATA[7:0];
assign CoreAPB3_0_APBmslave0_PWDATA_0 = { CoreAPB3_0_APBmslave0_PWDATA_0_7to0 };

assign CoreAPB3_0_APBmslave2_PRDATA_0_31to8 = 24'h0;
assign CoreAPB3_0_APBmslave2_PRDATA_0_7to0 = CoreAPB3_0_APBmslave2_PRDATA[7:0];
assign CoreAPB3_0_APBmslave2_PRDATA_0 = { CoreAPB3_0_APBmslave2_PRDATA_0_31to8, CoreAPB3_0_APBmslave2_PRDATA_0_7to0 };

assign gc_MSS_0_MSS_MASTER_APB_PADDR_0_31to20 = 12'h0;
assign gc_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 = gc_MSS_0_MSS_MASTER_APB_PADDR[19:0];
assign gc_MSS_0_MSS_MASTER_APB_PADDR_0 = { gc_MSS_0_MSS_MASTER_APB_PADDR_0_31to20, gc_MSS_0_MSS_MASTER_APB_PADDR_0_19to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.0.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 1 ),
        .APBSLOT2ENABLE  ( 1 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 12 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 2 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( gc_MSS_0_MSS_MASTER_APB_PWRITE ),
        .PENABLE    ( gc_MSS_0_MSS_MASTER_APB_PENABLE ),
        .PSEL       ( gc_MSS_0_MSS_MASTER_APB_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .PREADYS1   ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERRS1  ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .PREADYS2   ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERRS2  ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( gc_MSS_0_MSS_MASTER_APB_PADDR_0 ),
        .PWDATA     ( gc_MSS_0_MSS_MASTER_APB_PWDATA ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_PRDATA ),
        .PRDATAS1   ( CoreAPB3_0_APBmslave1_PRDATA ),
        .PRDATAS2   ( CoreAPB3_0_APBmslave2_PRDATA_0 ),
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( gc_MSS_0_MSS_MASTER_APB_PREADY ),
        .PSLVERR    ( gc_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_PSELx ),
        .PSELS1     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PSELS2     ( CoreAPB3_0_APBmslave2_PSELx ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( gc_MSS_0_MSS_MASTER_APB_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_PWDATA ) 
        );

//--------gc_CoreUARTapb_0_CoreUARTapb   -   Actel:DirectCore:CoreUARTapb:5.2.2
gc_CoreUARTapb_0_CoreUARTapb #( 
        .BAUD_VAL_FRCTN    ( 0 ),
        .BAUD_VAL_FRCTN_EN ( 0 ),
        .BAUD_VALUE        ( 1 ),
        .FAMILY            ( 18 ),
        .FIXEDMODE         ( 0 ),
        .PRG_BIT8          ( 0 ),
        .PRG_PARITY        ( 0 ),
        .RX_FIFO           ( 0 ),
        .RX_LEGACY_MODE    ( 0 ),
        .TX_FIFO           ( 0 ) )
CoreUARTapb_0(
        // Inputs
        .PCLK        ( gc_MSS_0_FAB_CLK ),
        .PRESETN     ( gc_MSS_0_M2F_RESET_N ),
        .PSEL        ( CoreAPB3_0_APBmslave2_PSELx ),
        .PENABLE     ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE      ( CoreAPB3_0_APBmslave0_PWRITE ),
        .RX          ( VCC_net ),
        .PADDR       ( CoreAPB3_0_APBmslave0_PADDR_1 ),
        .PWDATA      ( CoreAPB3_0_APBmslave0_PWDATA_0 ),
        // Outputs
        .TXRDY       (  ),
        .RXRDY       (  ),
        .PARITY_ERR  (  ),
        .OVERFLOW    (  ),
        .TX          ( TX_net_0 ),
        .PREADY      ( CoreAPB3_0_APBmslave2_PREADY ),
        .PSLVERR     ( CoreAPB3_0_APBmslave2_PSLVERR ),
        .FRAMING_ERR (  ),
        .PRDATA      ( CoreAPB3_0_APBmslave2_PRDATA ) 
        );

//--------gc_MSS
gc_MSS gc_MSS_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        .MSSPREADY   ( gc_MSS_0_MSS_MASTER_APB_PREADY ),
        .MSSPSLVERR  ( gc_MSS_0_MSS_MASTER_APB_PSLVERR ),
        .UART_0_RXD  ( UART_0_RXD ),
        .UART_1_RXD  ( UART_1_RXD ),
        .F2M_GPI_4   ( F2M_GPI_4 ),
        .F2M_GPI_2   ( F2M_GPI_2 ),
        .MSSPRDATA   ( gc_MSS_0_MSS_MASTER_APB_PRDATA ),
        .SPI_0_DI    ( SPI_0_DI ),
        .VAREF0      ( VAREF0 ),
        // Outputs
        .FAB_CLK     ( gc_MSS_0_FAB_CLK ),
        .M2F_RESET_N ( gc_MSS_0_M2F_RESET_N ),
        .MSSPSEL     ( gc_MSS_0_MSS_MASTER_APB_PSELx ),
        .MSSPENABLE  ( gc_MSS_0_MSS_MASTER_APB_PENABLE ),
        .MSSPWRITE   ( gc_MSS_0_MSS_MASTER_APB_PWRITE ),
        .UART_0_TXD  ( UART_0_TXD_0 ),
        .UART_1_TXD  ( UART_1_TXD_0 ),
        .M2F_GPO_5   (  ),
        .M2F_GPO_3   (  ),
        .MSSPADDR    ( gc_MSS_0_MSS_MASTER_APB_PADDR ),
        .MSSPWDATA   ( gc_MSS_0_MSS_MASTER_APB_PWDATA ),
        .SPI_0_DO    ( SPI_0_DO_1 ),
        .SPEAKER_DAC ( SPEAKER_DAC_net_0 ),
        // Inouts
        .SPI_0_CLK   ( SPI_0_CLK ),
        .SPI_0_SS    ( SPI_0_SS ) 
        );

//--------gc_receive
gc_receive gc_receive_0(
        // Inputs
        .clk               ( gc_MSS_0_FAB_CLK ),
        .data              ( data_net_0 ),
        .send              ( send ),
        .controller_init   ( controller_init ),
        // Outputs
        .wavebird_id_ready ( wavebird_id_ready ),
        .button_data_ready ( button_data_ready ),
        .response          ( gc_receive_0_response ),
        .wavebird_id       ( wavebird_id ),
        .count             ( count ) 
        );

//--------gc_response_apb
gc_response_apb gc_response_apb_0(
        // Inputs
        .PCLK       ( gc_MSS_0_FAB_CLK ),
        .PRESERN    ( gc_MSS_0_M2F_RESET_N ),
        .PSEL       ( CoreAPB3_0_APBmslave0_PSELx ),
        .PENABLE    ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PWRITE     ( CoreAPB3_0_APBmslave0_PWRITE ),
        .PADDR      ( CoreAPB3_0_APBmslave0_PADDR ),
        .PWDATA     ( CoreAPB3_0_APBmslave0_PWDATA ),
        .response   ( gc_receive_0_response ),
        .x          ( wavebird_id ),
        // Outputs
        .PREADY     ( CoreAPB3_0_APBmslave0_PREADY ),
        .PSLVERR    ( CoreAPB3_0_APBmslave0_PSLVERR ),
        .start_init ( gc_response_apb_0_start_init ),
        .PRDATA     ( CoreAPB3_0_APBmslave0_PRDATA ) 
        );

//--------gc_state
gc_state gc_state_0(
        // Inputs
        .clk               ( gc_MSS_0_FAB_CLK ),
        .start_init        ( gc_response_apb_0_start_init ),
        .wavebird_id_ready ( wavebird_id_ready ),
        .wavebird_id_sent  ( send_query_0_wavebird_id_sent ),
        .button_data_ready ( button_data_ready ),
        .wavebird_id       ( wavebird_id ),
        // Outputs
        .controller_init   ( controller_init ),
        .wavebird_id_send  ( wavebird_id_send ) 
        );

//--------motorWrapper
motorWrapper motorWrapper_0(
        // Inputs
        .PCLK           ( gc_MSS_0_FAB_CLK ),
        .PENABLE        ( CoreAPB3_0_APBmslave0_PENABLE ),
        .PSEL           ( CoreAPB3_0_APBmslave1_PSELx ),
        .PRESETN        ( gc_MSS_0_M2F_RESET_N ),
        .PWRITE         ( CoreAPB3_0_APBmslave0_PWRITE ),
        .CAPTURE_SWITCH ( CAPTURE_SWITCH ),
        .PADDR          ( CoreAPB3_0_APBmslave0_PADDR_0 ),
        .PWDATA         ( CoreAPB3_0_APBmslave0_PWDATA ),
        // Outputs
        .PREADY         ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERR        ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .FABINT         (  ),
        .PWM1           ( PWM1_net_0 ),
        .PWM2           (  ),
        .LMOTOR         ( LMOTOR_net_0 ),
        .RMOTOR         ( RMOTOR_net_0 ),
        .LSERVO         ( LSERVO_net_0 ),
        .RSERVO         ( RSERVO_net_0 ),
        .PRDATA         ( CoreAPB3_0_APBmslave1_PRDATA ),
        .TPS            (  ) 
        );

//--------send_query
send_query send_query_0(
        // Inputs
        .clk100mhz        ( gc_MSS_0_FAB_CLK ),
        .controller_init  ( controller_init ),
        .wavebird_id_send ( wavebird_id_send ),
        .wavebird_id      ( wavebird_id ),
        // Outputs
        .data             ( data_net_0 ),
        .send             ( send ),
        .wavebird_id_sent ( send_query_0_wavebird_id_sent ) 
        );


endmodule