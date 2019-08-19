// Max delays from https://github.com/SymbiFlow/prjxray-db/blob/f8e0364116b2983ac72a3dc8c509ea1cc79e2e3d/artix7/timings/BRAM_L.sdf#L138-L147

module RAMB18E1 (
	input CLKARDCLK,
	input CLKBWRCLK,
	input ENARDEN,
	input ENBWREN,
	input REGCEAREGCE,
	input REGCEB,
	input RSTRAMARSTRAM,
	input RSTRAMB,
	input RSTREGARSTREG,
	input RSTREGB,

	input [13:0] ADDRARDADDR,
	input [13:0] ADDRBWRADDR,
	input [15:0] DIADI,
	input [15:0] DIBDI,
	input [1:0] DIPADIP,
	input [1:0] DIPBDIP,
	input [1:0] WEA,
	input [3:0] WEBWE,

	(* abc_arrival=2454 *) output [15:0] DOADO,
	(* abc_arrival=2454 *) output [15:0] DOBDO,
	(* abc_arrival=2454 *) output [1:0] DOPADOP,
	(* abc_arrival=2454 *) output [1:0] DOPBDOP
);
	parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;

	parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

	parameter IS_CLKARDCLK_INVERTED = 1'b0;
	parameter IS_CLKBWRCLK_INVERTED = 1'b0;
	parameter IS_ENARDEN_INVERTED = 1'b0;
	parameter IS_ENBWREN_INVERTED = 1'b0;
	parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
	parameter IS_RSTRAMB_INVERTED = 1'b0;
	parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
	parameter IS_RSTREGB_INVERTED = 1'b0;

	parameter RAM_MODE = "TDP";
	parameter integer DOA_REG = 0;
	parameter integer DOB_REG = 0;

	parameter integer READ_WIDTH_A = 0;
	parameter integer READ_WIDTH_B = 0;
	parameter integer WRITE_WIDTH_A = 0;
	parameter integer WRITE_WIDTH_B = 0;

	parameter WRITE_MODE_A = "WRITE_FIRST";
	parameter WRITE_MODE_B = "WRITE_FIRST";

	parameter SIM_DEVICE = "VIRTEX6";
endmodule

module RAMB36E1 (
	input CLKARDCLK,
	input CLKBWRCLK,
	input ENARDEN,
	input ENBWREN,
	input REGCEAREGCE,
	input REGCEB,
	input RSTRAMARSTRAM,
	input RSTRAMB,
	input RSTREGARSTREG,
	input RSTREGB,

	input [15:0] ADDRARDADDR,
	input [15:0] ADDRBWRADDR,
	input [31:0] DIADI,
	input [31:0] DIBDI,
	input [3:0] DIPADIP,
	input [3:0] DIPBDIP,
	input [3:0] WEA,
	input [7:0] WEBWE,

	(* abc_arrival=2454 *) output [31:0] DOADO,
	(* abc_arrival=2454 *) output [31:0] DOBDO,
	(* abc_arrival=2454 *) output [3:0] DOPADOP,
	(* abc_arrival=2454 *) output [3:0] DOPBDOP
);
	parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INITP_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

	parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter INIT_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

	parameter IS_CLKARDCLK_INVERTED = 1'b0;
	parameter IS_CLKBWRCLK_INVERTED = 1'b0;
	parameter IS_ENARDEN_INVERTED = 1'b0;
	parameter IS_ENBWREN_INVERTED = 1'b0;
	parameter IS_RSTRAMARSTRAM_INVERTED = 1'b0;
	parameter IS_RSTRAMB_INVERTED = 1'b0;
	parameter IS_RSTREGARSTREG_INVERTED = 1'b0;
	parameter IS_RSTREGB_INVERTED = 1'b0;

	parameter RAM_MODE = "TDP";
	parameter integer DOA_REG = 0;
	parameter integer DOB_REG = 0;

	parameter integer READ_WIDTH_A = 0;
	parameter integer READ_WIDTH_B = 0;
	parameter integer WRITE_WIDTH_A = 0;
	parameter integer WRITE_WIDTH_B = 0;

	parameter WRITE_MODE_A = "WRITE_FIRST";
	parameter WRITE_MODE_B = "WRITE_FIRST";

	parameter SIM_DEVICE = "VIRTEX6";
endmodule
