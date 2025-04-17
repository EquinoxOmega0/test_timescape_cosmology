
# 
# set term postscript eps enhanced color
# set output 'result_map_basic.eps'
# set xrange [0:1]
# set yrange [0:2]
# set isosample 200, 200
# set table 'test.dat'
# splot 'result_map.txt'
# unset table
# set xrange [0:1]
# set yrange [0:2]
# unset key
# set xlabel "" font  ",20"
# set ylabel "" font  ",20"
# unset xtics 
# unset ytics 
# unset colorbox
# set palette defined ( 0 '#FFFFFF',\
#                       1 '#000fff',\
#                       2 '#0090ff',\
#                       3 '#0fffee',\
#                       4 '#90ff70',\
#                       5 '#ffee00',\
#                       6 '#ff7000',\
#                       7 '#ee0000',\
#                       8 '#7f0000')
# p 'test.dat' with image
# 
# reset
# 




f(x) = a*x + b
fit f(x) 'output/results.txt' u 1:2 via a,b


set term postscript eps enhanced color
set output 'plots/result_map.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'output/result_map.txt'
unset table
set xrange [0:1]
set yrange [0:2]
unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#000fff',\
                      2 '#0090ff',\
                      3 '#0fffee',\
                      4 '#90ff70',\
                      5 '#ffee00',\
                      6 '#ff7000',\
                      7 '#ee0000',\
                      8 '#7f0000')
p 'test.dat' with image, 73 lt 4,a*x+b lt 1

reset


set term postscript eps enhanced color
set output 'plots/result_map_wighted.eps'
set xrange [0:1]
set yrange [0:2]
set isosample 200, 200
set table 'test.dat'
splot 'output/result_map_wighted.txt'
unset table
set xrange [0:1]
set yrange [0:2]
unset key
set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
set ylabel "relative individual Hubble parameter" font  ",20"
set xtics 0.1
set ytics 0.25
unset colorbox
set palette defined ( 0 '#FFFFFF',\
                      1 '#000fff',\
                      2 '#0090ff',\
                      3 '#0fffee',\
                      4 '#90ff70',\
                      5 '#ffee00',\
                      6 '#ff7000',\
                      7 '#ee0000',\
                      8 '#7f0000')
p 'test.dat' with image, 73 lt 4,a*x+b lt 1

reset


# f(x) = a*x + b
# fit f(x) 'results.txt' u 1:2 via a, b
# g(x) = a1*x + b1
# fit g(x) 'results_mn.txt' u 1:2 via a1, b1
# h(x) = a2*x + b2
# fit h(x) 'results_mts.txt' u 1:2 via a2, b2
# 
# 
# set term postscript eps enhanced color
# set output 'result_map_all.eps'
# set xrange [0:1]
# set yrange [0:200]
# set isosample 200, 200
# set table 'test.dat'
# splot 'result_map.txt'
# unset table
# set xrange [0:1]
# set yrange [0:200]
# 
# set xlabel "fraction of the line of sight inside finite infinity regions" font  ",20"
# set ylabel "individual Hubble parameter [km/s/Mpc]" font  ",20"
# set xtics 0.1
# set ytics 25
# unset colorbox
# set palette defined ( 0 '#FFFFFF',\
#                       1 '#000fff',\
#                       2 '#0090ff',\
#                       3 '#0fffee',\
#                       4 '#90ff70',\
#                       5 '#ffee00',\
#                       6 '#ff7000',\
#                       7 '#ee0000',\
#                       8 '#7f0000')
# p 'test.dat' with image,a*x+b lt 1 title "best fit on data",a1*x+b1 lt 4 title "expectation from { /Symbol L }-CDM model",a2*x+b2 lt 7 title "expectation from timescape model"
# 
# reset
