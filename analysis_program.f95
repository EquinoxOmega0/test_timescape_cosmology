PROGRAM dataanalysis
IMPLICIT NONE

INTEGER, parameter :: n_grid = 20

double precision :: PI,dummy,help_var,help_count,mill
integer :: io_err,n,i,ii,iii,n_max_f,n_max_l,n_id,hcount,doseed,n_lcdm
character(20) :: id_str

DOUBLE PRECISION ::gasdev
INTEGER (kind=16) :: factorial
integer, dimension(0:1000) :: prob_dist
double precision, dimension(0:1000) :: int_prob_dist

double precision, dimension(1:10) :: bin_cmb,bin_lg,bin_lcdm_av,bin_lcdm_up,bin_lcdm_low,bin_lcdm_sigma
double precision, dimension(1:10) :: bin_ts_av,bin_ts_up,bin_ts_low,bin_ts_sigma
double precision, dimension(1:10) :: bin_help10,bin_weight_counter1,bin_weight_counter2

double precision, dimension(1:10) :: bin_cmb_sel,bin_lg_sel,bin_lcdm_av_sel,bin_lcdm_up_sel,bin_lcdm_low_sel
double precision, dimension(1:10) :: bin_ts_av_sel,bin_ts_up_sel,bin_ts_low_sel,bin_ts_sigma_sel,bin_lcdm_sigma_sel
double precision, dimension(1:10) :: bin_help10_sel,bin_weight_counter1_sel,bin_weight_counter2_sel

double precision, dimension(1:10) :: bin_dev_lcdm_f_lg,bin_dev_lcdm_f_cmb,bin_dev_ts_f_lg,bin_dev_ts_f_cmb
double precision, dimension(1:10) :: bin_dev_lcdm_s_lg,bin_dev_lcdm_s_cmb,bin_dev_ts_s_lg,bin_dev_ts_s_cmb
double precision, dimension(1:10) :: bin_prop_lcdm_f_lg,bin_prop_lcdm_f_cmb,bin_prop_ts_f_lg,bin_prop_ts_f_cmb
double precision, dimension(1:10) :: bin_prop_lcdm_s_lg,bin_prop_lcdm_s_cmb,bin_prop_ts_s_lg,bin_prop_ts_s_cmb
double precision, dimension(1:10) :: bin_like_lcdm_f_lg,bin_like_lcdm_f_cmb,bin_like_ts_f_lg,bin_like_ts_f_cmb
double precision, dimension(1:10) :: bin_like_lcdm_s_lg,bin_like_lcdm_s_cmb,bin_like_ts_s_lg,bin_like_ts_s_cmb

double precision, dimension(1:64) :: a_lcdm_f,b_lcdm_f,a_lcdm_s,b_lcdm_s,a_ts_f,b_ts_f,a_ts_s,b_ts_s
double precision, dimension(1:64) :: aerr_lcdm_f,berr_lcdm_f,aerr_lcdm_s,berr_lcdm_s
double precision, dimension(1:64) :: aerr_ts_f,berr_ts_f,aerr_ts_s,berr_ts_s
double precision, dimension(1:64) :: std_lcdm_f,std_lcdm_s,std_ts_f,std_ts_s
double precision :: a_real_cmb_f,b_real_cmb_f,a_real_lg_f,b_real_lg_f,a_real_cmb_s,b_real_cmb_s,a_real_lg_s,b_real_lg_s
double precision :: aerr_real_cmb_f,berr_real_cmb_f,aerr_real_lg_f,berr_real_lg_f
double precision :: aerr_real_cmb_s,berr_real_cmb_s,aerr_real_lg_s,berr_real_lg_s
double precision :: std_real_cmb_f,std_real_cmb_s,std_real_lg_f,std_real_lg_s
double precision :: av_a_lcdm_f,av_b_lcdm_f,av_a_ts_f,av_b_ts_f
double precision :: sigma_a_lcdm_f,sigma_b_lcdm_f,sigma_a_ts_f,sigma_b_ts_f
double precision :: av_a_lcdm_s,av_b_lcdm_s,av_a_ts_s,av_b_ts_s
double precision :: sigma_a_lcdm_s,sigma_b_lcdm_s,sigma_a_ts_s,sigma_b_ts_s
double precision :: w_sum_lcdm_f,w_sum_lcdm_s,w_sum_ts_f,w_sum_ts_s
double precision ::  k_dev_lcdm_f_lg,k_dev_lcdm_f_cmb,k_dev_lcdm_s_lg,k_dev_lcdm_s_cmb
double precision :: k_dev_ts_f_lg,k_dev_ts_f_cmb,k_dev_ts_s_lg,k_dev_ts_s_cmb
double precision ::  d_dev_lcdm_f_lg,d_dev_lcdm_f_cmb,d_dev_lcdm_s_lg,d_dev_lcdm_s_cmb 
double precision ::  d_dev_ts_f_lg,d_dev_ts_f_cmb,d_dev_ts_s_lg,d_dev_ts_s_cmb
double precision ::  k_prop_lcdm_f_lg,k_prop_lcdm_f_cmb,k_prop_lcdm_s_lg,k_prop_lcdm_s_cmb
double precision :: k_prop_ts_f_lg,k_prop_ts_f_cmb,k_prop_ts_s_lg,k_prop_ts_s_cmb
double precision ::  d_prop_lcdm_f_lg,d_prop_lcdm_f_cmb,d_prop_lcdm_s_lg,d_prop_lcdm_s_cmb 
double precision ::  d_prop_ts_f_lg,d_prop_ts_f_cmb,d_prop_ts_s_lg,d_prop_ts_s_cmb
double precision ::  k_like_lcdm_f_lg,k_like_lcdm_f_cmb,k_like_lcdm_s_lg,k_like_lcdm_s_cmb
double precision :: k_like_ts_f_lg,k_like_ts_f_cmb,k_like_ts_s_lg,k_like_ts_s_cmb
double precision ::  d_like_lcdm_f_lg,d_like_lcdm_f_cmb,d_like_lcdm_s_lg,d_like_lcdm_s_cmb 
double precision ::  d_like_ts_f_lg,d_like_ts_f_cmb,d_like_ts_s_lg,d_like_ts_s_cmb

double precision, dimension(1:n_grid,1:n_grid) :: map_count_cmb_f,map_count_lg_f,map_count_lcdm_f,map_count_ts_f
double precision, dimension(1:n_grid,1:n_grid) :: map_lambda_lcdm_lg_f,map_lambda_lcdm_cmb_f
double precision, dimension(1:n_grid,1:n_grid) :: map_lambda_ts_lg_f,map_lambda_ts_cmb_f
double precision, dimension(1:n_grid,1:n_grid) :: map_prop_lcdm_lg_f,map_prop_lcdm_cmb_f,map_prop_ts_lg_f,map_prop_ts_cmb_f
double precision, dimension(1:n_grid,1:n_grid) :: map_count_cmb_s,map_count_lg_s,map_count_lcdm_s,map_count_ts_s
double precision, dimension(1:n_grid,1:n_grid) :: map_lambda_lcdm_lg_s,map_lambda_lcdm_cmb_s
double precision, dimension(1:n_grid,1:n_grid) :: map_lambda_ts_lg_s,map_lambda_ts_cmb_s
double precision, dimension(1:n_grid,1:n_grid) :: map_prop_lcdm_lg_s,map_prop_lcdm_cmb_s,map_prop_ts_lg_s,map_prop_ts_cmb_s
integer (kind=16) :: help_k
real (kind=16) :: help_lambda
double precision :: n_count_cmb_f,n_count_lg_f,n_count_lcdm_f,n_count_ts_f,dummy_var
double precision :: n_count_cmb_s,n_count_lg_s,n_count_lcdm_s,n_count_ts_s,hc1,hc2,hc3,hc4
double precision :: av_prop_map_lcdm_lg_f,av_prop_map_ts_lg_f,av_prop_map_lcdm_cmb_f,av_prop_map_ts_cmb_f
double precision :: av_prop_map_lcdm_lg_s,av_prop_map_ts_lg_s,av_prop_map_lcdm_cmb_s,av_prop_map_ts_cmb_s
double precision :: chi2_map_lcdm_lg_f,chi2_map_ts_lg_f,chi2_map_lcdm_cmb_f,chi2_map_ts_cmb_f
double precision :: chi2_map_lcdm_lg_s,chi2_map_ts_lg_s,chi2_map_lcdm_cmb_s,chi2_map_ts_cmb_s

double precision, dimension(0:200,0:200) :: result_map
double precision :: help_x2,help_y2,bin_width10,bin_width20,bin_width100
integer :: help_x,help_y


! random seed
 CALL SYSTEM_CLOCK(hcount)
 hcount=hcount-INT(hcount/100000)*100000
 CALL srand(hcount) 
doseed=0
 
 IF (doseed==1) THEN
 
 DO i=0,1000 
 prob_dist(i)=0
 int_prob_dist(i)=0.D0
 END DO
 
DO i=1,100000000
help_var=gasdev(0)
IF (help_var<0.D0) THEN
help_var=-help_var
END IF

DO ii=0,999
IF ((help_var>=(DBLE(ii)/100.D0)).AND.(help_var<(DBLE(ii+1)/100.D0))) THEN
prob_dist(ii)=prob_dist(ii)+1
END IF
END DO

IF (help_var>=100.D0) THEN
prob_dist(1000)=prob_dist(1000)+1
END IF

END DO

mill=100000000.D0
int_prob_dist(1000)=DBLE(prob_dist(1000))/mill



DO i=0,999 
int_prob_dist(999-i)=int_prob_dist(1000-i)+(DBLE(prob_dist(999-i))/mill)
END DO

OPEN(50,file='int_prob_dist.txt')
WRITE(50,*) int_prob_dist(0:1000)
 CLOSE(50)

 ELSE
OPEN(50,file='int_prob_dist.txt')
READ(50,*) int_prob_dist(0:1000)
 CLOSE(50) 
 
 END IF


! define constants
PI=ACOS(-1.D0)



OPEN(50,file='binfit.txt')
DO i=1,64
READ(50,*)  a_lcdm_f(i),b_lcdm_f(i),aerr_lcdm_f(i),berr_lcdm_f(i),std_lcdm_f(i)
END DO
DO i=1,64
READ(50,*)  a_lcdm_s(i),b_lcdm_s(i),aerr_lcdm_s(i),berr_lcdm_s(i),std_lcdm_s(i)
END DO
DO i=1,64
READ(50,*)  a_ts_f(i),b_ts_f(i),aerr_ts_f(i),berr_ts_f(i),std_ts_f(i)
END DO
DO i=1,64
READ(50,*)  a_ts_s(i),b_ts_s(i),aerr_ts_s(i),berr_ts_s(i),std_ts_s(i)
END DO
READ(50,*)  a_real_lg_f,b_real_lg_f,aerr_real_lg_f,berr_real_lg_f,std_real_lg_f
READ(50,*)  a_real_cmb_f,b_real_cmb_f,aerr_real_cmb_f,berr_real_cmb_f,std_real_cmb_f
READ(50,*)  a_real_lg_s,b_real_lg_s,aerr_real_lg_s,berr_real_lg_s,std_real_lg_s
READ(50,*)  a_real_cmb_s,b_real_cmb_s,aerr_real_cmb_s,berr_real_cmb_s,std_real_cmb_s
 CLOSE(50)


OPEN(50,file='plotdata/bin10_res.txt')
DO i=1,10
READ(50,*) bin_help10(i),bin_cmb(i),bin_lg(i),bin_lcdm_av(i),bin_lcdm_up(i),bin_lcdm_low(i),&
            bin_ts_av(i),bin_ts_up(i),bin_ts_low(i)
END DO
 CLOSE(50)

OPEN(50,file='plotdata/bin10_res_selected.txt')
DO i=1,10
READ(50,*) bin_help10_sel(i),bin_cmb_sel(i),bin_lg_sel(i),bin_lcdm_av_sel(i),bin_lcdm_up_sel(i),&
            bin_lcdm_low_sel(i),bin_ts_av_sel(i),bin_ts_up_sel(i),bin_ts_low_sel(i)
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_lcdm_f.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_lcdm_f(i,ii)
END DO
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_ts_f.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_ts_f(i,ii)
END DO
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_real_cmb_f.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_cmb_f(i,ii)
END DO
END DO
 CLOSE(50)

 
OPEN(50,file='plotdata/map_poisson_real_lg_f.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_lg_f(i,ii)
END DO
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_lcdm_s.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_lcdm_s(i,ii)
END DO
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_ts_s.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_ts_s(i,ii)
END DO
END DO
 CLOSE(50)


OPEN(50,file='plotdata/map_poisson_real_cmb_s.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_cmb_s(i,ii)
END DO
END DO
 CLOSE(50)

 
OPEN(50,file='plotdata/map_poisson_real_lg_s.txt')
DO i=1,20
DO ii=1,20
READ(50,*) dummy_var,dummy_var,map_count_lg_s(i,ii)
END DO
END DO
 CLOSE(50)


 
! weighted average and sigma for lin reg fits
 
av_a_lcdm_f=0.D0
av_b_lcdm_f=0.D0
av_a_ts_f=0.D0
av_b_ts_f=0.D0
sigma_a_lcdm_f=0.D0
sigma_b_lcdm_f=0.D0
sigma_a_ts_f=0.D0
sigma_b_ts_f=0.D0
av_a_lcdm_s=0.D0
av_b_lcdm_s=0.D0
av_a_ts_s=0.D0
av_b_ts_s=0.D0
sigma_a_lcdm_s=0.D0
sigma_b_lcdm_s=0.D0
sigma_a_ts_s=0.D0
sigma_b_ts_s=0.D0
w_sum_lcdm_f=0.D0
w_sum_lcdm_s=0.D0
w_sum_ts_f=0.D0
w_sum_ts_s=0.D0

DO i=1,64
w_sum_lcdm_f=w_sum_lcdm_f+(1.D0/(std_lcdm_f(i)**2))
w_sum_lcdm_s=w_sum_lcdm_s+(1.D0/(std_lcdm_s(i)**2))
w_sum_ts_f=w_sum_ts_f+(1.D0/(std_ts_f(i)**2))
w_sum_ts_s=w_sum_ts_s+(1.D0/(std_ts_s(i)**2))
av_a_lcdm_f=av_a_lcdm_f+a_lcdm_f(i)*(1.D0/(std_lcdm_f(i)**2))
av_b_lcdm_f=av_b_lcdm_f+b_lcdm_f(i)*(1.D0/(std_lcdm_f(i)**2))
av_a_ts_f=av_a_ts_f+a_ts_f(i)*(1.D0/(std_ts_f(i)**2))
av_b_ts_f=av_b_ts_f+b_ts_f(i)*(1.D0/(std_ts_f(i)**2))
av_a_lcdm_s=av_a_lcdm_s+a_lcdm_s(i)*(1.D0/(std_lcdm_s(i)**2))
av_b_lcdm_s=av_b_lcdm_s+b_lcdm_s(i)*(1.D0/(std_lcdm_s(i)**2))
av_a_ts_s=av_a_ts_s+a_ts_s(i)*(1.D0/(std_ts_s(i)**2))
av_b_ts_s=av_b_ts_s+b_ts_s(i)*(1.D0/(std_ts_s(i)**2))
END DO

  
av_a_lcdm_f=av_a_lcdm_f/w_sum_lcdm_f
av_b_lcdm_f=av_b_lcdm_f/w_sum_lcdm_f
av_a_ts_f=av_a_ts_f/w_sum_ts_f
av_b_ts_f=av_b_ts_f/w_sum_ts_f 
av_a_lcdm_s=av_a_lcdm_s/w_sum_lcdm_s
av_b_lcdm_s=av_b_lcdm_s/w_sum_lcdm_s
av_a_ts_s=av_a_ts_s/w_sum_ts_s
av_b_ts_s=av_b_ts_s/w_sum_ts_s
  
  
  
DO i=1,64
sigma_a_lcdm_f=((av_a_lcdm_f-a_lcdm_f(i))*(1.D0/(std_lcdm_f(i))))**2
sigma_b_lcdm_f=((av_b_lcdm_f-b_lcdm_f(i))*(1.D0/(std_lcdm_f(i))))**2
sigma_a_ts_f=((av_a_ts_f-a_ts_f(i))*(1.D0/(std_ts_f(i))))**2
sigma_b_ts_f=((av_b_ts_f-b_ts_f(i))*(1.D0/(std_ts_f(i))))**2
sigma_a_lcdm_s=((av_a_lcdm_s-a_lcdm_s(i))*(1.D0/(std_lcdm_s(i))))**2
sigma_b_lcdm_s=((av_b_lcdm_s-b_lcdm_s(i))*(1.D0/(std_lcdm_s(i))))**2
sigma_a_ts_s=((av_a_ts_s-a_ts_s(i))*(1.D0/(std_ts_s(i))))**2
sigma_b_ts_s=((av_b_ts_s-b_ts_s(i))*(1.D0/(std_ts_s(i))))**2
END DO
  
  
sigma_a_lcdm_f= SQRT(sigma_a_lcdm_f/w_sum_lcdm_f)
sigma_b_lcdm_f= SQRT(sigma_b_lcdm_f/w_sum_lcdm_f)
sigma_a_ts_f= SQRT(sigma_a_ts_f/w_sum_ts_f)
sigma_b_ts_f= SQRT(sigma_b_ts_f/w_sum_ts_f)
sigma_a_lcdm_s= SQRT(sigma_a_lcdm_s/w_sum_lcdm_s)
sigma_b_lcdm_s= SQRT(sigma_b_lcdm_s/w_sum_lcdm_s)
sigma_a_ts_s= SQRT(sigma_a_ts_s/w_sum_ts_s)
sigma_b_ts_s= SQRT(sigma_b_ts_s/w_sum_ts_s)
  
  
  k_dev_lcdm_f_lg=ABS((a_real_lg_f-av_a_lcdm_f)/sigma_a_lcdm_f)
  k_dev_lcdm_f_cmb=ABS((a_real_cmb_f-av_a_lcdm_f)/sigma_a_lcdm_f)
  k_dev_lcdm_s_lg=ABS((a_real_lg_s-av_a_lcdm_s)/sigma_a_lcdm_s)
  k_dev_lcdm_s_cmb=ABS((a_real_cmb_s-av_a_lcdm_s)/sigma_a_lcdm_s)
  k_dev_ts_f_lg=ABS((a_real_lg_f-av_a_ts_f)/sigma_a_ts_f)
  k_dev_ts_f_cmb=ABS((a_real_cmb_f-av_a_ts_f)/sigma_a_ts_f)
  k_dev_ts_s_lg=ABS((a_real_lg_s-av_a_ts_s)/sigma_a_ts_s)
  k_dev_ts_s_cmb=ABS((a_real_cmb_s-av_a_ts_s)/sigma_a_ts_s)
  d_dev_lcdm_f_lg=ABS((b_real_lg_f-av_b_lcdm_f)/sigma_b_lcdm_f)
  d_dev_lcdm_f_cmb=ABS((b_real_cmb_f-av_b_lcdm_f)/sigma_b_lcdm_f)
  d_dev_lcdm_s_lg=ABS((b_real_lg_s-av_b_lcdm_s)/sigma_b_lcdm_s)
  d_dev_lcdm_s_cmb=ABS((b_real_cmb_s-av_b_lcdm_s)/sigma_b_lcdm_s)
  d_dev_ts_f_lg=ABS((b_real_lg_f-av_b_ts_f)/sigma_b_ts_f)
  d_dev_ts_f_cmb=ABS((b_real_cmb_f-av_b_ts_f)/sigma_b_ts_f)
  d_dev_ts_s_lg=ABS((b_real_lg_s-av_b_ts_s)/sigma_b_ts_s)
  d_dev_ts_s_cmb=ABS((b_real_cmb_s-av_b_ts_s)/sigma_b_ts_s)
  


  
IF (k_dev_lcdm_f_lg<10.D0) THEN
k_prop_lcdm_f_lg=int_prob_dist(NINT(k_dev_lcdm_f_lg*100.D0))
ELSE
k_prop_lcdm_f_lg=0.D0
END IF
IF (k_dev_lcdm_f_cmb<10.D0) THEN
k_prop_lcdm_f_cmb=int_prob_dist(NINT(k_dev_lcdm_f_cmb*100.D0))
ELSE
k_prop_lcdm_f_cmb=0.D0
END IF


IF (k_dev_lcdm_s_lg<10.D0) THEN
k_prop_lcdm_s_lg=int_prob_dist(NINT(k_dev_lcdm_s_lg*100.D0))
ELSE
k_prop_lcdm_s_lg=0.D0
END IF
IF (k_dev_lcdm_s_cmb<10.D0) THEN
k_prop_lcdm_s_cmb=int_prob_dist(NINT(k_dev_lcdm_s_cmb*100.D0))
ELSE
k_prop_lcdm_s_cmb=0.D0
END IF



  
IF (k_dev_ts_f_lg<10.D0) THEN
k_prop_ts_f_lg=int_prob_dist(NINT(k_dev_ts_f_lg*100.D0))
ELSE
k_prop_ts_f_lg=0.D0
END IF
IF (k_dev_ts_f_cmb<10.D0) THEN
k_prop_ts_f_cmb=int_prob_dist(NINT(k_dev_ts_f_cmb*100.D0))
ELSE
k_prop_ts_f_cmb=0.D0
END IF


IF (k_dev_ts_s_lg<10.D0) THEN
k_prop_ts_s_lg=int_prob_dist(NINT(k_dev_ts_s_lg*100.D0))
ELSE
k_prop_ts_s_lg=0.D0
END IF
IF (k_dev_ts_s_cmb<10.D0) THEN
k_prop_ts_s_cmb=int_prob_dist(NINT(k_dev_ts_s_cmb*100.D0))
ELSE
k_prop_ts_s_cmb=0.D0
END IF



IF (d_dev_lcdm_f_lg<10.D0) THEN
d_prop_lcdm_f_lg=int_prob_dist(NINT(d_dev_lcdm_f_lg*100.D0))
ELSE
d_prop_lcdm_f_lg=0.D0
END IF
IF (d_dev_lcdm_f_cmb<10.D0) THEN
d_prop_lcdm_f_cmb=int_prob_dist(NINT(d_dev_lcdm_f_cmb*100.D0))
ELSE
d_prop_lcdm_f_cmb=0.D0
END IF


IF (d_dev_lcdm_s_lg<10.D0) THEN
d_prop_lcdm_s_lg=int_prob_dist(NINT(d_dev_lcdm_s_lg*100.D0))
ELSE
d_prop_lcdm_s_lg=0.D0
END IF
IF (d_dev_lcdm_s_cmb<10.D0) THEN
d_prop_lcdm_s_cmb=int_prob_dist(NINT(d_dev_lcdm_s_cmb*100.D0))
ELSE
d_prop_lcdm_s_cmb=0.D0
END IF

  
IF (d_dev_ts_f_lg<10.D0) THEN
d_prop_ts_f_lg=int_prob_dist(NINT(d_dev_ts_f_lg*100.D0))
ELSE
d_prop_ts_f_lg=0.D0
END IF
IF (d_dev_ts_f_cmb<10.D0) THEN
d_prop_ts_f_cmb=int_prob_dist(NINT(d_dev_ts_f_cmb*100.D0))
ELSE
d_prop_ts_f_cmb=0.D0
END IF


IF (d_dev_ts_s_lg<10.D0) THEN
d_prop_ts_s_lg=int_prob_dist(NINT(d_dev_ts_s_lg*100.D0))
ELSE
d_prop_ts_s_lg=0.D0
END IF
IF (d_dev_ts_s_cmb<10.D0) THEN
d_prop_ts_s_cmb=int_prob_dist(NINT(d_dev_ts_s_cmb*100.D0))
ELSE
d_prop_ts_s_cmb=0.D0
END IF

! 
k_like_lcdm_f_lg=k_prop_lcdm_f_lg/(k_prop_lcdm_f_lg+k_prop_ts_f_lg)
k_like_lcdm_f_cmb=k_prop_lcdm_f_cmb/(k_prop_lcdm_f_cmb+k_prop_ts_f_cmb)
k_like_lcdm_s_lg=k_prop_lcdm_s_lg/(k_prop_lcdm_s_lg+k_prop_ts_s_lg)
k_like_lcdm_s_cmb=k_prop_lcdm_s_cmb/(k_prop_lcdm_s_cmb+k_prop_ts_s_cmb)
k_like_ts_f_lg=k_prop_ts_f_lg/(k_prop_lcdm_f_lg+k_prop_ts_f_lg)
k_like_ts_f_cmb=k_prop_ts_f_cmb/(k_prop_lcdm_f_cmb+k_prop_ts_f_cmb)
k_like_ts_s_lg=k_prop_ts_s_lg/(k_prop_lcdm_s_lg+k_prop_ts_s_lg)
k_like_ts_s_cmb=k_prop_ts_s_cmb/(k_prop_lcdm_s_cmb+k_prop_ts_s_cmb)

d_like_lcdm_f_lg=d_prop_lcdm_f_lg/(d_prop_lcdm_f_lg+d_prop_ts_f_lg)
d_like_lcdm_f_cmb=d_prop_lcdm_f_cmb/(d_prop_lcdm_f_cmb+d_prop_ts_f_cmb)
d_like_lcdm_s_lg=d_prop_lcdm_s_lg/(d_prop_lcdm_s_lg+d_prop_ts_s_lg)
d_like_lcdm_s_cmb=d_prop_lcdm_s_cmb/(d_prop_lcdm_s_cmb+d_prop_ts_s_cmb)
d_like_ts_f_lg=d_prop_ts_f_lg/(d_prop_lcdm_f_lg+d_prop_ts_f_lg)
d_like_ts_f_cmb=d_prop_ts_f_cmb/(d_prop_lcdm_f_cmb+d_prop_ts_f_cmb)
d_like_ts_s_lg=d_prop_ts_s_lg/(d_prop_lcdm_s_lg+d_prop_ts_s_lg)
d_like_ts_s_cmb=d_prop_ts_s_cmb/(d_prop_lcdm_s_cmb+d_prop_ts_s_cmb)




OPEN(50,file='analysis/gradient_data.txt')
WRITE(50,*) 'Full data:'
WRITE(50,*) 'reference frame; theory ; obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
WRITE(50,*) 'LG  ','LCDM      ', a_real_lg_f, av_a_lcdm_f, sigma_a_lcdm_f, k_dev_lcdm_f_lg, k_prop_lcdm_f_lg, k_like_lcdm_f_lg
WRITE(50,*) 'LG  ','Timescape ', a_real_lg_f, av_a_ts_f, sigma_a_ts_f, k_dev_ts_f_lg, k_prop_ts_f_lg, k_like_ts_f_lg
WRITE(50,*) 'CMB ','LCDM      ', a_real_cmb_f, av_a_lcdm_f, sigma_a_lcdm_f, k_dev_lcdm_f_cmb, k_prop_lcdm_f_cmb, k_like_lcdm_f_cmb
WRITE(50,*) 'CMB ','Timescape ', a_real_cmb_f, av_a_ts_f, sigma_a_ts_f, k_dev_ts_f_cmb, k_prop_ts_f_cmb, k_like_ts_f_cmb
WRITE(50,*) 'Selected data:'
WRITE(50,*) 'reference frame; theory ; obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
WRITE(50,*) 'LG  ','LCDM      ', a_real_lg_s, av_a_lcdm_s, sigma_a_lcdm_s, k_dev_lcdm_s_lg, k_prop_lcdm_s_lg, k_like_lcdm_s_lg
WRITE(50,*) 'LG  ','Timescape ', a_real_lg_s, av_a_ts_s, sigma_a_ts_s, k_dev_ts_s_lg, k_prop_ts_s_lg, k_like_ts_s_lg
WRITE(50,*) 'CMB ','LCDM      ', a_real_cmb_s, av_a_lcdm_s, sigma_a_lcdm_s, k_dev_lcdm_s_cmb, k_prop_lcdm_s_cmb, k_like_lcdm_s_cmb
WRITE(50,*) 'CMB ','Timescape ', a_real_cmb_s, av_a_ts_s, sigma_a_ts_s, k_dev_ts_s_cmb, k_prop_ts_s_cmb, k_like_ts_s_cmb
CLOSE(50)


OPEN(50,file='plotdata/k_fit_plot_help.txt')
WRITE(50,*) 'fit_lcdm_f_av(x) = ',av_a_lcdm_f,'*x +',av_b_lcdm_f
WRITE(50,*) 'fit_lcdm_f_s1(x) = ',(av_a_lcdm_f+3.D0*sigma_a_lcdm_f),'*x +',(av_b_lcdm_f-3.D0*sigma_b_lcdm_f)
WRITE(50,*) 'fit_lcdm_f_s2(x) = ',(av_a_lcdm_f-3.D0*sigma_a_lcdm_f),'*x +',(av_b_lcdm_f+3.D0*sigma_b_lcdm_f)
WRITE(50,*) 'fit_ts_f_av(x) = ',av_a_ts_f,'*x +',av_b_ts_f
WRITE(50,*) 'fit_ts_f_s1(x) = ',(av_a_ts_f+3.D0*sigma_a_ts_f),'*x +',(av_b_ts_f-3.D0*sigma_b_ts_f)
WRITE(50,*) 'fit_ts_f_s2(x) = ',(av_a_ts_f-3.D0*sigma_a_ts_f),'*x +',(av_b_ts_f+3.D0*sigma_b_ts_f)
WRITE(50,*) 'fit_lcdm_s_av(x) = ',av_a_lcdm_s,'*x +',av_b_lcdm_s
WRITE(50,*) 'fit_lcdm_s_s1(x) = ',(av_a_lcdm_s+3.D0*sigma_a_lcdm_s),'*x +',(av_b_lcdm_s-3.D0*sigma_b_lcdm_s)
WRITE(50,*) 'fit_lcdm_s_s2(x) = ',(av_a_lcdm_s-3.D0*sigma_a_lcdm_s),'*x +',(av_b_lcdm_s+3.D0*sigma_b_lcdm_s)
WRITE(50,*) 'fit_ts_s_av(x) = ',av_a_ts_s,'*x +',av_b_ts_s
WRITE(50,*) 'fit_ts_s_s1(x) = ',(av_a_ts_s+3.D0*sigma_a_ts_s),'*x +',(av_b_ts_s-3.D0*sigma_b_ts_s)
WRITE(50,*) 'fit_ts_s_s2(x) = ',(av_a_ts_s-3.D0*sigma_a_ts_s),'*x +',(av_b_ts_s+3.D0*sigma_b_ts_s)
WRITE(50,*) 'fit_real_f_cmb(x) = ',a_real_cmb_f,'*x +',b_real_cmb_f
WRITE(50,*) 'fit_real_f_lg(x) = ',a_real_lg_f,'*x +',b_real_lg_f
WRITE(50,*) 'fit_real_s_cmb(x) = ',a_real_cmb_s,'*x +',b_real_cmb_s
WRITE(50,*) 'fit_real_s_lg(x) = ',a_real_lg_s,'*x +',b_real_lg_s
CLOSE(50)







DO i=1,10
bin_dev_lcdm_f_lg(i)=ABS((bin_lg(i)-bin_lcdm_av(i))/(bin_lcdm_up(i)-bin_lcdm_av(i)))
bin_dev_lcdm_f_cmb(i)=ABS((bin_cmb(i)-bin_lcdm_av(i))/(bin_lcdm_up(i)-bin_lcdm_av(i)))
bin_dev_lcdm_s_lg(i)=ABS((bin_lg_sel(i)-bin_lcdm_av_sel(i))/(bin_lcdm_up_sel(i)-bin_lcdm_av_sel(i)))
bin_dev_lcdm_s_cmb(i)=ABS((bin_cmb_sel(i)-bin_lcdm_av_sel(i))/(bin_lcdm_up_sel(i)-bin_lcdm_av_sel(i)))
bin_dev_ts_f_lg(i)=ABS((bin_lg(i)-bin_ts_av(i))/(bin_ts_up(i)-bin_ts_av(i)))
bin_dev_ts_f_cmb(i)=ABS((bin_cmb(i)-bin_ts_av(i))/(bin_ts_up(i)-bin_ts_av(i)))
bin_dev_ts_s_lg(i)=ABS((bin_lg_sel(i)-bin_ts_av_sel(i))/(bin_ts_up_sel(i)-bin_ts_av_sel(i)))
bin_dev_ts_s_cmb(i)=ABS((bin_cmb_sel(i)-bin_ts_av_sel(i))/(bin_ts_up_sel(i)-bin_ts_av_sel(i)))

IF (isnan(bin_dev_lcdm_f_lg(i))) THEN
bin_dev_lcdm_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_lcdm_f_cmb(i))) THEN
bin_dev_lcdm_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_lcdm_s_lg(i))) THEN
bin_dev_lcdm_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_lcdm_s_cmb(i))) THEN
bin_dev_lcdm_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_ts_f_lg(i))) THEN
bin_dev_ts_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_ts_f_cmb(i))) THEN
bin_dev_ts_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_ts_s_lg(i))) THEN
bin_dev_ts_f_lg(i)=10000000.D0
ENDIF
IF (isnan(bin_dev_ts_s_cmb(i))) THEN
bin_dev_ts_f_lg(i)=10000000.D0
ENDIF

END DO


DO i=1,10

IF (bin_dev_lcdm_f_lg(i)<10.D0) THEN
bin_prop_lcdm_f_lg(i)=int_prob_dist(NINT(bin_dev_lcdm_f_lg(i)*100.D0))
ELSE
bin_prop_lcdm_f_lg(i)=0.D0
END IF

IF (bin_dev_lcdm_f_cmb(i)<10.D0) THEN
bin_prop_lcdm_f_cmb(i)=int_prob_dist(NINT(bin_dev_lcdm_f_cmb(i)*100.D0))
ELSE
bin_prop_lcdm_f_cmb(i)=0.D0
END IF

IF (bin_dev_lcdm_s_lg(i)<10.D0) THEN
bin_prop_lcdm_s_lg(i)=int_prob_dist(NINT(bin_dev_lcdm_s_lg(i)*100.D0))
ELSE
bin_prop_lcdm_s_lg(i)=0.D0
END IF

IF (bin_dev_lcdm_s_cmb(i)<10.D0) THEN
bin_prop_lcdm_s_cmb(i)=int_prob_dist(NINT(bin_dev_lcdm_s_cmb(i)*100.D0))
ELSE
bin_prop_lcdm_s_cmb(i)=0.D0
END IF

IF (bin_dev_ts_f_lg(i)<10.D0) THEN
bin_prop_ts_f_lg(i)=int_prob_dist(NINT(bin_dev_ts_f_lg(i)*100.D0))
ELSE
bin_prop_ts_f_lg(i)=0.D0
END IF

IF (bin_dev_ts_f_cmb(i)<10.D0) THEN
bin_prop_ts_f_cmb(i)=int_prob_dist(NINT(bin_dev_ts_f_cmb(i)*100.D0))
ELSE
bin_prop_ts_f_cmb(i)=0.D0
END IF

IF (bin_dev_ts_s_lg(i)<10.D0) THEN
bin_prop_ts_s_lg(i)=int_prob_dist(NINT(bin_dev_ts_s_lg(i)*100.D0))
ELSE
bin_prop_ts_s_lg(i)=0.D0
END IF

IF (bin_dev_ts_s_cmb(i)<10.D0) THEN
bin_prop_ts_s_cmb(i)=int_prob_dist(NINT(bin_dev_ts_s_cmb(i)*100.D0))
ELSE
bin_prop_ts_s_cmb(i)=0.D0
END IF

END DO



DO i=1,10

bin_like_lcdm_f_lg(i)=bin_prop_lcdm_f_lg(i)/(bin_prop_lcdm_f_lg(i)+bin_prop_ts_f_lg(i))
bin_like_lcdm_f_cmb(i)=bin_prop_lcdm_f_cmb(i)/(bin_prop_lcdm_f_cmb(i)+bin_prop_ts_f_cmb(i))
bin_like_ts_f_lg(i)=bin_prop_ts_f_lg(i)/(bin_prop_lcdm_f_lg(i)+bin_prop_ts_f_lg(i))
bin_like_ts_f_cmb(i)=bin_prop_ts_f_cmb(i)/(bin_prop_lcdm_f_cmb(i)+bin_prop_ts_f_cmb(i))
bin_like_lcdm_s_lg(i)=bin_prop_lcdm_s_lg(i)/(bin_prop_lcdm_s_lg(i)+bin_prop_ts_s_lg(i))
bin_like_lcdm_s_cmb(i)=bin_prop_lcdm_s_cmb(i)/(bin_prop_lcdm_s_cmb(i)+bin_prop_ts_s_cmb(i))
bin_like_ts_s_lg(i)=bin_prop_ts_s_lg(i)/(bin_prop_lcdm_s_lg(i)+bin_prop_ts_s_lg(i))
bin_like_ts_s_cmb(i)=bin_prop_ts_s_cmb(i)/(bin_prop_lcdm_s_cmb(i)+bin_prop_ts_s_cmb(i))

END DO



OPEN(50,file='analysis/bin_data_lg.txt')
WRITE(50,*) 'Full data:'
WRITE(50,*) 'binnumber ; theory ; av_obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
DO i=1,10
WRITE(50,*) i, 'LCDM', bin_lg(i), bin_lcdm_av(i), (bin_lcdm_up(i)-bin_lcdm_av(i)),bin_dev_lcdm_f_lg(i),&
bin_prop_lcdm_f_lg(i),bin_like_lcdm_f_lg(i)
WRITE(50,*) i, 'Timescape', bin_lg(i), bin_ts_av(i), (bin_ts_up(i)-bin_ts_av(i)),bin_dev_ts_f_lg(i),&
bin_prop_ts_f_lg(i),bin_like_ts_f_lg(i)
END DO
WRITE(50,*) 'Selected data:'
WRITE(50,*) 'binnumber ; theory ; av_obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
DO i=1,10
WRITE(50,*) i, 'LCDM', bin_lg_sel(i), bin_lcdm_av_sel(i), (bin_lcdm_up_sel(i)-bin_lcdm_av_sel(i)),bin_dev_lcdm_s_lg(i),&
bin_prop_lcdm_s_lg(i),bin_like_lcdm_s_lg(i)
WRITE(50,*) i, 'Timescape', bin_lg_sel(i), bin_ts_av_sel(i), (bin_ts_up_sel(i)-bin_ts_av_sel(i)),bin_dev_ts_s_lg(i),&
bin_prop_ts_s_lg(i),bin_like_ts_s_lg(i)
END DO
CLOSE(50)


OPEN(50,file='analysis/bin_data_cmb.txt')
WRITE(50,*) 'Full data:'
WRITE(50,*) 'binnumber ; theory ; av_obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
DO i=1,10
WRITE(50,*) i, 'LCDM', bin_cmb(i), bin_lcdm_av(i), (bin_lcdm_up(i)-bin_lcdm_av(i)),bin_dev_lcdm_f_cmb(i),&
bin_prop_lcdm_f_cmb(i),bin_like_lcdm_f_cmb(i)
WRITE(50,*) i, 'Timescape', bin_cmb(i), bin_ts_av(i), (bin_ts_up(i)-bin_ts_av(i)),bin_dev_ts_f_cmb(i),&
bin_prop_ts_f_cmb(i),bin_like_ts_f_cmb(i)
END DO
WRITE(50,*) 'Selected data:'
WRITE(50,*) 'binnumber ; theory ; av_obs ; av_sim ; av_sim_sigma ; dev_sigma ; propabilty ; likelihood' 
DO i=1,10
WRITE(50,*) i, 'LCDM', bin_cmb_sel(i), bin_lcdm_av_sel(i), (bin_lcdm_up_sel(i)-bin_lcdm_av_sel(i)),bin_dev_lcdm_s_cmb(i),&
bin_prop_lcdm_s_cmb(i),bin_like_lcdm_s_cmb(i)
WRITE(50,*) i, 'Timescape', bin_cmb_sel(i), bin_ts_av_sel(i), (bin_ts_up_sel(i)-bin_ts_av_sel(i)),bin_dev_ts_s_cmb(i),&
bin_prop_ts_s_cmb(i),bin_like_ts_s_cmb(i)
END DO
CLOSE(50)



DO i=1,n_grid
DO ii=1,n_grid
map_lambda_lcdm_lg_f(i,ii)=0.D0
map_lambda_lcdm_cmb_f(i,ii)=0.D0
map_lambda_ts_lg_f(i,ii)=0.D0
map_lambda_ts_cmb_f(i,ii)=0.D0
map_prop_lcdm_lg_f(i,ii)=0.D0
map_prop_lcdm_cmb_f(i,ii)=0.D0
map_prop_ts_lg_f(i,ii)=0.D0
map_prop_ts_cmb_f(i,ii)=0.D0
map_lambda_lcdm_lg_s(i,ii)=0.D0
map_lambda_lcdm_cmb_s(i,ii)=0.D0
map_lambda_ts_lg_s(i,ii)=0.D0
map_lambda_ts_cmb_s(i,ii)=0.D0
map_prop_lcdm_lg_s(i,ii)=0.D0
map_prop_lcdm_cmb_s(i,ii)=0.D0
map_prop_ts_lg_s(i,ii)=0.D0
map_prop_ts_cmb_s(i,ii)=0.D0
END DO
END DO


n_count_cmb_f=0.D0
n_count_lg_f=0.D0
n_count_lcdm_f=0.D0
n_count_ts_f=0.D0
n_count_cmb_s=0.D0
n_count_lg_s=0.D0
n_count_lcdm_s=0.D0
n_count_ts_s=0.D0

DO i=1,n_grid
DO ii=1,n_grid
n_count_cmb_f=n_count_cmb_f+map_count_cmb_f(i,ii)
n_count_lg_f=n_count_lg_f+map_count_lg_f(i,ii)
n_count_lcdm_f=n_count_lcdm_f+map_count_lcdm_f(i,ii)
n_count_ts_f=n_count_ts_f+map_count_ts_f(i,ii)
n_count_cmb_s=n_count_cmb_s+map_count_cmb_s(i,ii)
n_count_lg_s=n_count_lg_s+map_count_lg_s(i,ii)
n_count_lcdm_s=n_count_lcdm_s+map_count_lcdm_s(i,ii)
n_count_ts_s=n_count_ts_s+map_count_ts_s(i,ii)
END DO
END DO



DO i=1,n_grid
DO ii=1,n_grid
map_lambda_lcdm_lg_f(i,ii)=map_count_lcdm_f(i,ii)*n_count_lg_f/n_count_lcdm_f
map_lambda_lcdm_cmb_f(i,ii)=map_count_lcdm_f(i,ii)*n_count_cmb_f/n_count_lcdm_f
map_lambda_ts_lg_f(i,ii)=map_count_ts_f(i,ii)*n_count_lg_f/n_count_ts_f
map_lambda_ts_cmb_f(i,ii)=map_count_ts_f(i,ii)*n_count_cmb_f/n_count_ts_f
map_lambda_lcdm_lg_s(i,ii)=map_count_lcdm_s(i,ii)*n_count_lg_s/n_count_lcdm_s
map_lambda_lcdm_cmb_s(i,ii)=map_count_lcdm_s(i,ii)*n_count_cmb_s/n_count_lcdm_s
map_lambda_ts_lg_s(i,ii)=map_count_ts_s(i,ii)*n_count_lg_s/n_count_ts_s
map_lambda_ts_cmb_s(i,ii)=map_count_ts_s(i,ii)*n_count_cmb_s/n_count_ts_s
END DO
END DO


DO i=1,n_grid
DO ii=1,n_grid
help_k=NINT(LOG(map_count_lg_f(i,ii)+1.D0))
help_lambda=LOG((map_lambda_lcdm_lg_f(i,ii))+1.D0)
! WRITE(*,*) help_k,help_lambda 
map_prop_lcdm_lg_f(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_cmb_f(i,ii)+1.D0))
help_lambda=LOG((map_lambda_lcdm_cmb_f(i,ii))+1.D0)
map_prop_lcdm_cmb_f(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_lg_f(i,ii)+1.D0))
help_lambda=LOG((map_lambda_ts_lg_f(i,ii))+1.D0)
map_prop_ts_lg_f(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_cmb_f(i,ii)+1.D0))
help_lambda=LOG((map_lambda_ts_cmb_f(i,ii))+1.D0)
map_prop_ts_cmb_f(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_lg_s(i,ii)+1.D0))
help_lambda=LOG((map_lambda_lcdm_lg_s(i,ii))+1.D0)
map_prop_lcdm_lg_s(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_cmb_s(i,ii)+1.D0))
help_lambda=LOG((map_lambda_lcdm_cmb_s(i,ii))+1.D0)
map_prop_lcdm_cmb_s(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_lg_s(i,ii)+1.D0))
help_lambda=LOG((map_lambda_ts_lg_s(i,ii))+1.D0)
map_prop_ts_lg_s(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

help_k=NINT(LOG(map_count_cmb_s(i,ii)+1.D0))
help_lambda=LOG((map_lambda_ts_cmb_s(i,ii))+1.D0)
map_prop_ts_cmb_s(i,ii)=((help_lambda**help_k)/DBLE(factorial(help_k)))*EXP(-help_lambda)

END DO
END DO




OPEN(50,file='plotdata/map_prop_lcdm_lg_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_lcdm_lg_f(i,ii)
END DO
END DO
 CLOSE(50)

OPEN(50,file='plotdata/map_prop_lcdm_cmb_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_lcdm_cmb_f(i,ii)
END DO
END DO
 CLOSE(50)

 OPEN(50,file='plotdata/map_prop_ts_lg_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_ts_lg_f(i,ii)
END DO
END DO
 CLOSE(50)

 OPEN(50,file='plotdata/map_prop_ts_cmb_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_ts_cmb_f(i,ii)
END DO
END DO
 CLOSE(50)

OPEN(50,file='plotdata/map_prop_lcdm_lg_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_lcdm_lg_s(i,ii)
END DO
END DO
 CLOSE(50)

OPEN(50,file='plotdata/map_prop_lcdm_cmb_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_lcdm_cmb_s(i,ii)
END DO
END DO
 CLOSE(50)

 OPEN(50,file='plotdata/map_prop_ts_lg_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_ts_lg_s(i,ii)
END DO
END DO
 CLOSE(50)

 OPEN(50,file='plotdata/map_prop_ts_cmb_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_prop_ts_cmb_s(i,ii)
END DO
END DO
 CLOSE(50) 


av_prop_map_lcdm_lg_f=0.D0
av_prop_map_ts_lg_f=0.D0
av_prop_map_lcdm_cmb_f=0.D0
av_prop_map_ts_cmb_f=0.D0
av_prop_map_lcdm_lg_s=0.D0
av_prop_map_ts_lg_s=0.D0
av_prop_map_lcdm_cmb_s=0.D0
av_prop_map_ts_cmb_s=0.D0

help_count=0.D0
hc1=0.D0
hc2=0.D0
hc3=0.D0
hc4=0.D0
DO i=1,n_grid
DO ii=1,n_grid

! help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
! help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
! IF ((help_y2>0.5) .AND. (help_y2<1.5)) THEN
! help_count=help_count+1.D0

IF ((map_count_lcdm_f(i,ii)>0.D0) .OR. (map_count_ts_f(i,ii)>0.D0) .OR. (map_count_lg_f(i,ii)>0.D0)) THEN
av_prop_map_lcdm_lg_f=av_prop_map_lcdm_lg_f+map_prop_lcdm_lg_f(i,ii)
av_prop_map_ts_lg_f=av_prop_map_ts_lg_f+map_prop_ts_lg_f(i,ii)
hc1=hc1+1.D0
END IF

IF ((map_count_lcdm_f(i,ii)>0.D0) .OR. (map_count_ts_f(i,ii)>0.D0) .OR. (map_count_cmb_f(i,ii)>0.D0)) THEN
av_prop_map_lcdm_cmb_f=av_prop_map_lcdm_cmb_f+map_prop_lcdm_cmb_f(i,ii)
av_prop_map_ts_cmb_f=av_prop_map_ts_cmb_f+map_prop_ts_cmb_f(i,ii)
hc2=hc2+1.D0
END IF

IF ((map_count_lcdm_s(i,ii)>0.D0) .OR. (map_count_ts_s(i,ii)>0.D0) .OR. (map_count_lg_s(i,ii)>0.D0)) THEN
av_prop_map_lcdm_lg_s=av_prop_map_lcdm_lg_s+map_prop_lcdm_lg_s(i,ii)
av_prop_map_ts_lg_s=av_prop_map_ts_lg_s+map_prop_ts_lg_s(i,ii)
hc3=hc3+1.D0
END IF

IF ((map_count_lcdm_s(i,ii)>0.D0) .OR. (map_count_ts_s(i,ii)>0.D0) .OR. (map_count_cmb_s(i,ii)>0.D0)) THEN
av_prop_map_lcdm_cmb_s=av_prop_map_lcdm_cmb_s+map_prop_lcdm_cmb_s(i,ii)
av_prop_map_ts_cmb_s=av_prop_map_ts_cmb_s+map_prop_ts_cmb_s(i,ii)
hc4=hc4+1.D0
END IF

! END IF
END DO
END DO
! 
! av_prop_map_lcdm_lg_f=av_prop_map_lcdm_lg_f/help_count
! av_prop_map_ts_lg_f=av_prop_map_ts_lg_f/help_count
! av_prop_map_lcdm_cmb_f=av_prop_map_lcdm_cmb_f/help_count
! av_prop_map_ts_cmb_f=av_prop_map_ts_cmb_f/help_count
! av_prop_map_lcdm_lg_s=av_prop_map_lcdm_lg_s/help_count
! av_prop_map_ts_lg_s=av_prop_map_ts_lg_s/help_count
! av_prop_map_lcdm_cmb_s=av_prop_map_lcdm_cmb_s/help_count
! av_prop_map_ts_cmb_s=av_prop_map_ts_cmb_s/help_count


av_prop_map_lcdm_lg_f=av_prop_map_lcdm_lg_f/hc1
av_prop_map_ts_lg_f=av_prop_map_ts_lg_f/hc1
av_prop_map_lcdm_cmb_f=av_prop_map_lcdm_cmb_f/hc2
av_prop_map_ts_cmb_f=av_prop_map_ts_cmb_f/hc2
av_prop_map_lcdm_lg_s=av_prop_map_lcdm_lg_s/hc3
av_prop_map_ts_lg_s=av_prop_map_ts_lg_s/hc3
av_prop_map_lcdm_cmb_s=av_prop_map_lcdm_cmb_s/hc4
av_prop_map_ts_cmb_s=av_prop_map_ts_cmb_s/hc4


OPEN(50,file='analysis/propmap.txt')
WRITE(50,*) 'LG ; LCDM     ; full    ;',av_prop_map_lcdm_lg_f
WRITE(50,*) 'LG ; Timescape; full    ;',av_prop_map_ts_lg_f
WRITE(50,*) 'CMB; LCDM     ; full    ;',av_prop_map_lcdm_cmb_f
WRITE(50,*) 'CMB; Timescape; full    ;',av_prop_map_ts_cmb_f
WRITE(50,*) 'LG ; LCDM     ; selected;',av_prop_map_lcdm_lg_s
WRITE(50,*) 'LG ; Timescape; selected;',av_prop_map_ts_lg_s
WRITE(50,*) 'CMB; LCDM     ; selected;',av_prop_map_lcdm_cmb_s
WRITE(50,*) 'CMB; Timescape; selected;',av_prop_map_ts_cmb_s
CLOSE(50)






 chi2_map_lcdm_lg_f=0.D0
 chi2_map_ts_lg_f=0.D0
 chi2_map_lcdm_cmb_f=0.D0
 chi2_map_ts_cmb_f=0.D0
 chi2_map_lcdm_lg_s=0.D0
 chi2_map_ts_lg_s=0.D0
 chi2_map_lcdm_cmb_s=0.D0
 chi2_map_ts_cmb_s=0.D0


help_count=0.D0
hc1=0.D0
hc2=0.D0
hc3=0.D0
hc4=0.D0


DO i=1,n_grid
DO ii=1,n_grid

IF ((map_count_lcdm_f(i,ii)>0.D0) .OR. (map_count_ts_f(i,ii)>0.D0) .OR. (map_count_lg_f(i,ii)>0.D0)) THEN
 chi2_map_lcdm_lg_f=chi2_map_lcdm_lg_f+(map_count_lg_f(i,ii)-map_prop_lcdm_lg_f(i,ii))**2
 chi2_map_ts_lg_f=chi2_map_ts_lg_f+(map_count_lg_f(i,ii)-map_prop_ts_lg_f(i,ii))**2
 hc1=hc1+1.D0
END IF

 IF ((map_count_lcdm_f(i,ii)>0.D0) .OR. (map_count_ts_f(i,ii)>0.D0) .OR. (map_count_cmb_f(i,ii)>0.D0)) THEN
 chi2_map_lcdm_cmb_f=chi2_map_lcdm_cmb_f+(map_count_cmb_f(i,ii)-map_prop_lcdm_cmb_f(i,ii))**2
 chi2_map_ts_cmb_f=chi2_map_ts_cmb_f+(map_count_cmb_f(i,ii)-map_prop_ts_cmb_f(i,ii))**2
 hc2=hc2+1.D0
END IF

 IF ((map_count_lcdm_s(i,ii)>0.D0) .OR. (map_count_ts_s(i,ii)>0.D0) .OR. (map_count_lg_s(i,ii)>0.D0)) THEN
 chi2_map_lcdm_lg_s=chi2_map_lcdm_lg_s+(map_count_lg_s(i,ii)-map_prop_lcdm_lg_s(i,ii))**2
 chi2_map_ts_lg_s=chi2_map_ts_lg_s+(map_count_lg_s(i,ii)-map_prop_ts_lg_s(i,ii))**2
 hc3=hc3+1.D0
END IF

 IF ((map_count_lcdm_s(i,ii)>0.D0) .OR. (map_count_ts_s(i,ii)>0.D0) .OR. (map_count_cmb_s(i,ii)>0.D0)) THEN
 chi2_map_lcdm_cmb_s=chi2_map_lcdm_cmb_s+(map_count_cmb_s(i,ii)-map_prop_lcdm_cmb_s(i,ii))**2
 chi2_map_ts_cmb_s=chi2_map_ts_cmb_s+(map_count_cmb_s(i,ii)-map_prop_ts_cmb_s(i,ii))**2
hc4=hc4+1.D0
END IF

END DO
END DO

 
 chi2_map_lcdm_lg_f=SQRT(chi2_map_lcdm_lg_f/hc1)
 chi2_map_ts_lg_f=SQRT(chi2_map_ts_lg_f/hc1)
 chi2_map_lcdm_cmb_f=SQRT(chi2_map_lcdm_cmb_f/hc2)
 chi2_map_ts_cmb_f=SQRT(chi2_map_ts_cmb_f/hc2)
 chi2_map_lcdm_lg_s=SQRT(chi2_map_lcdm_lg_s/hc3)
 chi2_map_ts_lg_s=SQRT(chi2_map_ts_lg_s/hc3)
 chi2_map_lcdm_cmb_s=SQRT(chi2_map_lcdm_cmb_s/hc4)
 chi2_map_ts_cmb_s=SQRT(chi2_map_ts_cmb_s/hc4)
 

 OPEN(50,file='analysis/chi2map.txt')
WRITE(50,*) 'LG ; LCDM     ; full    ;',chi2_map_lcdm_lg_f
WRITE(50,*) 'LG ; Timescape; full    ;',chi2_map_ts_lg_f
WRITE(50,*) 'CMB; LCDM     ; full    ;',chi2_map_lcdm_cmb_f
WRITE(50,*) 'CMB; Timescape; full    ;',chi2_map_ts_cmb_f
WRITE(50,*) 'LG ; LCDM     ; selected;',chi2_map_lcdm_lg_s
WRITE(50,*) 'LG ; Timescape; selected;',chi2_map_ts_lg_s
WRITE(50,*) 'CMB; LCDM     ; selected;',chi2_map_lcdm_cmb_s
WRITE(50,*) 'CMB; Timescape; selected;',chi2_map_ts_cmb_s
CLOSE(50)









  
  
  
END PROGRAM 




RECURSIVE FUNCTION factorial(n) RESULT(res)
   INTEGER (kind=16) :: res, n
   IF(n.EQ.0) THEN
      res = 1
   ELSE
      res = n*factorial(n-1)
   END IF
END




! function for Gaussian error
DOUBLE PRECISION FUNCTION gasdev(idum)

INTEGER :: idum
INTEGER :: iset
DOUBLE PRECISION :: fac,gset,rsq,v1,v2,ran1

SAVE iset,gset
DATA iset/0/



	IF (idum.lt.0) 	THEN
		iset=0
	END IF


	IF (iset.eq.0) THEN
		rsq=1.
		DO While (rsq.ge.1..or.rsq.eq.0)
			v1=2.*rand(idum)-1.
			v2=2.*rand(idum)-1.
			rsq=v1**2+v2**2
		END DO
		fac=SQRT(-2.*LOG(rsq)/rsq)
		gset=v1*fac
		gasdev=v2*fac
		iset=1
	ELSE
		gasdev=gset
		iset=0
	END IF

RETURN
END FUNCTION gasdev







