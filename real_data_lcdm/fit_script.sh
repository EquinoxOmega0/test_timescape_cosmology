set fit logfile 'output_analysis/scatter_logfile.txt'


# f(x) = a*x + b
# fit f(x) 'output/full_results_w.txt' u 1:2:4 via a,b
set print "output_analysis/fit_real.txt"


f1(x)=a1*x+b1
fit f1(x) 'output_analysis/results.txt' u 1:2:4 via a1,b1
print a1,b1,FIT_STDFIT


f2(x) = a2*x + b2
fit f2(x) 'output_analysis/results_limited.txt' u 1:2:4 via a2,b2
print a2,b2,FIT_STDFIT





