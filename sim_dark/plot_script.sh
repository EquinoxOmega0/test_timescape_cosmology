
# 
# 
# 
# # -------------------------------------------------------------
# 
set term postscript eps enhanced color
set output 'prepare/plots/lumfct_combo.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 1
set xlabel " r band mag " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set key font ",20"
set key top right


set style fill solid 0.8 border -1
set boxwidth 0.3 relative
offset0=0.04
offsetshift=0.03
plot 'prepare/lumfunction_norm_r.txt' using ($1-offset0+0*offsetshift):($2) title ' corrected real data'  with boxes lt 3,\
     'prepare/lumfunction_cc_bc_sfrc.txt' using ($1-offset0+1*offsetshift):($2) title ' selected mock galaxies' with boxes lt 1,\
     'prepare/lumfunction.txt' using ($1-offset0+2*offsetshift):($2) title ' all mock galaxies'  with boxes lt 2
reset







set term postscript eps enhanced color
set output 'prepare/plots/coldgas.eps'
set xrange [ -5 : -1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_c_o_l_d_g_a_s/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_coldgas.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/sfr.eps'
set xrange [ -9 : 0 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_s_f_r/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_sfr.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/age.eps'
set xrange [ 13 : 2 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 1
set xlabel " age [Gyr] " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/age.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/CMD.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset




set term postscript eps enhanced color
set output 'prepare/plots/mvir.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mvir.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset






set term postscript eps enhanced color
set output 'prepare/plots/mass.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mass.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset






set term postscript eps enhanced color
set output 'prepare/plots/bulge_disk_ratio.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_b_u_l_g_e/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_disk.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/bulge_stellar_mass_ratio.eps'
set xrange [ -4 : 0.1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_b_u_l_g_e/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_star.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/radii_gas_disk.eps'
set xrange [ -1 : 1.5 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_g_a_s/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_disk_gas.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset



set term postscript eps enhanced color
set output 'prepare/plots/ratio_gas_star_mass.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_g_a_s/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_gas_star.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/lumfunction.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " r band mag " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/lumfunction.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset









set term postscript eps enhanced color
set output 'prepare/plots/coldgas_cc.eps'
set xrange [ -5 : -1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_c_o_l_d_g_a_s/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_coldgas_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/sfr_cc.eps'
set xrange [ -9 : 0 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_s_f_r/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_sfr_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/age_cc.eps'
set xrange [ 13 : 2 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 1
set xlabel " age [Gyr] " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/age_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/CMD_cc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map_cc.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset




set term postscript eps enhanced color
set output 'prepare/plots/mvir_cc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mvir_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/mass_cc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mass_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset







set term postscript eps enhanced color
set output 'prepare/plots/bulge_disk_ratio_cc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_b_u_l_g_e/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_disk_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/bulge_stellar_mass_ratio_cc.eps'
set xrange [ -4 : 0.1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_b_u_l_g_e/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_star_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/radii_gas_disk_cc.eps'
set xrange [ -1 : 1.5 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_g_a_s/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_disk_gas_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset



set term postscript eps enhanced color
set output 'prepare/plots/ratio_gas_star_mass_cc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_g_a_s/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_gas_star_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset


set term postscript eps enhanced color
set output 'prepare/plots/lumfunction_cc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " r band mag " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/lumfunction_cc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset








set term postscript eps enhanced color
set output 'prepare/plots/coldgas_cc_bc.eps'
set xrange [ -5 : -1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_c_o_l_d_g_a_s/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_coldgas_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/sfr_cc_bc.eps'
set xrange [ -9 : 0 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_s_f_r/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_sfr_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/age_cc_bc.eps'
set xrange [ 13 : 2 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 1
set xlabel " age [Gyr] " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/age_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/CMD_cc_bc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map_cc_bc.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset




set term postscript eps enhanced color
set output 'prepare/plots/mvir_cc_bc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mvir_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/mass_cc_bc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mass_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset







set term postscript eps enhanced color
set output 'prepare/plots/bulge_disk_ratio_cc_bc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_b_u_l_g_e/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_disk_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/bulge_stellar_mass_ratio_cc_bc.eps'
set xrange [ -4 : 0.1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_b_u_l_g_e/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_star_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/radii_gas_disk_cc_bc.eps'
set xrange [ -1 : 1.5 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_g_a_s/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_disk_gas_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset



set term postscript eps enhanced color
set output 'prepare/plots/ratio_gas_star_mass_cc_bc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_g_a_s/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_gas_star_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset


set term postscript eps enhanced color
set output 'prepare/plots/lumfunction_cc_bc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " r band mag " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/lumfunction_cc_bc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset






set term postscript eps enhanced color
set output 'prepare/plots/coldgas_cc_bc_sfrc.eps'
set xrange [ -5 : -1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_c_o_l_d_g_a_s/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_coldgas_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/sfr_cc_bc_sfrc.eps'
set xrange [ -9 : 0 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_s_f_r/M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_sfr_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/age_cc_bc_sfrc.eps'
set xrange [ 13 : 2 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 1
set xlabel " age [Gyr] " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/age_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/CMD_cc_bc_sfrc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map_cc_bc_sfrc.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -24 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset




set term postscript eps enhanced color
set output 'prepare/plots/mvir_cc_bc_sfrc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_v_i_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mvir_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset





set term postscript eps enhanced color
set output 'prepare/plots/mass_cc_bc_sfrc.eps'
set xrange [ 0 : 4 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/mass_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset







set term postscript eps enhanced color
set output 'prepare/plots/bulge_disk_ratio_cc_bc_sfrc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_b_u_l_g_e/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_disk_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/bulge_stellar_mass_ratio_cc_bc_sfrc.eps'
set xrange [ -4 : 0.1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_b_u_l_g_e/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_bulge_star_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset




set term postscript eps enhanced color
set output 'prepare/plots/radii_gas_disk_cc_bc_sfrc.eps'
set xrange [ -1 : 1.5 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(R_g_a_s/R_d_i_s_k) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_disk_gas_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset



set term postscript eps enhanced color
set output 'prepare/plots/ratio_gas_star_mass_cc_bc_sfrc.eps'
set xrange [ -3 : 1 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " log_1_0(M_g_a_s/M_s_t_a_r) " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/log_gas_star_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset


set term postscript eps enhanced color
set output 'prepare/plots/lumfunction_cc_bc_sfrc.eps'
set xrange [ -24 : -18 ]
set yrange [ 0 :  ]
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set xtics 0.5
set xlabel " r band mag " font  ",24"
set ylabel " relative number density" font  ",24"
set mxtics 2 
set style fill solid 0.5
set key font ",20"
set key top right
plot   "prepare/lumfunction_cc_bc_sfrc.txt" smooth freq w boxes lc rgb"green" notitle #notitle  with histeps lw 5 lt 0
reset






set term postscript eps enhanced color
set output 'prepare/plots/CMD_selected.eps'
set xrange [ -25 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map_cc_bc_sfrc.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -25 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
# load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset



set term postscript eps enhanced color
set output 'prepare/plots/CMD_all.eps'
set xrange [ -25 : -18 ]
set yrange [ 0 : 1.2 ]
set table 'test.dat'
splot 'prepare/CMD_map.txt'
unset table
set pointsize 2
set xtics font ", 20" 
set ytics font ", 20" 
set mxtics 2
set mytics 2
set xrange [ -25 : -18 ]
set yrange [ 0 : 1.2 ]
set xtics 1
set ytics 0.2
set mxtics 2
set mytics 2
set xlabel " M_z [mag]" font  ",24"
set ylabel " g-r [mag]" font  ",24"
set key font ",20"
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      2 '#BBBBCC',\
                      4 '#5555AA',\
                      5 '#222288')
load 'prepare/redsequence_fit.txt'
p 'test.dat' with image #, cc1*(x*x)+cc2*x+cc3  lt -1 title "red sequence fit", cc1*(x*x)+cc2*x+cc3+3*c_rms lt 1 title "3- {/Symbol s} interval", cc1*(x*x)+cc2*x+cc3-3*c_rms lt 1 notitle
reset





