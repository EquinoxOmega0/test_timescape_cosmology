set fit logfile 'log_fit.txt'
set print "binfit.txt"
set colorsequence classic
set fit v4
set fit errorvariables
load 'plotdata/k_fit_plot_help.txt'

f1(x)=a1*x+b1
fit f1(x) 'sim_data_lcdm/full_results_1.txt' u 1:2:4 via a1,b1
print a1,b1,a1_err,b1_err,FIT_STDFIT

f2(x)=a2*x+b2
fit f2(x) 'sim_data_lcdm/full_results_2.txt' u 1:2:4 via a2,b2
print a2,b2,a2_err,b2_err,FIT_STDFIT

f3(x)=a3*x+b3
fit f3(x) 'sim_data_lcdm/full_results_3.txt' u 1:2:4 via a3,b3
print a3,b3,a3_err,b3_err,FIT_STDFIT

f4(x)=a4*x+b4
fit f4(x) 'sim_data_lcdm/full_results_4.txt' u 1:2:4 via a4,b4
print a4,b4,a4_err,b4_err,FIT_STDFIT

f5(x)=a5*x+b5
fit f5(x) 'sim_data_lcdm/full_results_5.txt' u 1:2:4 via a5,b5
print a5,b5,a5_err,b5_err,FIT_STDFIT

f6(x)=a6*x+b6
fit f6(x) 'sim_data_lcdm/full_results_6.txt' u 1:2:4 via a6,b6
print a6,b6,a6_err,b6_err,FIT_STDFIT

f7(x)=a7*x+b7
fit f7(x) 'sim_data_lcdm/full_results_7.txt' u 1:2:4 via a7,b7
print a7,b7,a7_err,b7_err,FIT_STDFIT

f8(x)=a8*x+b8
fit f8(x) 'sim_data_lcdm/full_results_8.txt' u 1:2:4 via a8,b8
print a8,b8,a8_err,b8_err,FIT_STDFIT

f9(x)=a9*x+b9
fit f9(x) 'sim_data_lcdm/full_results_9.txt' u 1:2:4 via a9,b9
print a9,b9,a9_err,b9_err,FIT_STDFIT

f10(x)=a10*x+b10
fit f10(x) 'sim_data_lcdm/full_results_10.txt' u 1:2:4 via a10,b10
print a10,b10,a10_err,b10_err,FIT_STDFIT

f11(x)=a11*x+b11
fit f11(x) 'sim_data_lcdm/full_results_11.txt' u 1:2:4 via a11,b11
print a11,b11,a11_err,b11_err,FIT_STDFIT

f12(x)=a12*x+b12
fit f12(x) 'sim_data_lcdm/full_results_12.txt' u 1:2:4 via a12,b12
print a12,b12,a12_err,b12_err,FIT_STDFIT

f13(x)=a13*x+b13
fit f13(x) 'sim_data_lcdm/full_results_13.txt' u 1:2:4 via a13,b13
print a13,b13,a13_err,b13_err,FIT_STDFIT

f14(x)=a14*x+b14
fit f14(x) 'sim_data_lcdm/full_results_14.txt' u 1:2:4 via a14,b14
print a14,b14,a14_err,b14_err,FIT_STDFIT

f15(x)=a15*x+b15
fit f15(x) 'sim_data_lcdm/full_results_15.txt' u 1:2:4 via a15,b15
print a15,b15,a15_err,b15_err,FIT_STDFIT

f16(x)=a16*x+b16
fit f16(x) 'sim_data_lcdm/full_results_16.txt' u 1:2:4 via a16,b16
print a16,b16,a16_err,b16_err,FIT_STDFIT

f17(x)=a17*x+b17
fit f17(x) 'sim_data_lcdm/full_results_17.txt' u 1:2:4 via a17,b17
print a17,b17,a17_err,b17_err,FIT_STDFIT

f18(x)=a18*x+b18
fit f18(x) 'sim_data_lcdm/full_results_18.txt' u 1:2:4 via a18,b18
print a18,b18,a18_err,b18_err,FIT_STDFIT

f19(x)=a19*x+b19
fit f19(x) 'sim_data_lcdm/full_results_19.txt' u 1:2:4 via a19,b19
print a19,b19,a19_err,b19_err,FIT_STDFIT

f20(x)=a20*x+b20
fit f20(x) 'sim_data_lcdm/full_results_20.txt' u 1:2:4 via a20,b20
print a20,b20,a20_err,b20_err,FIT_STDFIT

f21(x)=a21*x+b21
fit f21(x) 'sim_data_lcdm/full_results_21.txt' u 1:2:4 via a21,b21
print a21,b21,a21_err,b21_err,FIT_STDFIT

f22(x)=a22*x+b22
fit f22(x) 'sim_data_lcdm/full_results_22.txt' u 1:2:4 via a22,b22
print a22,b22,a22_err,b22_err,FIT_STDFIT

f23(x)=a23*x+b23
fit f23(x) 'sim_data_lcdm/full_results_23.txt' u 1:2:4 via a23,b23
print a23,b23,a23_err,b23_err,FIT_STDFIT

f24(x)=a24*x+b24
fit f24(x) 'sim_data_lcdm/full_results_24.txt' u 1:2:4 via a24,b24
print a24,b24,a24_err,b24_err,FIT_STDFIT

f25(x)=a25*x+b25
fit f25(x) 'sim_data_lcdm/full_results_25.txt' u 1:2:4 via a25,b25
print a25,b25,a25_err,b25_err,FIT_STDFIT

f26(x)=a26*x+b26
fit f26(x) 'sim_data_lcdm/full_results_26.txt' u 1:2:4 via a26,b26
print a26,b26,a26_err,b26_err,FIT_STDFIT

f27(x)=a27*x+b27
fit f27(x) 'sim_data_lcdm/full_results_27.txt' u 1:2:4 via a27,b27
print a27,b27,a27_err,b27_err,FIT_STDFIT

f28(x)=a28*x+b28
fit f28(x) 'sim_data_lcdm/full_results_28.txt' u 1:2:4 via a28,b28
print a28,b28,a28_err,b28_err,FIT_STDFIT

f29(x)=a29*x+b29
fit f29(x) 'sim_data_lcdm/full_results_29.txt' u 1:2:4 via a29,b29
print a29,b29,a29_err,b29_err,FIT_STDFIT

f30(x)=a30*x+b30
fit f30(x) 'sim_data_lcdm/full_results_30.txt' u 1:2:4 via a30,b30
print a30,b30,a30_err,b30_err,FIT_STDFIT

f31(x)=a31*x+b31
fit f31(x) 'sim_data_lcdm/full_results_31.txt' u 1:2:4 via a31,b31
print a31,b31,a31_err,b31_err,FIT_STDFIT

f32(x)=a32*x+b32
fit f32(x) 'sim_data_lcdm/full_results_32.txt' u 1:2:4 via a32,b32
print a32,b32,a32_err,b32_err,FIT_STDFIT

f33(x)=a33*x+b33
fit f33(x) 'sim_data_lcdm/full_results_33.txt' u 1:2:4 via a33,b33
print a33,b33,a33_err,b33_err,FIT_STDFIT

f34(x)=a34*x+b34
fit f34(x) 'sim_data_lcdm/full_results_34.txt' u 1:2:4 via a34,b34
print a34,b34,a34_err,b34_err,FIT_STDFIT

f35(x)=a35*x+b35
fit f35(x) 'sim_data_lcdm/full_results_35.txt' u 1:2:4 via a35,b35
print a35,b35,a35_err,b35_err,FIT_STDFIT

f36(x)=a36*x+b36
fit f36(x) 'sim_data_lcdm/full_results_36.txt' u 1:2:4 via a36,b36
print a36,b36,a36_err,b36_err,FIT_STDFIT

f37(x)=a37*x+b37
fit f37(x) 'sim_data_lcdm/full_results_37.txt' u 1:2:4 via a37,b37
print a37,b37,a37_err,b37_err,FIT_STDFIT

f38(x)=a38*x+b38
fit f38(x) 'sim_data_lcdm/full_results_38.txt' u 1:2:4 via a38,b38
print a38,b38,a38_err,b38_err,FIT_STDFIT

f39(x)=a39*x+b39
fit f39(x) 'sim_data_lcdm/full_results_39.txt' u 1:2:4 via a39,b39
print a39,b39,a39_err,b39_err,FIT_STDFIT

f40(x)=a40*x+b40
fit f40(x) 'sim_data_lcdm/full_results_40.txt' u 1:2:4 via a40,b40
print a40,b40,a40_err,b40_err,FIT_STDFIT

f41(x)=a41*x+b41
fit f41(x) 'sim_data_lcdm/full_results_41.txt' u 1:2:4 via a41,b41
print a41,b41,a41_err,b41_err,FIT_STDFIT

f42(x)=a42*x+b42
fit f42(x) 'sim_data_lcdm/full_results_42.txt' u 1:2:4 via a42,b42
print a42,b42,a42_err,b42_err,FIT_STDFIT

f43(x)=a43*x+b43
fit f43(x) 'sim_data_lcdm/full_results_43.txt' u 1:2:4 via a43,b43
print a43,b43,a43_err,b43_err,FIT_STDFIT

f44(x)=a44*x+b44
fit f44(x) 'sim_data_lcdm/full_results_44.txt' u 1:2:4 via a44,b44
print a44,b44,a44_err,b44_err,FIT_STDFIT

f45(x)=a45*x+b45
fit f45(x) 'sim_data_lcdm/full_results_45.txt' u 1:2:4 via a45,b45
print a45,b45,a45_err,b45_err,FIT_STDFIT

f46(x)=a46*x+b46
fit f46(x) 'sim_data_lcdm/full_results_46.txt' u 1:2:4 via a46,b46
print a46,b46,a46_err,b46_err,FIT_STDFIT

f47(x)=a47*x+b47
fit f47(x) 'sim_data_lcdm/full_results_47.txt' u 1:2:4 via a47,b47
print a47,b47,a47_err,b47_err,FIT_STDFIT

f48(x)=a48*x+b48
fit f48(x) 'sim_data_lcdm/full_results_48.txt' u 1:2:4 via a48,b48
print a48,b48,a48_err,b48_err,FIT_STDFIT

f49(x)=a49*x+b49
fit f49(x) 'sim_data_lcdm/full_results_49.txt' u 1:2:4 via a49,b49
print a49,b49,a49_err,b49_err,FIT_STDFIT

f50(x)=a50*x+b50
fit f50(x) 'sim_data_lcdm/full_results_50.txt' u 1:2:4 via a50,b50
print a50,b50,a50_err,b50_err,FIT_STDFIT

f51(x)=a51*x+b51
fit f51(x) 'sim_data_lcdm/full_results_51.txt' u 1:2:4 via a51,b51
print a51,b51,a51_err,b51_err,FIT_STDFIT

f52(x)=a52*x+b52
fit f52(x) 'sim_data_lcdm/full_results_52.txt' u 1:2:4 via a52,b52
print a52,b52,a52_err,b52_err,FIT_STDFIT

f53(x)=a53*x+b53
fit f53(x) 'sim_data_lcdm/full_results_53.txt' u 1:2:4 via a53,b53
print a53,b53,a53_err,b53_err,FIT_STDFIT

f54(x)=a54*x+b54
fit f54(x) 'sim_data_lcdm/full_results_54.txt' u 1:2:4 via a54,b54
print a54,b54,a54_err,b54_err,FIT_STDFIT

f55(x)=a55*x+b55
fit f55(x) 'sim_data_lcdm/full_results_55.txt' u 1:2:4 via a55,b55
print a55,b55,a55_err,b55_err,FIT_STDFIT

f56(x)=a56*x+b56
fit f56(x) 'sim_data_lcdm/full_results_56.txt' u 1:2:4 via a56,b56
print a56,b56,a56_err,b56_err,FIT_STDFIT

f57(x)=a57*x+b57
fit f57(x) 'sim_data_lcdm/full_results_57.txt' u 1:2:4 via a57,b57
print a57,b57,a57_err,b57_err,FIT_STDFIT

f58(x)=a58*x+b58
fit f58(x) 'sim_data_lcdm/full_results_58.txt' u 1:2:4 via a58,b58
print a58,b58,a58_err,b58_err,FIT_STDFIT

f59(x)=a59*x+b59
fit f59(x) 'sim_data_lcdm/full_results_59.txt' u 1:2:4 via a59,b59
print a59,b59,a59_err,b59_err,FIT_STDFIT

f60(x)=a60*x+b60
fit f60(x) 'sim_data_lcdm/full_results_60.txt' u 1:2:4 via a60,b60
print a60,b60,a60_err,b60_err,FIT_STDFIT

f61(x)=a61*x+b61
fit f61(x) 'sim_data_lcdm/full_results_61.txt' u 1:2:4 via a61,b61
print a61,b61,a61_err,b61_err,FIT_STDFIT

f62(x)=a62*x+b62
fit f62(x) 'sim_data_lcdm/full_results_62.txt' u 1:2:4 via a62,b62
print a62,b62,a62_err,b62_err,FIT_STDFIT

f63(x)=a63*x+b63
fit f63(x) 'sim_data_lcdm/full_results_63.txt' u 1:2:4 via a63,b63
print a63,b63,a63_err,b63_err,FIT_STDFIT

f64(x)=a64*x+b64
fit f64(x) 'sim_data_lcdm/full_results_64.txt' u 1:2:4 via a64,b64
print a64,b64,a64_err,b64_err,FIT_STDFIT





av_a_lcdm=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17+a18+a19+a20+a21+a22+a23+a24+a25+a26+a27+a28+a29+a30+a31+a32+a33+a34+a35+a36+a37+a38+a39+a40+a41+a42+a43+a44+a45+a46+a47+a48+a49+a50+a51+a52+a53+a54+a55+a56+a57+a58+a59+a60+a61+a62+a63+a64
av_a_lcdm=av_a_lcdm/64.0
av_b_lcdm=b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12+b13+b14+b15+b16+b17+b18+b19+b20+b21+b22+b23+b24+b25+b26+b27+b28+b29+b30+b31+b32+b33+b34+b35+b36+b37+b38+b39+b40+b41+b42+b43+b44+b45+b46+b47+b48+b49+b50+b51+b52+b53+b54+b55+b56+b57+b58+b59+b60+b61+b62+b63+b64
av_b_lcdm=av_b_lcdm/64.0




f_lcdm(x)=av_a_lcdm*x+av_b_lcdm






set term postscript eps enhanced color
set output 'plots/map_all_lcdm.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_lcdm_all_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, f1(x) lt 1 lw 0.5 title '{/Symbol L}-CDM mock samples', f2(x) lt 1 lw 0.5 notitle, f3(x) lt 1 lw 0.5 notitle, f4(x) lt 1 lw 0.5 notitle, f5(x) lt 1 lw 0.5 notitle, f6(x) lt 1 lw 0.5 notitle, f7(x) lt 1 lw 0.5 notitle, f8(x) lt 1 lw 0.5 notitle, f9(x) lt 1 lw 0.5 notitle, f10(x) lt 1 lw 0.5 notitle, f11(x) lt 1 lw 0.5 notitle, f12(x) lt 1 lw 0.5 notitle, f13(x) lt 1 lw 0.5 notitle, f14(x) lt 1 lw 0.5 notitle, f15(x) lt 1 lw 0.5 notitle, f16(x) lt 1 lw 0.5 notitle, f17(x) lt 1 lw 0.5 notitle, f18(x) lt 1 lw 0.5 notitle, f19(x) lt 1 lw 0.5 notitle, f20(x) lt 1 lw 0.5 notitle, f21(x) lt 1 lw 0.5 notitle, f22(x) lt 1 lw 0.5 notitle, f23(x) lt 1 lw 0.5 notitle, f24(x) lt 1 lw 0.5 notitle, f25(x) lt 1 lw 0.5 notitle, f26(x) lt 1 lw 0.5 notitle, f27(x) lt 1 lw 0.5 notitle, f28(x) lt 1 lw 0.5 notitle, f29(x) lt 1 lw 0.5 notitle, f30(x) lt 1 lw 0.5 notitle, f31(x) lt 1 lw 0.5 notitle, f32(x) lt 1 lw 0.5 notitle, f33(x) lt 1 lw 0.5 notitle, f34(x) lt 1 lw 0.5 notitle, f35(x) lt 1 lw 0.5 notitle, f36(x) lt 1 lw 0.5 notitle, f37(x) lt 1 lw 0.5 notitle, f38(x) lt 1 lw 0.5 notitle, f39(x) lt 1 lw 0.5 notitle, f40(x) lt 1 lw 0.5 notitle, f41(x) lt 1 lw 0.5 notitle, f42(x) lt 1 lw 0.5 notitle, f43(x) lt 1 lw 0.5 notitle, f44(x) lt 1 lw 0.5 notitle, f45(x) lt 1 lw 0.5 notitle, f46(x) lt 1 lw 0.5 notitle, f47(x) lt 1 lw 0.5 notitle, f48(x) lt 1 lw 0.5 notitle, f49(x) lt 1 lw 0.5 notitle, f50(x) lt 1 lw 0.5 notitle, f51(x) lt 1 lw 0.5 notitle, f52(x) lt 1 lw 0.5 notitle, f53(x) lt 1 lw 0.5 notitle, f54(x) lt 1 lw 0.5 notitle, f55(x) lt 1 lw 0.5 notitle, f56(x) lt 1 lw 0.5 notitle, f57(x) lt 1 lw 0.5 notitle, f58(x) lt 1 lw 0.5 notitle, f59(x) lt 1 lw 0.5 notitle, f60(x) lt 1 lw 0.5 notitle, f61(x) lt 1 lw 0.5 notitle, f62(x) lt 1 lw 0.5 notitle, f63(x) lt 1 lw 0.5 notitle, f64(x) lt 1 lw 0.5 notitle, f_lcdm(x) lt 2 lw 5 title '{/Symbol L}-CDM mock average', fit_real_f_cmb(x) lw 5 lt 0 title 'observational data (CMB frame)'   
reset




f1(x)=a1*x+b1
fit f1(x) 'sim_data_lcdm/selected_results_1.txt' u 1:2:4 via a1,b1
print a1,b1,a1_err,b1_err,FIT_STDFIT

f2(x)=a2*x+b2
fit f2(x) 'sim_data_lcdm/selected_results_2.txt' u 1:2:4 via a2,b2
print a2,b2,a2_err,b2_err,FIT_STDFIT

f3(x)=a3*x+b3
fit f3(x) 'sim_data_lcdm/selected_results_3.txt' u 1:2:4 via a3,b3
print a3,b3,a3_err,b3_err,FIT_STDFIT

f4(x)=a4*x+b4
fit f4(x) 'sim_data_lcdm/selected_results_4.txt' u 1:2:4 via a4,b4
print a4,b4,a4_err,b4_err,FIT_STDFIT

f5(x)=a5*x+b5
fit f5(x) 'sim_data_lcdm/selected_results_5.txt' u 1:2:4 via a5,b5
print a5,b5,a5_err,b5_err,FIT_STDFIT

f6(x)=a6*x+b6
fit f6(x) 'sim_data_lcdm/selected_results_6.txt' u 1:2:4 via a6,b6
print a6,b6,a6_err,b6_err,FIT_STDFIT

f7(x)=a7*x+b7
fit f7(x) 'sim_data_lcdm/selected_results_7.txt' u 1:2:4 via a7,b7
print a7,b7,a7_err,b7_err,FIT_STDFIT

f8(x)=a8*x+b8
fit f8(x) 'sim_data_lcdm/selected_results_8.txt' u 1:2:4 via a8,b8
print a8,b8,a8_err,b8_err,FIT_STDFIT

f9(x)=a9*x+b9
fit f9(x) 'sim_data_lcdm/selected_results_9.txt' u 1:2:4 via a9,b9
print a9,b9,a9_err,b9_err,FIT_STDFIT

f10(x)=a10*x+b10
fit f10(x) 'sim_data_lcdm/selected_results_10.txt' u 1:2:4 via a10,b10
print a10,b10,a10_err,b10_err,FIT_STDFIT

f11(x)=a11*x+b11
fit f11(x) 'sim_data_lcdm/selected_results_11.txt' u 1:2:4 via a11,b11
print a11,b11,a11_err,b11_err,FIT_STDFIT

f12(x)=a12*x+b12
fit f12(x) 'sim_data_lcdm/selected_results_12.txt' u 1:2:4 via a12,b12
print a12,b12,a12_err,b12_err,FIT_STDFIT

f13(x)=a13*x+b13
fit f13(x) 'sim_data_lcdm/selected_results_13.txt' u 1:2:4 via a13,b13
print a13,b13,a13_err,b13_err,FIT_STDFIT

f14(x)=a14*x+b14
fit f14(x) 'sim_data_lcdm/selected_results_14.txt' u 1:2:4 via a14,b14
print a14,b14,a14_err,b14_err,FIT_STDFIT

f15(x)=a15*x+b15
fit f15(x) 'sim_data_lcdm/selected_results_15.txt' u 1:2:4 via a15,b15
print a15,b15,a15_err,b15_err,FIT_STDFIT

f16(x)=a16*x+b16
fit f16(x) 'sim_data_lcdm/selected_results_16.txt' u 1:2:4 via a16,b16
print a16,b16,a16_err,b16_err,FIT_STDFIT

f17(x)=a17*x+b17
fit f17(x) 'sim_data_lcdm/selected_results_17.txt' u 1:2:4 via a17,b17
print a17,b17,a17_err,b17_err,FIT_STDFIT

f18(x)=a18*x+b18
fit f18(x) 'sim_data_lcdm/selected_results_18.txt' u 1:2:4 via a18,b18
print a18,b18,a18_err,b18_err,FIT_STDFIT

f19(x)=a19*x+b19
fit f19(x) 'sim_data_lcdm/selected_results_19.txt' u 1:2:4 via a19,b19
print a19,b19,a19_err,b19_err,FIT_STDFIT

f20(x)=a20*x+b20
fit f20(x) 'sim_data_lcdm/selected_results_20.txt' u 1:2:4 via a20,b20
print a20,b20,a20_err,b20_err,FIT_STDFIT

f21(x)=a21*x+b21
fit f21(x) 'sim_data_lcdm/selected_results_21.txt' u 1:2:4 via a21,b21
print a21,b21,a21_err,b21_err,FIT_STDFIT

f22(x)=a22*x+b22
fit f22(x) 'sim_data_lcdm/selected_results_22.txt' u 1:2:4 via a22,b22
print a22,b22,a22_err,b22_err,FIT_STDFIT

f23(x)=a23*x+b23
fit f23(x) 'sim_data_lcdm/selected_results_23.txt' u 1:2:4 via a23,b23
print a23,b23,a23_err,b23_err,FIT_STDFIT

f24(x)=a24*x+b24
fit f24(x) 'sim_data_lcdm/selected_results_24.txt' u 1:2:4 via a24,b24
print a24,b24,a24_err,b24_err,FIT_STDFIT

f25(x)=a25*x+b25
fit f25(x) 'sim_data_lcdm/selected_results_25.txt' u 1:2:4 via a25,b25
print a25,b25,a25_err,b25_err,FIT_STDFIT

f26(x)=a26*x+b26
fit f26(x) 'sim_data_lcdm/selected_results_26.txt' u 1:2:4 via a26,b26
print a26,b26,a26_err,b26_err,FIT_STDFIT

f27(x)=a27*x+b27
fit f27(x) 'sim_data_lcdm/selected_results_27.txt' u 1:2:4 via a27,b27
print a27,b27,a27_err,b27_err,FIT_STDFIT

f28(x)=a28*x+b28
fit f28(x) 'sim_data_lcdm/selected_results_28.txt' u 1:2:4 via a28,b28
print a28,b28,a28_err,b28_err,FIT_STDFIT

f29(x)=a29*x+b29
fit f29(x) 'sim_data_lcdm/selected_results_29.txt' u 1:2:4 via a29,b29
print a29,b29,a29_err,b29_err,FIT_STDFIT

f30(x)=a30*x+b30
fit f30(x) 'sim_data_lcdm/selected_results_30.txt' u 1:2:4 via a30,b30
print a30,b30,a30_err,b30_err,FIT_STDFIT

f31(x)=a31*x+b31
fit f31(x) 'sim_data_lcdm/selected_results_31.txt' u 1:2:4 via a31,b31
print a31,b31,a31_err,b31_err,FIT_STDFIT

f32(x)=a32*x+b32
fit f32(x) 'sim_data_lcdm/selected_results_32.txt' u 1:2:4 via a32,b32
print a32,b32,a32_err,b32_err,FIT_STDFIT

f33(x)=a33*x+b33
fit f33(x) 'sim_data_lcdm/selected_results_33.txt' u 1:2:4 via a33,b33
print a33,b33,a33_err,b33_err,FIT_STDFIT

f34(x)=a34*x+b34
fit f34(x) 'sim_data_lcdm/selected_results_34.txt' u 1:2:4 via a34,b34
print a34,b34,a34_err,b34_err,FIT_STDFIT

f35(x)=a35*x+b35
fit f35(x) 'sim_data_lcdm/selected_results_35.txt' u 1:2:4 via a35,b35
print a35,b35,a35_err,b35_err,FIT_STDFIT

f36(x)=a36*x+b36
fit f36(x) 'sim_data_lcdm/selected_results_36.txt' u 1:2:4 via a36,b36
print a36,b36,a36_err,b36_err,FIT_STDFIT

f37(x)=a37*x+b37
fit f37(x) 'sim_data_lcdm/selected_results_37.txt' u 1:2:4 via a37,b37
print a37,b37,a37_err,b37_err,FIT_STDFIT

f38(x)=a38*x+b38
fit f38(x) 'sim_data_lcdm/selected_results_38.txt' u 1:2:4 via a38,b38
print a38,b38,a38_err,b38_err,FIT_STDFIT

f39(x)=a39*x+b39
fit f39(x) 'sim_data_lcdm/selected_results_39.txt' u 1:2:4 via a39,b39
print a39,b39,a39_err,b39_err,FIT_STDFIT

f40(x)=a40*x+b40
fit f40(x) 'sim_data_lcdm/selected_results_40.txt' u 1:2:4 via a40,b40
print a40,b40,a40_err,b40_err,FIT_STDFIT

f41(x)=a41*x+b41
fit f41(x) 'sim_data_lcdm/selected_results_41.txt' u 1:2:4 via a41,b41
print a41,b41,a41_err,b41_err,FIT_STDFIT

f42(x)=a42*x+b42
fit f42(x) 'sim_data_lcdm/selected_results_42.txt' u 1:2:4 via a42,b42
print a42,b42,a42_err,b42_err,FIT_STDFIT

f43(x)=a43*x+b43
fit f43(x) 'sim_data_lcdm/selected_results_43.txt' u 1:2:4 via a43,b43
print a43,b43,a43_err,b43_err,FIT_STDFIT

f44(x)=a44*x+b44
fit f44(x) 'sim_data_lcdm/selected_results_44.txt' u 1:2:4 via a44,b44
print a44,b44,a44_err,b44_err,FIT_STDFIT

f45(x)=a45*x+b45
fit f45(x) 'sim_data_lcdm/selected_results_45.txt' u 1:2:4 via a45,b45
print a45,b45,a45_err,b45_err,FIT_STDFIT

f46(x)=a46*x+b46
fit f46(x) 'sim_data_lcdm/selected_results_46.txt' u 1:2:4 via a46,b46
print a46,b46,a46_err,b46_err,FIT_STDFIT

f47(x)=a47*x+b47
fit f47(x) 'sim_data_lcdm/selected_results_47.txt' u 1:2:4 via a47,b47
print a47,b47,a47_err,b47_err,FIT_STDFIT

f48(x)=a48*x+b48
fit f48(x) 'sim_data_lcdm/selected_results_48.txt' u 1:2:4 via a48,b48
print a48,b48,a48_err,b48_err,FIT_STDFIT

f49(x)=a49*x+b49
fit f49(x) 'sim_data_lcdm/selected_results_49.txt' u 1:2:4 via a49,b49
print a49,b49,a49_err,b49_err,FIT_STDFIT

f50(x)=a50*x+b50
fit f50(x) 'sim_data_lcdm/selected_results_50.txt' u 1:2:4 via a50,b50
print a50,b50,a50_err,b50_err,FIT_STDFIT

f51(x)=a51*x+b51
fit f51(x) 'sim_data_lcdm/selected_results_51.txt' u 1:2:4 via a51,b51
print a51,b51,a51_err,b51_err,FIT_STDFIT

f52(x)=a52*x+b52
fit f52(x) 'sim_data_lcdm/selected_results_52.txt' u 1:2:4 via a52,b52
print a52,b52,a52_err,b52_err,FIT_STDFIT

f53(x)=a53*x+b53
fit f53(x) 'sim_data_lcdm/selected_results_53.txt' u 1:2:4 via a53,b53
print a53,b53,a53_err,b53_err,FIT_STDFIT

f54(x)=a54*x+b54
fit f54(x) 'sim_data_lcdm/selected_results_54.txt' u 1:2:4 via a54,b54
print a54,b54,a54_err,b54_err,FIT_STDFIT

f55(x)=a55*x+b55
fit f55(x) 'sim_data_lcdm/selected_results_55.txt' u 1:2:4 via a55,b55
print a55,b55,a55_err,b55_err,FIT_STDFIT

f56(x)=a56*x+b56
fit f56(x) 'sim_data_lcdm/selected_results_56.txt' u 1:2:4 via a56,b56
print a56,b56,a56_err,b56_err,FIT_STDFIT

f57(x)=a57*x+b57
fit f57(x) 'sim_data_lcdm/selected_results_57.txt' u 1:2:4 via a57,b57
print a57,b57,a57_err,b57_err,FIT_STDFIT

f58(x)=a58*x+b58
fit f58(x) 'sim_data_lcdm/selected_results_58.txt' u 1:2:4 via a58,b58
print a58,b58,a58_err,b58_err,FIT_STDFIT

f59(x)=a59*x+b59
fit f59(x) 'sim_data_lcdm/selected_results_59.txt' u 1:2:4 via a59,b59
print a59,b59,a59_err,b59_err,FIT_STDFIT

f60(x)=a60*x+b60
fit f60(x) 'sim_data_lcdm/selected_results_60.txt' u 1:2:4 via a60,b60
print a60,b60,a60_err,b60_err,FIT_STDFIT

f61(x)=a61*x+b61
fit f61(x) 'sim_data_lcdm/selected_results_61.txt' u 1:2:4 via a61,b61
print a61,b61,a61_err,b61_err,FIT_STDFIT

f62(x)=a62*x+b62
fit f62(x) 'sim_data_lcdm/selected_results_62.txt' u 1:2:4 via a62,b62
print a62,b62,a62_err,b62_err,FIT_STDFIT

f63(x)=a63*x+b63
fit f63(x) 'sim_data_lcdm/selected_results_63.txt' u 1:2:4 via a63,b63
print a63,b63,a63_err,b63_err,FIT_STDFIT

f64(x)=a64*x+b64
fit f64(x) 'sim_data_lcdm/selected_results_64.txt' u 1:2:4 via a64,b64
print a64,b64,a64_err,b64_err,FIT_STDFIT



av_a_lcdm_sel=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17+a18+a19+a20+a21+a22+a23+a24+a25+a26+a27+a28+a29+a30+a31+a32+a33+a34+a35+a36+a37+a38+a39+a40+a41+a42+a43+a44+a45+a46+a47+a48+a49+a50+a51+a52+a53+a54+a55+a56+a57+a58+a59+a60+a61+a62+a63+a64
av_a_lcdm_sel=av_a_lcdm_sel/64.0
av_b_lcdm_sel=b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12+b13+b14+b15+b16+b17+b18+b19+b20+b21+b22+b23+b24+b25+b26+b27+b28+b29+b30+b31+b32+b33+b34+b35+b36+b37+b38+b39+b40+b41+b42+b43+b44+b45+b46+b47+b48+b49+b50+b51+b52+b53+b54+b55+b56+b57+b58+b59+b60+b61+b62+b63+b64
av_b_lcdm_sel=av_b_lcdm_sel/64.0


f_lcdm_sel(x)=av_a_lcdm_sel*x+av_b_lcdm_sel



set term postscript eps enhanced color
set output 'plots/map_all_lcdm_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_lcdm_all_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, f1(x) lt 1 lw 0.5 title '{/Symbol L}-CDM mock samples', f2(x) lt 1 lw 0.5 notitle, f3(x) lt 1 lw 0.5 notitle, f4(x) lt 1 lw 0.5 notitle, f5(x) lt 1 lw 0.5 notitle, f6(x) lt 1 lw 0.5 notitle, f7(x) lt 1 lw 0.5 notitle, f8(x) lt 1 lw 0.5 notitle, f9(x) lt 1 lw 0.5 notitle, f10(x) lt 1 lw 0.5 notitle, f11(x) lt 1 lw 0.5 notitle, f12(x) lt 1 lw 0.5 notitle, f13(x) lt 1 lw 0.5 notitle, f14(x) lt 1 lw 0.5 notitle, f15(x) lt 1 lw 0.5 notitle, f16(x) lt 1 lw 0.5 notitle, f17(x) lt 1 lw 0.5 notitle, f18(x) lt 1 lw 0.5 notitle, f19(x) lt 1 lw 0.5 notitle, f20(x) lt 1 lw 0.5 notitle, f21(x) lt 1 lw 0.5 notitle, f22(x) lt 1 lw 0.5 notitle, f23(x) lt 1 lw 0.5 notitle, f24(x) lt 1 lw 0.5 notitle, f25(x) lt 1 lw 0.5 notitle, f26(x) lt 1 lw 0.5 notitle, f27(x) lt 1 lw 0.5 notitle, f28(x) lt 1 lw 0.5 notitle, f29(x) lt 1 lw 0.5 notitle, f30(x) lt 1 lw 0.5 notitle, f31(x) lt 1 lw 0.5 notitle, f32(x) lt 1 lw 0.5 notitle, f33(x) lt 1 lw 0.5 notitle, f34(x) lt 1 lw 0.5 notitle, f35(x) lt 1 lw 0.5 notitle, f36(x) lt 1 lw 0.5 notitle, f37(x) lt 1 lw 0.5 notitle, f38(x) lt 1 lw 0.5 notitle, f39(x) lt 1 lw 0.5 notitle, f40(x) lt 1 lw 0.5 notitle, f41(x) lt 1 lw 0.5 notitle, f42(x) lt 1 lw 0.5 notitle, f43(x) lt 1 lw 0.5 notitle, f44(x) lt 1 lw 0.5 notitle, f45(x) lt 1 lw 0.5 notitle, f46(x) lt 1 lw 0.5 notitle, f47(x) lt 1 lw 0.5 notitle, f48(x) lt 1 lw 0.5 notitle, f49(x) lt 1 lw 0.5 notitle, f50(x) lt 1 lw 0.5 notitle, f51(x) lt 1 lw 0.5 notitle, f52(x) lt 1 lw 0.5 notitle, f53(x) lt 1 lw 0.5 notitle, f54(x) lt 1 lw 0.5 notitle, f55(x) lt 1 lw 0.5 notitle, f56(x) lt 1 lw 0.5 notitle, f57(x) lt 1 lw 0.5 notitle, f58(x) lt 1 lw 0.5 notitle, f59(x) lt 1 lw 0.5 notitle, f60(x) lt 1 lw 0.5 notitle, f61(x) lt 1 lw 0.5 notitle, f62(x) lt 1 lw 0.5 notitle, f63(x) lt 1 lw 0.5 notitle, f64(x) lt 1 lw 0.5 notitle, f_lcdm_sel(x) lt 2 lw 5 title '{/Symbol L}-CDM mock average', fit_real_s_cmb(x) lw 5 lt 0 title 'observational data (CMB frame)'
reset






f1(x)=a1*x+b1
fit f1(x) 'sim_data_timescape/full_results_1.txt' u 1:2:4 via a1,b1
print a1,b1,a1_err,b1_err,FIT_STDFIT

f2(x)=a2*x+b2
fit f2(x) 'sim_data_timescape/full_results_2.txt' u 1:2:4 via a2,b2
print a2,b2,a2_err,b2_err,FIT_STDFIT

f3(x)=a3*x+b3
fit f3(x) 'sim_data_timescape/full_results_3.txt' u 1:2:4 via a3,b3
print a3,b3,a3_err,b3_err,FIT_STDFIT

f4(x)=a4*x+b4
fit f4(x) 'sim_data_timescape/full_results_4.txt' u 1:2:4 via a4,b4
print a4,b4,a4_err,b4_err,FIT_STDFIT

f5(x)=a5*x+b5
fit f5(x) 'sim_data_timescape/full_results_5.txt' u 1:2:4 via a5,b5
print a5,b5,a5_err,b5_err,FIT_STDFIT

f6(x)=a6*x+b6
fit f6(x) 'sim_data_timescape/full_results_6.txt' u 1:2:4 via a6,b6
print a6,b6,a6_err,b6_err,FIT_STDFIT

f7(x)=a7*x+b7
fit f7(x) 'sim_data_timescape/full_results_7.txt' u 1:2:4 via a7,b7
print a7,b7,a7_err,b7_err,FIT_STDFIT

f8(x)=a8*x+b8
fit f8(x) 'sim_data_timescape/full_results_8.txt' u 1:2:4 via a8,b8
print a8,b8,a8_err,b8_err,FIT_STDFIT

f9(x)=a9*x+b9
fit f9(x) 'sim_data_timescape/full_results_9.txt' u 1:2:4 via a9,b9
print a9,b9,a9_err,b9_err,FIT_STDFIT

f10(x)=a10*x+b10
fit f10(x) 'sim_data_timescape/full_results_10.txt' u 1:2:4 via a10,b10
print a10,b10,a10_err,b10_err,FIT_STDFIT

f11(x)=a11*x+b11
fit f11(x) 'sim_data_timescape/full_results_11.txt' u 1:2:4 via a11,b11
print a11,b11,a11_err,b11_err,FIT_STDFIT

f12(x)=a12*x+b12
fit f12(x) 'sim_data_timescape/full_results_12.txt' u 1:2:4 via a12,b12
print a12,b12,a12_err,b12_err,FIT_STDFIT

f13(x)=a13*x+b13
fit f13(x) 'sim_data_timescape/full_results_13.txt' u 1:2:4 via a13,b13
print a13,b13,a13_err,b13_err,FIT_STDFIT

f14(x)=a14*x+b14
fit f14(x) 'sim_data_timescape/full_results_14.txt' u 1:2:4 via a14,b14
print a14,b14,a14_err,b14_err,FIT_STDFIT

f15(x)=a15*x+b15
fit f15(x) 'sim_data_timescape/full_results_15.txt' u 1:2:4 via a15,b15
print a15,b15,a15_err,b15_err,FIT_STDFIT

f16(x)=a16*x+b16
fit f16(x) 'sim_data_timescape/full_results_16.txt' u 1:2:4 via a16,b16
print a16,b16,a16_err,b16_err,FIT_STDFIT

f17(x)=a17*x+b17
fit f17(x) 'sim_data_timescape/full_results_17.txt' u 1:2:4 via a17,b17
print a17,b17,a17_err,b17_err,FIT_STDFIT

f18(x)=a18*x+b18
fit f18(x) 'sim_data_timescape/full_results_18.txt' u 1:2:4 via a18,b18
print a18,b18,a18_err,b18_err,FIT_STDFIT

f19(x)=a19*x+b19
fit f19(x) 'sim_data_timescape/full_results_19.txt' u 1:2:4 via a19,b19
print a19,b19,a19_err,b19_err,FIT_STDFIT

f20(x)=a20*x+b20
fit f20(x) 'sim_data_timescape/full_results_20.txt' u 1:2:4 via a20,b20
print a20,b20,a20_err,b20_err,FIT_STDFIT

f21(x)=a21*x+b21
fit f21(x) 'sim_data_timescape/full_results_21.txt' u 1:2:4 via a21,b21
print a21,b21,a21_err,b21_err,FIT_STDFIT

f22(x)=a22*x+b22
fit f22(x) 'sim_data_timescape/full_results_22.txt' u 1:2:4 via a22,b22
print a22,b22,a22_err,b22_err,FIT_STDFIT

f23(x)=a23*x+b23
fit f23(x) 'sim_data_timescape/full_results_23.txt' u 1:2:4 via a23,b23
print a23,b23,a23_err,b23_err,FIT_STDFIT

f24(x)=a24*x+b24
fit f24(x) 'sim_data_timescape/full_results_24.txt' u 1:2:4 via a24,b24
print a24,b24,a24_err,b24_err,FIT_STDFIT

f25(x)=a25*x+b25
fit f25(x) 'sim_data_timescape/full_results_25.txt' u 1:2:4 via a25,b25
print a25,b25,a25_err,b25_err,FIT_STDFIT

f26(x)=a26*x+b26
fit f26(x) 'sim_data_timescape/full_results_26.txt' u 1:2:4 via a26,b26
print a26,b26,a26_err,b26_err,FIT_STDFIT

f27(x)=a27*x+b27
fit f27(x) 'sim_data_timescape/full_results_27.txt' u 1:2:4 via a27,b27
print a27,b27,a27_err,b27_err,FIT_STDFIT

f28(x)=a28*x+b28
fit f28(x) 'sim_data_timescape/full_results_28.txt' u 1:2:4 via a28,b28
print a28,b28,a28_err,b28_err,FIT_STDFIT

f29(x)=a29*x+b29
fit f29(x) 'sim_data_timescape/full_results_29.txt' u 1:2:4 via a29,b29
print a29,b29,a29_err,b29_err,FIT_STDFIT

f30(x)=a30*x+b30
fit f30(x) 'sim_data_timescape/full_results_30.txt' u 1:2:4 via a30,b30
print a30,b30,a30_err,b30_err,FIT_STDFIT

f31(x)=a31*x+b31
fit f31(x) 'sim_data_timescape/full_results_31.txt' u 1:2:4 via a31,b31
print a31,b31,a31_err,b31_err,FIT_STDFIT

f32(x)=a32*x+b32
fit f32(x) 'sim_data_timescape/full_results_32.txt' u 1:2:4 via a32,b32
print a32,b32,a32_err,b32_err,FIT_STDFIT

f33(x)=a33*x+b33
fit f33(x) 'sim_data_timescape/full_results_33.txt' u 1:2:4 via a33,b33
print a33,b33,a33_err,b33_err,FIT_STDFIT

f34(x)=a34*x+b34
fit f34(x) 'sim_data_timescape/full_results_34.txt' u 1:2:4 via a34,b34
print a34,b34,a34_err,b34_err,FIT_STDFIT

f35(x)=a35*x+b35
fit f35(x) 'sim_data_timescape/full_results_35.txt' u 1:2:4 via a35,b35
print a35,b35,a35_err,b35_err,FIT_STDFIT

f36(x)=a36*x+b36
fit f36(x) 'sim_data_timescape/full_results_36.txt' u 1:2:4 via a36,b36
print a36,b36,a36_err,b36_err,FIT_STDFIT

f37(x)=a37*x+b37
fit f37(x) 'sim_data_timescape/full_results_37.txt' u 1:2:4 via a37,b37
print a37,b37,a37_err,b37_err,FIT_STDFIT

f38(x)=a38*x+b38
fit f38(x) 'sim_data_timescape/full_results_38.txt' u 1:2:4 via a38,b38
print a38,b38,a38_err,b38_err,FIT_STDFIT

f39(x)=a39*x+b39
fit f39(x) 'sim_data_timescape/full_results_39.txt' u 1:2:4 via a39,b39
print a39,b39,a39_err,b39_err,FIT_STDFIT

f40(x)=a40*x+b40
fit f40(x) 'sim_data_timescape/full_results_40.txt' u 1:2:4 via a40,b40
print a40,b40,a40_err,b40_err,FIT_STDFIT

f41(x)=a41*x+b41
fit f41(x) 'sim_data_timescape/full_results_41.txt' u 1:2:4 via a41,b41
print a41,b41,a41_err,b41_err,FIT_STDFIT

f42(x)=a42*x+b42
fit f42(x) 'sim_data_timescape/full_results_42.txt' u 1:2:4 via a42,b42
print a42,b42,a42_err,b42_err,FIT_STDFIT

f43(x)=a43*x+b43
fit f43(x) 'sim_data_timescape/full_results_43.txt' u 1:2:4 via a43,b43
print a43,b43,a43_err,b43_err,FIT_STDFIT

f44(x)=a44*x+b44
fit f44(x) 'sim_data_timescape/full_results_44.txt' u 1:2:4 via a44,b44
print a44,b44,a44_err,b44_err,FIT_STDFIT

f45(x)=a45*x+b45
fit f45(x) 'sim_data_timescape/full_results_45.txt' u 1:2:4 via a45,b45
print a45,b45,a45_err,b45_err,FIT_STDFIT

f46(x)=a46*x+b46
fit f46(x) 'sim_data_timescape/full_results_46.txt' u 1:2:4 via a46,b46
print a46,b46,a46_err,b46_err,FIT_STDFIT

f47(x)=a47*x+b47
fit f47(x) 'sim_data_timescape/full_results_47.txt' u 1:2:4 via a47,b47
print a47,b47,a47_err,b47_err,FIT_STDFIT

f48(x)=a48*x+b48
fit f48(x) 'sim_data_timescape/full_results_48.txt' u 1:2:4 via a48,b48
print a48,b48,a48_err,b48_err,FIT_STDFIT

f49(x)=a49*x+b49
fit f49(x) 'sim_data_timescape/full_results_49.txt' u 1:2:4 via a49,b49
print a49,b49,a49_err,b49_err,FIT_STDFIT

f50(x)=a50*x+b50
fit f50(x) 'sim_data_timescape/full_results_50.txt' u 1:2:4 via a50,b50
print a50,b50,a50_err,b50_err,FIT_STDFIT

f51(x)=a51*x+b51
fit f51(x) 'sim_data_timescape/full_results_51.txt' u 1:2:4 via a51,b51
print a51,b51,a51_err,b51_err,FIT_STDFIT

f52(x)=a52*x+b52
fit f52(x) 'sim_data_timescape/full_results_52.txt' u 1:2:4 via a52,b52
print a52,b52,a52_err,b52_err,FIT_STDFIT

f53(x)=a53*x+b53
fit f53(x) 'sim_data_timescape/full_results_53.txt' u 1:2:4 via a53,b53
print a53,b53,a53_err,b53_err,FIT_STDFIT

f54(x)=a54*x+b54
fit f54(x) 'sim_data_timescape/full_results_54.txt' u 1:2:4 via a54,b54
print a54,b54,a54_err,b54_err,FIT_STDFIT

f55(x)=a55*x+b55
fit f55(x) 'sim_data_timescape/full_results_55.txt' u 1:2:4 via a55,b55
print a55,b55,a55_err,b55_err,FIT_STDFIT

f56(x)=a56*x+b56
fit f56(x) 'sim_data_timescape/full_results_56.txt' u 1:2:4 via a56,b56
print a56,b56,a56_err,b56_err,FIT_STDFIT

f57(x)=a57*x+b57
fit f57(x) 'sim_data_timescape/full_results_57.txt' u 1:2:4 via a57,b57
print a57,b57,a57_err,b57_err,FIT_STDFIT

f58(x)=a58*x+b58
fit f58(x) 'sim_data_timescape/full_results_58.txt' u 1:2:4 via a58,b58
print a58,b58,a58_err,b58_err,FIT_STDFIT

f59(x)=a59*x+b59
fit f59(x) 'sim_data_timescape/full_results_59.txt' u 1:2:4 via a59,b59
print a59,b59,a59_err,b59_err,FIT_STDFIT

f60(x)=a60*x+b60
fit f60(x) 'sim_data_timescape/full_results_60.txt' u 1:2:4 via a60,b60
print a60,b60,a60_err,b60_err,FIT_STDFIT

f61(x)=a61*x+b61
fit f61(x) 'sim_data_timescape/full_results_61.txt' u 1:2:4 via a61,b61
print a61,b61,a61_err,b61_err,FIT_STDFIT

f62(x)=a62*x+b62
fit f62(x) 'sim_data_timescape/full_results_62.txt' u 1:2:4 via a62,b62
print a62,b62,a62_err,b62_err,FIT_STDFIT

f63(x)=a63*x+b63
fit f63(x) 'sim_data_timescape/full_results_63.txt' u 1:2:4 via a63,b63
print a63,b63,a63_err,b63_err,FIT_STDFIT

f64(x)=a64*x+b64
fit f64(x) 'sim_data_timescape/full_results_64.txt' u 1:2:4 via a64,b64
print a64,b64,a64_err,b64_err,FIT_STDFIT









av_a_ts=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17+a18+a19+a20+a21+a22+a23+a24+a25+a26+a27+a28+a29+a30+a31+a32+a33+a34+a35+a36+a37+a38+a39+a40+a41+a42+a43+a44+a45+a46+a47+a48+a49+a50+a51+a52+a53+a54+a55+a56+a57+a58+a59+a60+a61+a62+a63+a64
av_a_ts=av_a_ts/64.0
av_b_ts=b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12+b13+b14+b15+b16+b17+b18+b19+b20+b21+b22+b23+b24+b25+b26+b27+b28+b29+b30+b31+b32+b33+b34+b35+b36+b37+b38+b39+b40+b41+b42+b43+b44+b45+b46+b47+b48+b49+b50+b51+b52+b53+b54+b55+b56+b57+b58+b59+b60+b61+b62+b63+b64
av_b_ts=av_b_ts/64.0

f_ts(x)=av_a_ts*x+av_b_ts




set term postscript eps enhanced color
set output 'plots/map_all_ts.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_ts_all_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, f1(x) lt 1 lw 0.5 title 'differential expansion mock samples', f2(x) lt 1 lw 0.5 notitle, f3(x) lt 1 lw 0.5 notitle, f4(x) lt 1 lw 0.5 notitle, f5(x) lt 1 lw 0.5 notitle, f6(x) lt 1 lw 0.5 notitle, f7(x) lt 1 lw 0.5 notitle, f8(x) lt 1 lw 0.5 notitle, f9(x) lt 1 lw 0.5 notitle, f10(x) lt 1 lw 0.5 notitle, f11(x) lt 1 lw 0.5 notitle, f12(x) lt 1 lw 0.5 notitle, f13(x) lt 1 lw 0.5 notitle, f14(x) lt 1 lw 0.5 notitle, f15(x) lt 1 lw 0.5 notitle, f16(x) lt 1 lw 0.5 notitle, f17(x) lt 1 lw 0.5 notitle, f18(x) lt 1 lw 0.5 notitle, f19(x) lt 1 lw 0.5 notitle, f20(x) lt 1 lw 0.5 notitle, f21(x) lt 1 lw 0.5 notitle, f22(x) lt 1 lw 0.5 notitle, f23(x) lt 1 lw 0.5 notitle, f24(x) lt 1 lw 0.5 notitle, f25(x) lt 1 lw 0.5 notitle, f26(x) lt 1 lw 0.5 notitle, f27(x) lt 1 lw 0.5 notitle, f28(x) lt 1 lw 0.5 notitle, f29(x) lt 1 lw 0.5 notitle, f30(x) lt 1 lw 0.5 notitle, f31(x) lt 1 lw 0.5 notitle, f32(x) lt 1 lw 0.5 notitle, f33(x) lt 1 lw 0.5 notitle, f34(x) lt 1 lw 0.5 notitle, f35(x) lt 1 lw 0.5 notitle, f36(x) lt 1 lw 0.5 notitle, f37(x) lt 1 lw 0.5 notitle, f38(x) lt 1 lw 0.5 notitle, f39(x) lt 1 lw 0.5 notitle, f40(x) lt 1 lw 0.5 notitle, f41(x) lt 1 lw 0.5 notitle, f42(x) lt 1 lw 0.5 notitle, f43(x) lt 1 lw 0.5 notitle, f44(x) lt 1 lw 0.5 notitle, f45(x) lt 1 lw 0.5 notitle, f46(x) lt 1 lw 0.5 notitle, f47(x) lt 1 lw 0.5 notitle, f48(x) lt 1 lw 0.5 notitle, f49(x) lt 1 lw 0.5 notitle, f50(x) lt 1 lw 0.5 notitle, f51(x) lt 1 lw 0.5 notitle, f52(x) lt 1 lw 0.5 notitle, f53(x) lt 1 lw 0.5 notitle, f54(x) lt 1 lw 0.5 notitle, f55(x) lt 1 lw 0.5 notitle, f56(x) lt 1 lw 0.5 notitle, f57(x) lt 1 lw 0.5 notitle, f58(x) lt 1 lw 0.5 notitle, f59(x) lt 1 lw 0.5 notitle, f60(x) lt 1 lw 0.5 notitle, f61(x) lt 1 lw 0.5 notitle, f62(x) lt 1 lw 0.5 notitle, f63(x) lt 1 lw 0.5 notitle, f64(x) lt 1 lw 0.5 notitle, f_ts(x) lt 2 lw 5 title 'differential expansion mock average', fit_real_f_lg(x) lw 5 lt 0 title 'observational data (LG frame)'
reset






f1(x)=a1*x+b1
fit f1(x) 'sim_data_timescape/selected_results_1.txt' u 1:2:4 via a1,b1
print a1,b1,a1_err,b1_err,FIT_STDFIT

f2(x)=a2*x+b2
fit f2(x) 'sim_data_timescape/selected_results_2.txt' u 1:2:4 via a2,b2
print a2,b2,a2_err,b2_err,FIT_STDFIT

f3(x)=a3*x+b3
fit f3(x) 'sim_data_timescape/selected_results_3.txt' u 1:2:4 via a3,b3
print a3,b3,a3_err,b3_err,FIT_STDFIT

f4(x)=a4*x+b4
fit f4(x) 'sim_data_timescape/selected_results_4.txt' u 1:2:4 via a4,b4
print a4,b4,a4_err,b4_err,FIT_STDFIT

f5(x)=a5*x+b5
fit f5(x) 'sim_data_timescape/selected_results_5.txt' u 1:2:4 via a5,b5
print a5,b5,a5_err,b5_err,FIT_STDFIT

f6(x)=a6*x+b6
fit f6(x) 'sim_data_timescape/selected_results_6.txt' u 1:2:4 via a6,b6
print a6,b6,a6_err,b6_err,FIT_STDFIT

f7(x)=a7*x+b7
fit f7(x) 'sim_data_timescape/selected_results_7.txt' u 1:2:4 via a7,b7
print a7,b7,a7_err,b7_err,FIT_STDFIT

f8(x)=a8*x+b8
fit f8(x) 'sim_data_timescape/selected_results_8.txt' u 1:2:4 via a8,b8
print a8,b8,a8_err,b8_err,FIT_STDFIT

f9(x)=a9*x+b9
fit f9(x) 'sim_data_timescape/selected_results_9.txt' u 1:2:4 via a9,b9
print a9,b9,a9_err,b9_err,FIT_STDFIT

f10(x)=a10*x+b10
fit f10(x) 'sim_data_timescape/selected_results_10.txt' u 1:2:4 via a10,b10
print a10,b10,a10_err,b10_err,FIT_STDFIT

f11(x)=a11*x+b11
fit f11(x) 'sim_data_timescape/selected_results_11.txt' u 1:2:4 via a11,b11
print a11,b11,a11_err,b11_err,FIT_STDFIT

f12(x)=a12*x+b12
fit f12(x) 'sim_data_timescape/selected_results_12.txt' u 1:2:4 via a12,b12
print a12,b12,a12_err,b12_err,FIT_STDFIT

f13(x)=a13*x+b13
fit f13(x) 'sim_data_timescape/selected_results_13.txt' u 1:2:4 via a13,b13
print a13,b13,a13_err,b13_err,FIT_STDFIT

f14(x)=a14*x+b14
fit f14(x) 'sim_data_timescape/selected_results_14.txt' u 1:2:4 via a14,b14
print a14,b14,a14_err,b14_err,FIT_STDFIT

f15(x)=a15*x+b15
fit f15(x) 'sim_data_timescape/selected_results_15.txt' u 1:2:4 via a15,b15
print a15,b15,a15_err,b15_err,FIT_STDFIT

f16(x)=a16*x+b16
fit f16(x) 'sim_data_timescape/selected_results_16.txt' u 1:2:4 via a16,b16
print a16,b16,a16_err,b16_err,FIT_STDFIT

f17(x)=a17*x+b17
fit f17(x) 'sim_data_timescape/selected_results_17.txt' u 1:2:4 via a17,b17
print a17,b17,a17_err,b17_err,FIT_STDFIT

f18(x)=a18*x+b18
fit f18(x) 'sim_data_timescape/selected_results_18.txt' u 1:2:4 via a18,b18
print a18,b18,a18_err,b18_err,FIT_STDFIT

f19(x)=a19*x+b19
fit f19(x) 'sim_data_timescape/selected_results_19.txt' u 1:2:4 via a19,b19
print a19,b19,a19_err,b19_err,FIT_STDFIT

f20(x)=a20*x+b20
fit f20(x) 'sim_data_timescape/selected_results_20.txt' u 1:2:4 via a20,b20
print a20,b20,a20_err,b20_err,FIT_STDFIT

f21(x)=a21*x+b21
fit f21(x) 'sim_data_timescape/selected_results_21.txt' u 1:2:4 via a21,b21
print a21,b21,a21_err,b21_err,FIT_STDFIT

f22(x)=a22*x+b22
fit f22(x) 'sim_data_timescape/selected_results_22.txt' u 1:2:4 via a22,b22
print a22,b22,a22_err,b22_err,FIT_STDFIT

f23(x)=a23*x+b23
fit f23(x) 'sim_data_timescape/selected_results_23.txt' u 1:2:4 via a23,b23
print a23,b23,a23_err,b23_err,FIT_STDFIT

f24(x)=a24*x+b24
fit f24(x) 'sim_data_timescape/selected_results_24.txt' u 1:2:4 via a24,b24
print a24,b24,a24_err,b24_err,FIT_STDFIT

f25(x)=a25*x+b25
fit f25(x) 'sim_data_timescape/selected_results_25.txt' u 1:2:4 via a25,b25
print a25,b25,a25_err,b25_err,FIT_STDFIT

f26(x)=a26*x+b26
fit f26(x) 'sim_data_timescape/selected_results_26.txt' u 1:2:4 via a26,b26
print a26,b26,a26_err,b26_err,FIT_STDFIT

f27(x)=a27*x+b27
fit f27(x) 'sim_data_timescape/selected_results_27.txt' u 1:2:4 via a27,b27
print a27,b27,a27_err,b27_err,FIT_STDFIT

f28(x)=a28*x+b28
fit f28(x) 'sim_data_timescape/selected_results_28.txt' u 1:2:4 via a28,b28
print a28,b28,a28_err,b28_err,FIT_STDFIT

f29(x)=a29*x+b29
fit f29(x) 'sim_data_timescape/selected_results_29.txt' u 1:2:4 via a29,b29
print a29,b29,a29_err,b29_err,FIT_STDFIT

f30(x)=a30*x+b30
fit f30(x) 'sim_data_timescape/selected_results_30.txt' u 1:2:4 via a30,b30
print a30,b30,a30_err,b30_err,FIT_STDFIT

f31(x)=a31*x+b31
fit f31(x) 'sim_data_timescape/selected_results_31.txt' u 1:2:4 via a31,b31
print a31,b31,a31_err,b31_err,FIT_STDFIT

f32(x)=a32*x+b32
fit f32(x) 'sim_data_timescape/selected_results_32.txt' u 1:2:4 via a32,b32
print a32,b32,a32_err,b32_err,FIT_STDFIT

f33(x)=a33*x+b33
fit f33(x) 'sim_data_timescape/selected_results_33.txt' u 1:2:4 via a33,b33
print a33,b33,a33_err,b33_err,FIT_STDFIT

f34(x)=a34*x+b34
fit f34(x) 'sim_data_timescape/selected_results_34.txt' u 1:2:4 via a34,b34
print a34,b34,a34_err,b34_err,FIT_STDFIT

f35(x)=a35*x+b35
fit f35(x) 'sim_data_timescape/selected_results_35.txt' u 1:2:4 via a35,b35
print a35,b35,a35_err,b35_err,FIT_STDFIT

f36(x)=a36*x+b36
fit f36(x) 'sim_data_timescape/selected_results_36.txt' u 1:2:4 via a36,b36
print a36,b36,a36_err,b36_err,FIT_STDFIT

f37(x)=a37*x+b37
fit f37(x) 'sim_data_timescape/selected_results_37.txt' u 1:2:4 via a37,b37
print a37,b37,a37_err,b37_err,FIT_STDFIT

f38(x)=a38*x+b38
fit f38(x) 'sim_data_timescape/selected_results_38.txt' u 1:2:4 via a38,b38
print a38,b38,a38_err,b38_err,FIT_STDFIT

f39(x)=a39*x+b39
fit f39(x) 'sim_data_timescape/selected_results_39.txt' u 1:2:4 via a39,b39
print a39,b39,a39_err,b39_err,FIT_STDFIT

f40(x)=a40*x+b40
fit f40(x) 'sim_data_timescape/selected_results_40.txt' u 1:2:4 via a40,b40
print a40,b40,a40_err,b40_err,FIT_STDFIT

f41(x)=a41*x+b41
fit f41(x) 'sim_data_timescape/selected_results_41.txt' u 1:2:4 via a41,b41
print a41,b41,a41_err,b41_err,FIT_STDFIT

f42(x)=a42*x+b42
fit f42(x) 'sim_data_timescape/selected_results_42.txt' u 1:2:4 via a42,b42
print a42,b42,a42_err,b42_err,FIT_STDFIT

f43(x)=a43*x+b43
fit f43(x) 'sim_data_timescape/selected_results_43.txt' u 1:2:4 via a43,b43
print a43,b43,a43_err,b43_err,FIT_STDFIT

f44(x)=a44*x+b44
fit f44(x) 'sim_data_timescape/selected_results_44.txt' u 1:2:4 via a44,b44
print a44,b44,a44_err,b44_err,FIT_STDFIT

f45(x)=a45*x+b45
fit f45(x) 'sim_data_timescape/selected_results_45.txt' u 1:2:4 via a45,b45
print a45,b45,a45_err,b45_err,FIT_STDFIT

f46(x)=a46*x+b46
fit f46(x) 'sim_data_timescape/selected_results_46.txt' u 1:2:4 via a46,b46
print a46,b46,a46_err,b46_err,FIT_STDFIT

f47(x)=a47*x+b47
fit f47(x) 'sim_data_timescape/selected_results_47.txt' u 1:2:4 via a47,b47
print a47,b47,a47_err,b47_err,FIT_STDFIT

f48(x)=a48*x+b48
fit f48(x) 'sim_data_timescape/selected_results_48.txt' u 1:2:4 via a48,b48
print a48,b48,a48_err,b48_err,FIT_STDFIT

f49(x)=a49*x+b49
fit f49(x) 'sim_data_timescape/selected_results_49.txt' u 1:2:4 via a49,b49
print a49,b49,a49_err,b49_err,FIT_STDFIT

f50(x)=a50*x+b50
fit f50(x) 'sim_data_timescape/selected_results_50.txt' u 1:2:4 via a50,b50
print a50,b50,a50_err,b50_err,FIT_STDFIT

f51(x)=a51*x+b51
fit f51(x) 'sim_data_timescape/selected_results_51.txt' u 1:2:4 via a51,b51
print a51,b51,a51_err,b51_err,FIT_STDFIT

f52(x)=a52*x+b52
fit f52(x) 'sim_data_timescape/selected_results_52.txt' u 1:2:4 via a52,b52
print a52,b52,a52_err,b52_err,FIT_STDFIT

f53(x)=a53*x+b53
fit f53(x) 'sim_data_timescape/selected_results_53.txt' u 1:2:4 via a53,b53
print a53,b53,a53_err,b53_err,FIT_STDFIT

f54(x)=a54*x+b54
fit f54(x) 'sim_data_timescape/selected_results_54.txt' u 1:2:4 via a54,b54
print a54,b54,a54_err,b54_err,FIT_STDFIT

f55(x)=a55*x+b55
fit f55(x) 'sim_data_timescape/selected_results_55.txt' u 1:2:4 via a55,b55
print a55,b55,a55_err,b55_err,FIT_STDFIT

f56(x)=a56*x+b56
fit f56(x) 'sim_data_timescape/selected_results_56.txt' u 1:2:4 via a56,b56
print a56,b56,a56_err,b56_err,FIT_STDFIT

f57(x)=a57*x+b57
fit f57(x) 'sim_data_timescape/selected_results_57.txt' u 1:2:4 via a57,b57
print a57,b57,a57_err,b57_err,FIT_STDFIT

f58(x)=a58*x+b58
fit f58(x) 'sim_data_timescape/selected_results_58.txt' u 1:2:4 via a58,b58
print a58,b58,a58_err,b58_err,FIT_STDFIT

f59(x)=a59*x+b59
fit f59(x) 'sim_data_timescape/selected_results_59.txt' u 1:2:4 via a59,b59
print a59,b59,a59_err,b59_err,FIT_STDFIT

f60(x)=a60*x+b60
fit f60(x) 'sim_data_timescape/selected_results_60.txt' u 1:2:4 via a60,b60
print a60,b60,a60_err,b60_err,FIT_STDFIT

f61(x)=a61*x+b61
fit f61(x) 'sim_data_timescape/selected_results_61.txt' u 1:2:4 via a61,b61
print a61,b61,a61_err,b61_err,FIT_STDFIT

f62(x)=a62*x+b62
fit f62(x) 'sim_data_timescape/selected_results_62.txt' u 1:2:4 via a62,b62
print a62,b62,a62_err,b62_err,FIT_STDFIT

f63(x)=a63*x+b63
fit f63(x) 'sim_data_timescape/selected_results_63.txt' u 1:2:4 via a63,b63
print a63,b63,a63_err,b63_err,FIT_STDFIT

f64(x)=a64*x+b64
fit f64(x) 'sim_data_timescape/selected_results_64.txt' u 1:2:4 via a64,b64
print a64,b64,a64_err,b64_err,FIT_STDFIT





av_a_ts_sel=a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17+a18+a19+a20+a21+a22+a23+a24+a25+a26+a27+a28+a29+a30+a31+a32+a33+a34+a35+a36+a37+a38+a39+a40+a41+a42+a43+a44+a45+a46+a47+a48+a49+a50+a51+a52+a53+a54+a55+a56+a57+a58+a59+a60+a61+a62+a63+a64
av_a_ts_sel=av_a_ts_sel/64.0
av_b_ts_sel=b1+b2+b3+b4+b5+b6+b7+b8+b9+b10+b11+b12+b13+b14+b15+b16+b17+b18+b19+b20+b21+b22+b23+b24+b25+b26+b27+b28+b29+b30+b31+b32+b33+b34+b35+b36+b37+b38+b39+b40+b41+b42+b43+b44+b45+b46+b47+b48+b49+b50+b51+b52+b53+b54+b55+b56+b57+b58+b59+b60+b61+b62+b63+b64
av_b_ts_sel=av_b_ts_sel/64.0


f_ts_sel(x)=av_a_ts_sel*x+av_b_ts_sel






set term postscript eps enhanced color
set output 'plots/map_all_ts_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_ts_all_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, f1(x) lt 1 lw 0.5 title 'differential expansion mock samples', f2(x) lt 1 lw 0.5 notitle, f3(x) lt 1 lw 0.5 notitle, f4(x) lt 1 lw 0.5 notitle, f5(x) lt 1 lw 0.5 notitle, f6(x) lt 1 lw 0.5 notitle, f7(x) lt 1 lw 0.5 notitle, f8(x) lt 1 lw 0.5 notitle, f9(x) lt 1 lw 0.5 notitle, f10(x) lt 1 lw 0.5 notitle, f11(x) lt 1 lw 0.5 notitle, f12(x) lt 1 lw 0.5 notitle, f13(x) lt 1 lw 0.5 notitle, f14(x) lt 1 lw 0.5 notitle, f15(x) lt 1 lw 0.5 notitle, f16(x) lt 1 lw 0.5 notitle, f17(x) lt 1 lw 0.5 notitle, f18(x) lt 1 lw 0.5 notitle, f19(x) lt 1 lw 0.5 notitle, f20(x) lt 1 lw 0.5 notitle, f21(x) lt 1 lw 0.5 notitle, f22(x) lt 1 lw 0.5 notitle, f23(x) lt 1 lw 0.5 notitle, f24(x) lt 1 lw 0.5 notitle, f25(x) lt 1 lw 0.5 notitle, f26(x) lt 1 lw 0.5 notitle, f27(x) lt 1 lw 0.5 notitle, f28(x) lt 1 lw 0.5 notitle, f29(x) lt 1 lw 0.5 notitle, f30(x) lt 1 lw 0.5 notitle, f31(x) lt 1 lw 0.5 notitle, f32(x) lt 1 lw 0.5 notitle, f33(x) lt 1 lw 0.5 notitle, f34(x) lt 1 lw 0.5 notitle, f35(x) lt 1 lw 0.5 notitle, f36(x) lt 1 lw 0.5 notitle, f37(x) lt 1 lw 0.5 notitle, f38(x) lt 1 lw 0.5 notitle, f39(x) lt 1 lw 0.5 notitle, f40(x) lt 1 lw 0.5 notitle, f41(x) lt 1 lw 0.5 notitle, f42(x) lt 1 lw 0.5 notitle, f43(x) lt 1 lw 0.5 notitle, f44(x) lt 1 lw 0.5 notitle, f45(x) lt 1 lw 0.5 notitle, f46(x) lt 1 lw 0.5 notitle, f47(x) lt 1 lw 0.5 notitle, f48(x) lt 1 lw 0.5 notitle, f49(x) lt 1 lw 0.5 notitle, f50(x) lt 1 lw 0.5 notitle, f51(x) lt 1 lw 0.5 notitle, f52(x) lt 1 lw 0.5 notitle, f53(x) lt 1 lw 0.5 notitle, f54(x) lt 1 lw 0.5 notitle, f55(x) lt 1 lw 0.5 notitle, f56(x) lt 1 lw 0.5 notitle, f57(x) lt 1 lw 0.5 notitle, f58(x) lt 1 lw 0.5 notitle, f59(x) lt 1 lw 0.5 notitle, f60(x) lt 1 lw 0.5 notitle, f61(x) lt 1 lw 0.5 notitle, f62(x) lt 1 lw 0.5 notitle, f63(x) lt 1 lw 0.5 notitle, f64(x) lt 1 lw 0.5 notitle, f_ts_sel(x) lt 2 lw 5 title 'differential expansion mock average', fit_real_s_lg(x) lw 5 lt 0 title 'observational data (LG frame)'
reset






set term postscript eps enhanced color
set output 'plots/binned_data_lg.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin10_res.txt" using 1:4 with histeps lw 5 lt 4 title '{/Symbol L}-CDM expectations', "plotdata/bin10_res.txt" using 1:5 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:6 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:7 with histeps lw 5 lt 2 title 'differential expansion', "plotdata/bin10_res.txt" using 1:8 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:9 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:3 with histeps lw 5 lt 0 title 'observational data (LG frame)'
reset




set term postscript eps enhanced color
set output 'plots/binned_data_cmb.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin10_res.txt" using 1:4 with histeps lw 5 lt 4 title '{/Symbol L}-CDM expectations', "plotdata/bin10_res.txt" using 1:5 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:6 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:7 with histeps lw 5 lt 2 title 'differential expansion', "plotdata/bin10_res.txt" using 1:8 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:9 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:2 with histeps lw 5 lt 0 title 'observational data (CMB frame)'
reset





load 'av_fract_infi.txt'

   

set term postscript eps enhanced color
set output 'plots/map_distance_sim.eps'
set xrange [0:800]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_fi_distance.txt'
unset table
set xrange [0:800]
set yrange [0:1]
# unset key
set ylabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set xlabel "fundamental plane distance [Mpc]" font  ",20"
set ytics 0.1
set xtics 100
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
set arrow from  d_limit,0 to  d_limit,1 nohead lw 5  lt 5 front
p 'test.dat' with image, av_fract_infi lw 5 lt 4 notitle
reset



set term postscript eps enhanced color
set output 'plots/map_distance_real.eps'
set xrange [0:800]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_fi_distance.txt'
unset table
set xrange [0:800]
set yrange [0:1]
# unset key
set ylabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set xlabel "fundamental plane distance [Mpc]" font  ",20"
set ytics 0.1
set xtics 100
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
set arrow from  d_limit,0 to  d_limit,1 nohead lw 5  lt 5 front
p 'test.dat' with image, fract_fi_realts lw 5 lt 4 notitle
reset





set term postscript eps enhanced color
set output 'plots/binned_data_lg_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin10_res.txt" using 1:4 with histeps lw 5 lt 4 title '{/Symbol L}-CDM expectations', "plotdata/bin10_res.txt" using 1:5 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:6 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:7 with histeps lw 5 lt 2 title 'differential expansion', "plotdata/bin10_res.txt" using 1:8 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:9 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:3 with histeps lw 5 lt 0 title 'observational data (LG frame)'
reset




set term postscript eps enhanced color
set output 'plots/binned_data_cmb_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin10_res.txt" using 1:4 with histeps lw 5 lt 4 title '{/Symbol L}-CDM expectations', "plotdata/bin10_res.txt" using 1:5 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:6 with histeps lw 1 lt 4 notitle, "plotdata/bin10_res.txt" using 1:7 with histeps lw 5 lt 2 title 'differential expansion', "plotdata/bin10_res.txt" using 1:8 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:9 with histeps lw 1 lt 2 notitle, "plotdata/bin10_res.txt" using 1:2 with histeps lw 5 lt 0 title 'observational data (CMB frame)'
reset




# d_limit=446.39567134618397     
d_limit=402.8

set term postscript eps enhanced color
set output 'plots/map_distance_sim_selected.eps'
set xrange [0:800]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_fi_distance_selected.txt'
unset table
set xrange [0:800]
set yrange [0:1]
# unset key
set ylabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set xlabel "fundamental plane distance [Mpc]" font  ",20"
set ytics 0.1
set xtics 100
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
set arrow from  d_limit,0 to  d_limit,1 nohead lw 5  lt 5 front
p 'test.dat' with image, av_fract_infi lw 5 lt 4 notitle
reset



set term postscript eps enhanced color
set output 'plots/map_distance_real_selected.eps'
set xrange [0:800]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_fi_distance_selected.txt'
unset table
set xrange [0:800]
set yrange [0:1]
# unset key
set ylabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set xlabel "fundamental plane distance [Mpc]" font  ",20"
set ytics 0.1
set xtics 100
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
set arrow from  d_limit,0 to  d_limit,1 nohead lw 5  lt 5 front
p 'test.dat' with image, fract_fi_realts_selected lw 5 lt 4 notitle
reset



fr_full_lg(x)=ar_full_lg*x+br_full_lg
fit fr_full_lg(x) 'real_data_calibrated/full_results_lg.txt' u 1:2:4 via ar_full_lg,br_full_lg
print ar_full_lg,br_full_lg,ar_full_lg_err,br_full_lg_err,FIT_STDFIT



set term postscript eps enhanced color
set output 'plots/map_obs_lg.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, fit_lcdm_f_av(x) lw 5 lt 4 title '{/Symbol L}-CDM expectations', fit_lcdm_f_s1(x) lw 1 lt 4 notitle, fit_lcdm_f_s2(x) lw 1 lt 4 notitle, fit_ts_f_av(x) lw 5 lt 2 title 'differential expansion', fit_ts_f_s1(x) lw 1 lt 2 notitle, fit_ts_f_s2(x) lw 1 lt 2 notitle, fr_full_lg(x) lw 5 lt 7 title 'observational data (LG frame)'
reset



fr_full_cmb(x)=ar_full_cmb*x+br_full_cmb
fit fr_full_cmb(x) 'real_data_calibrated/full_results_cmb.txt' u 1:2:4 via ar_full_cmb,br_full_cmb
print ar_full_cmb,br_full_cmb,ar_full_cmb_err,br_full_cmb_err,FIT_STDFIT

set term postscript eps enhanced color
set output 'plots/map_obs_cmb.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, fit_lcdm_f_av(x) lw 5 lt 4 title '{/Symbol L}-CDM expectations', fit_lcdm_f_s1(x) lw 1 lt 4 notitle, fit_lcdm_f_s2(x) lw 1 lt 4 notitle, fit_ts_f_av(x) lw 5 lt 2 title 'differential expansion', fit_ts_f_s1(x) lw 1 lt 2 notitle, fit_ts_f_s2(x) lw 1 lt 2 notitle, fr_full_cmb(x) lw 5 lt 7 title 'observational data (CMB frame)'                     
reset


fr_sel_lg(x)=ar_sel_lg*x+br_sel_lg
fit fr_sel_lg(x) 'real_data_calibrated/selected_results_lg.txt' u 1:2:4 via ar_sel_lg,br_sel_lg
print ar_sel_lg,br_sel_lg,ar_sel_lg_err,br_sel_lg_err,FIT_STDFIT




set term postscript eps enhanced color
set output 'plots/map_obs_lg_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, fit_lcdm_s_av(x) lw 5 lt 4 title '{/Symbol L}-CDM expectations', fit_lcdm_s_s1(x) lw 1 lt 4 notitle, fit_lcdm_s_s2(x) lw 1 lt 4 notitle, fit_ts_s_av(x) lw 5 lt 2 title 'differential expansion', fit_ts_s_s1(x) lw 1 lt 2 notitle, fit_ts_s_s2(x) lw 1 lt 2 notitle, fr_sel_lg(x) lw 5 lt 7 title 'observational data (LG frame)'
reset


fr_sel_cmb(x)=ar_sel_cmb*x+br_sel_cmb
fit fr_sel_cmb(x) 'real_data_calibrated/selected_results_cmb.txt' u 1:2:4 via ar_sel_cmb,br_sel_cmb
print ar_sel_cmb,br_sel_cmb,ar_sel_cmb_err,br_sel_cmb_err,FIT_STDFIT


set term postscript eps enhanced color
set output 'plots/map_obs_cmb_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, fit_lcdm_s_av(x) lw 5 lt 4 title '{/Symbol L}-CDM expectations', fit_lcdm_s_s1(x) lw 1 lt 4 notitle, fit_lcdm_s_s2(x) lw 1 lt 4 notitle, fit_ts_s_av(x) lw 5 lt 2 title 'differential expansion', fit_ts_s_s1(x) lw 1 lt 2 notitle, fit_ts_s_s2(x) lw 1 lt 2 notitle, fr_sel_cmb(x) lw 5 lt 7 title 'observational data (CMB frame)'
reset

set print "analysis/delta_inside_fi.txt"
load 'plotdata/delta_inside_fi.txt'
f_fract(x)=k*x+d
fit f_fract(x) 'plotdata/inside_fi_fractions_f.txt' u 1:2:3 via k
print k,k_err,d,FIT_STDFIT

f_fract(x)=k*x+d
fit f_fract(x) 'plotdata/inside_fi_fractions_s.txt' u 1:2:3 via k
print k,k_err,d,FIT_STDFIT

set term postscript eps enhanced color
set output 'plots/map_inside_fi_model_vs_dark_f.eps'
set xrange [0:1]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/inside_fi_model_vs_dark_f.txt'
unset table
set xrange [0:1]
set yrange [0:1]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions (based on visible galaxies)" font  ",14"
set ylabel "fraction of the line of sight inside finite infinity regions (based on dark matter)" font  ",12"
set xtics 0.1
set ytics 0.1
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image #, f_fract(x) lw 3 lt 1 notitle, x notitle
reset



set term postscript eps enhanced color
set output 'plots/map_inside_fi_model_vs_dark_s.eps'
set xrange [0:1]
set yrange [0:1]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/inside_fi_model_vs_dark_s.txt'
unset table
set xrange [0:1]
set yrange [0:1]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions (based on visible galaxies)" font  ",14"
set ylabel "fraction of the line of sight inside finite infinity regions (based on dark matter)" font  ",12"
set xtics 0.1
set ytics 0.1
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image #, f_fract(x) lw 3 lt 1 notitle, x notitle
reset




set print "plotdata/binfit_shift_indiv_real_lg.txt"
set fit errorvariables

f(x)=k*x+d

k=0
d=0

fit f(x) 'plotdata/bin_mock_real_lg.txt' u 1:2 via k,d
print k,d,k_err,d_err,FIT_STDFIT


set print "plotdata/binfit_shift_indiv_real_cmb.txt"
set fit errorvariables

f(x)=k*x+d

k=0
d=0

fit f(x) 'plotdata/bin_mock_real_cmb.txt' u 1:2 via k,d
print k,d,k_err,d_err,FIT_STDFIT








set print "plotdata/binfit_shift_indiv_0.txt"
set fit errorvariables

f(x)=k*x+d

k=0
d=0

do for [t=1:64] {
fit f(x) 'plotdata/bin_mock'.t.'_0.txt' u 1:2 via k,d
print k,d,k_err,d_err,FIT_STDFIT
}




set print "plotdata/binfit_shift_indiv_ts.txt"
set fit errorvariables

f(x)=k*x+d

k=0
d=0

do for [t=1:64] {
fit f(x) 'plotdata/bin_mock'.t.'_ts.txt' u 1:2 via k,d
print k,d,k_err,d_err,FIT_STDFIT
}




set print "plotdata/binfit_shift.txt"
set fit errorvariables


brlg(x)=k1*x+d1
brcmb(x)=k2*x+d2
bl(x)=k3*x+d3
bt(x)=k4*x+d4


fit brlg(x) 'plotdata/bins_shifted_0.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_0.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_0.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_0.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_1.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_1.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_1.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_1.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_2.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_2.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_2.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_2.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT


fit brlg(x) 'plotdata/bins_shifted_3.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_3.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_3.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_3.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT


fit brlg(x) 'plotdata/bins_shifted_4.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_4.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_4.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_4.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_5.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_5.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_5.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_5.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_6.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_6.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_6.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_6.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_7.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_7.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_7.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_7.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_8.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_8.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_8.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_8.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_9.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_9.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_9.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_9.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT

fit brlg(x) 'plotdata/bins_shifted_allcombo.txt' u 1:2 via k1,d1
print k1,d1,k1_err,d1_err,FIT_STDFIT
fit brcmb(x) 'plotdata/bins_shifted_allcombo.txt' u 1:3 via k2,d2
print k2,d2,k2_err,d2_err,FIT_STDFIT
fit bl(x) 'plotdata/bins_shifted_allcombo.txt' u 1:4 via k3,d3
print k3,d3,k3_err,d3_err,FIT_STDFIT
fit bt(x) 'plotdata/bins_shifted_allcombo.txt' u 1:5 via k4,d4
print k4,d4,k4_err,d4_err,FIT_STDFIT



set term postscript eps enhanced color
set output 'plots/finalresults_bins_lim_lg.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')

p 'test.dat' with image, "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:3 with histeps lw 5 lt 2 title '{/Symbol L}-CDM expectations', "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:4 with histeps lw 0.75 lt 2 notitle,  "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:5 with histeps lw 0.75 lt 2 notitle, "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:6 with histeps lw 5 lt 4 title 'differential expansion', "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:7 with histeps lw 0.75 lt 4 notitle,  "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:8 with histeps lw 0.75 lt 4 notitle, "plotdata/bin_results_plot3sigms_new_lg.txt" using 1:2 with histeps lw 7 lt 1 linecolor rgb "black" title 'observations'
reset



set term postscript eps enhanced color
set output 'plots/finalresults_bins_lim_cmb.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')

p 'test.dat' with image, "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:3 with histeps lw 5 lt 2 title '{/Symbol L}-CDM expectations', "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:4 with histeps lw 0.75 lt 2 notitle,  "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:5 with histeps lw 0.75 lt 2 notitle, "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:6 with histeps lw 5 lt 4 title 'differential expansion', "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:7 with histeps lw 0.75 lt 4 notitle,  "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:8 with histeps lw 0.75 lt 4 notitle, "plotdata/bin_results_plot3sigms_new_cmb.txt" using 1:2 with histeps lw 7 lt 1 linecolor rgb "black" title 'observations'
reset


set term postscript eps enhanced color
set output 'plots/finebin_ts_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_ts_all_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin_results_ts_all.txt" using 1:2 with histeps lt 1 lw 0.5 title 'differential expansion mock samples',  "plotdata/bin_results_ts_all.txt" using 1:3 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:4 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:5 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:6 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:7 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:8 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:9 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:10 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:11 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:12 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:13 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:14 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:15 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:16 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:17 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:18 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:19 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:20 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:21 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:22 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:23 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:24 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:25 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:26 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:27 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:28 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:29 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:30 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:31 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:32 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:33 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:34 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:35 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:36 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:37 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:38 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:39 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:40 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:41 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:42 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:43 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:44 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:45 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:46 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:47 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:48 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:49 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:50 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:51 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:52 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:53 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:54 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:55 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:56 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:57 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:58 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:59 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:60 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:61 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:62 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:63 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:64 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:65 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_ts_all.txt" using 1:66 with histeps lt 2 lw 5 title 'approximated timescape average'

reset





set term postscript eps enhanced color
set output 'plots/finebin_lcdm_selected.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_sim_lcdm_all_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, "plotdata/bin_results_0_all.txt" using 1:2 with histeps lt 1 lw 0.5 title '{/Symbol L}-CDM mock samples',  "plotdata/bin_results_0_all.txt" using 1:3 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:4 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:5 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:6 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:7 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:8 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:9 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:10 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:11 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:12 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:13 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:14 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:15 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:16 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:17 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:18 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:19 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:20 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:21 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:22 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:23 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:24 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:25 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:26 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:27 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:28 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:29 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:30 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:31 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:32 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:33 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:34 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:35 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:36 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:37 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:38 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:39 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:40 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:41 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:42 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:43 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:44 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:45 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:46 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:47 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:48 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:49 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:50 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:51 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:52 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:53 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:54 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:55 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:56 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:57 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:58 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:59 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:60 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:61 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:62 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:63 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:64 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:65 with histeps lt 1 lw 0.5 notitle, "plotdata/bin_results_0_all.txt" using 1:66 with histeps lt 2 lw 5 title '{/Symbol L}-CDM average'

reset






load 'plotdata/bin_results_plot3sigms_all_new.txt'
set term postscript eps enhanced color
set output 'plots/binfit_selected_cmb.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_cmb_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, k_0_av*x+d_0_av lw 5 lt 2 title '{/Symbol L}-CDM expectations', (k_0_av+k_scatter_0)*x+(d_0_av-d_scatter_0) lw 1 lt 2 notitle, (k_0_av-k_scatter_0)*x+(d_0_av+d_scatter_0) lw 1 lt 2 notitle, k_ts_av*x+d_ts_av lw 5 lt 4 title 'differential expansion', (k_ts_av+k_scatter_ts)*x+(d_ts_av-d_scatter_ts) lw 1 lt 4 notitle, (k_ts_av-k_scatter_ts)*x+(d_ts_av+d_scatter_ts) lw 1 lt 4 notitle,  k_real_av_cmb*x+d_real_av_cmb lw 5 lt 1 linecolor rgb "black" title 'observations (CMB frame)'
reset



set term postscript eps enhanced color
set output 'plots/binfit_selected_lg.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'plotdata/map_real_lg_weighted_selected.txt'
unset table
set xrange [0:1]
set yrange [0:2]
# unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#BBBBCC',\
                      30 '#5555AA',\
                      100 '#222288')
p 'test.dat' with image, k_0_av*x+d_0_av lw 5 lt 2 title '{/Symbol L}-CDM expectations', (k_0_av+k_scatter_0)*x+(d_0_av-d_scatter_0) lw 1 lt 2 notitle, (k_0_av-k_scatter_0)*x+(d_0_av+d_scatter_0) lw 1 lt 2 notitle, k_ts_av*x+d_ts_av lw 5 lt 4 title 'differential expansion', (k_ts_av+k_scatter_ts)*x+(d_ts_av-d_scatter_ts) lw 1 lt 4 notitle, (k_ts_av-k_scatter_ts)*x+(d_ts_av+d_scatter_ts) lw 1 lt 4 notitle,  k_real_av_lg*x+d_real_av_lg lw 5 lt 1 linecolor rgb "black" title 'observations (LG frame)'
reset



















