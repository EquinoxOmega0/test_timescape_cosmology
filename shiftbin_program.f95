PROGRAM combine_for_scatter

IMPLICIT NONE
! declaration of variables
double precision :: PI,goldenratio,ts_modificator,slope_ts
integer :: io_err,n,i,ii,uuu,n_fg,npara,n_help,n_id,iii,e,ee,n_good_ts,n_good_0,n_half
double precision, allocatable :: H_ts(:,:),distance_ts(:,:),weights_ts(:,:),inside_fi_ts(:,:)
double precision, allocatable :: H_0(:,:),distance_0(:,:),weights_0(:,:),inside_fi_0(:,:)
double precision, allocatable :: H_real_cmb(:),distance_real_cmb(:),weights_real_cmb(:),inside_fi_real_cmb(:)
double precision, allocatable :: H_real_lg(:),distance_real_lg(:),weights_real_lg(:),inside_fi_real_lg(:)
integer :: help_x,help_y
character(20) :: mockstr
character(20) :: id_str
integer, dimension(1:64) :: n_count_0,n_count_ts
integer ::n_count_real_cmb,n_count_real_lg,nc_ts,nc_0
double precision ::  distance_limit,number_limit,bin_width10,help_sort,dummy_var
double precision, dimension(0:100,0:10,1:64) :: bin_results_0,bin_results_ts
double precision, dimension(0:100,0:10) :: bin_results_0_median,bin_results_ts_median,delta_0,delta_ts
double precision, dimension(0:100,0:10) :: bin_help10,bin_counter,bin_weight_counter
double precision, dimension(0:100,0:10) :: bin_results_real_lg,bin_results_real_cmb
double precision, dimension(0:100,0:10) :: bin_0_low,bin_0_high,bin_0_av,bin_ts_low,bin_ts_high,bin_ts_av
double precision, dimension(0:100,0:10) :: dev_bin_ts_lg,dev_bin_0_lg
double precision, dimension(0:100,0:10) :: like_bin_0_lg,like_bin_ts_lg,prop_bin_0_lg,prop_bin_ts_lg
double precision, dimension(0:100,0:10) :: bin_ts_sigma,bin_0_sigma,dev_bin_ts_cmb,dev_bin_0_cmb
double precision, dimension(0:100,0:10) :: like_bin_0_cmb,like_bin_ts_cmb,prop_bin_0_cmb,prop_bin_ts_cmb
double precision, dimension(0:10) :: dev_0_lg,dev_ts_lg,k_0,k_ts,k_real_lg,k_real_cmb,k_sigma_0,k_sigma_ts
double precision, dimension(0:10) :: prop_0_lg,prop_ts_lg,like_0_lg,like_ts_lg,k_sigma_real_lg,k_sigma_real_cmb
double precision, dimension(0:10) :: prop_0_cmb,prop_ts_cmb,like_0_cmb,like_ts_cmb,dev_0_cmb,dev_ts_cmb
double precision ::  k_0_av,k_real_av_lg,k_real_av_cmb,k_ts_av,k_sigma_0_av,k_sigma_ts_av,k_scatter_0,k_scatter_ts
double precision ::  d_0_av,d_real_av_lg,d_real_av_cmb,d_ts_av,d_scatter_0,d_scatter_ts
double precision, dimension(0:10) :: d_0,d_ts,d_real_lg,d_real_cmb,d_sigma_0,d_sigma_ts,d_sigma_real_lg,d_sigma_real_cmb
double precision ::  dev_0_av_lg,dev_ts_av_lg,prop_0_av_lg,prop_ts_av_lg,like_0_av_lg,like_ts_av_lg
double precision ::  dev_0_av_cmb,dev_ts_av_cmb,prop_0_av_cmb,prop_ts_av_cmb,like_0_av_cmb,like_ts_av_cmb
double precision, dimension(1:64) :: hsorted_0,hsorted_ts
double precision, dimension(0:1000) :: int_prob_dist

double precision, dimension(1:64) :: k_ts_ind,k_0_ind,d_ts_ind,d_0_ind
double precision :: k_real_ind_lg,d_real_ind_lg,k_real_ind_cmb,d_real_ind_cmb
double precision :: k_ts_ind_av,d_ts_ind_av,k_0_ind_av,d_0_ind_av
double precision :: k_ts_ind_sigma,d_ts_ind_sigma,k_0_ind_sigma,d_0_ind_sigma


! define constants
PI=ACOS(-1.D0)

OPEN(50,file='int_prob_dist.txt')
READ(50,*) int_prob_dist(0:1000)
 CLOSE(50) 
 

OPEN (50,file='real_data_calibrated/selected_results_lg.txt')
io_err=0
n_count_real_lg=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_count_real_lg=n_count_real_lg+1
END DO
 CLOSE(50)
n_count_real_lg=n_count_real_lg-1

OPEN (50,file='real_data_calibrated/selected_results_cmb.txt')
io_err=0
n_count_real_cmb=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_count_real_cmb=n_count_real_cmb+1
END DO
 CLOSE(50)
n_count_real_cmb=n_count_real_cmb-1
! WRITE(*,*) n_count_real



DO uuu=1,64


WRITE(id_str,*) uuu
id_str=TRIM(adjustl(id_str))

 OPEN(50,file='sim_data_lcdm/selected_results_'//TRIM(id_str)//'.txt')
io_err=0
n_count_0(uuu)=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_count_0(uuu)=n_count_0(uuu)+1
END DO
 CLOSE(50)
n_count_0(uuu)=n_count_0(uuu)-1
! WRITE(*,*) n_count_0(uuu)

 OPEN(50,file='sim_data_timescape/selected_results_'//TRIM(id_str)//'.txt')
io_err=0
n_count_ts(uuu)=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_count_ts(uuu)=n_count_ts(uuu)+1
END DO
 CLOSE(50)
n_count_ts(uuu)=n_count_ts(uuu)-1
! WRITE(*,*) n_count_ts(uuu)


END DO



n=0
DO uuu=1,64
IF (n_count_0(uuu)>n) THEN
n=n_count_0(uuu)
END IF
IF (n_count_ts(uuu)>n) THEN
n=n_count_ts(uuu)
END IF
END DO



! allocate arrays
allocate(H_ts(1:n,1:64))
allocate(weights_ts(1:n,1:64))
allocate(inside_fi_ts(1:n,1:64))
allocate(distance_ts(1:n,1:64))
allocate(H_0(1:n,1:64))
allocate(weights_0(1:n,1:64))
allocate(inside_fi_0(1:n,1:64))
allocate(distance_0(1:n,1:64))
allocate(H_real_lg(1:n_count_real_lg))
allocate(weights_real_lg(1:n_count_real_lg))
allocate(inside_fi_real_lg(1:n_count_real_lg))
allocate(distance_real_lg(1:n_count_real_lg))
allocate(H_real_cmb(1:n_count_real_cmb))
allocate(weights_real_cmb(1:n_count_real_cmb))
allocate(inside_fi_real_cmb(1:n_count_real_cmb))
allocate(distance_real_cmb(1:n_count_real_cmb))



OPEN (50,file='real_data_calibrated/selected_results_lg.txt')
DO i=1,n_count_real_lg
READ(50,*) inside_fi_real_lg(i),H_real_lg(i),distance_real_lg(i),weights_real_lg(i)
weights_real_lg(i)=(1.D0/(weights_real_lg(i)**2))
END DO
 CLOSE(50)

 
OPEN (50,file='real_data_calibrated/selected_results_cmb.txt')
DO i=1,n_count_real_cmb
READ(50,*) inside_fi_real_cmb(i),H_real_cmb(i),distance_real_cmb(i),weights_real_cmb(i)
weights_real_cmb(i)=(1.D0/(weights_real_cmb(i)**2))
END DO
 CLOSE(50)

 
 
DO uuu=1,64


WRITE(id_str,*) uuu
id_str=TRIM(adjustl(id_str))

 OPEN(50,file='sim_data_lcdm/selected_results_'//TRIM(id_str)//'.txt')
DO i=1,n_count_0(uuu)
READ(50,*) inside_fi_0(i,uuu),H_0(i,uuu),distance_0(i,uuu),weights_0(i,uuu)
weights_0(i,uuu)=(1.D0/(weights_0(i,uuu)**2))
END DO
 CLOSE(50)


 OPEN(50,file='sim_data_timescape/selected_results_'//TRIM(id_str)//'.txt')
DO i=1,n_count_ts(uuu)
READ(50,*) inside_fi_ts(i,uuu),H_ts(i,uuu),distance_ts(i,uuu),weights_ts(i,uuu)
weights_ts(i,uuu)=(1.D0/(weights_ts(i,uuu)**2))
END DO
 CLOSE(50)

 
END DO

! 
! 
!  DO i=1,n_count_real
! weights_real(i)=1.D0
! END DO
! 
! DO uuu=1,64
! DO i=1,n_count_0(uuu)
! weights_0(i,uuu)=1.D0
! END DO
! 
! DO i=1,n_count_ts(uuu)
! weights_ts(i,uuu)=1.D0
! END DO
! END DO

 
bin_width10=0.5D0/10.D0

DO ii=0,9
DO i=1,10
bin_help10(i,ii)=(DBLE(i)-0.5D0)/10.D0+(DBLE(ii)/100.D0)
END DO
END DO


DO i=0,100
DO ii=0,10
bin_results_real_lg(i,ii)=0.D0
bin_results_real_cmb(i,ii)=0.D0
DO iii=1,64
bin_results_0(i,ii,iii)=0.D0
bin_results_ts(i,ii,iii)=0.D0
END DO
END DO
END DO



DO ii=0,9
DO i=1,100
bin_weight_counter(i,ii)=0.D0
END DO
END DO



DO iii=0,9
DO i=1,10
DO ii=1,n_count_real_lg
IF (inside_fi_real_lg(ii)>(bin_help10(i,iii)-bin_width10)) THEN
IF (inside_fi_real_lg(ii)<=(bin_help10(i,iii)+bin_width10)) THEN
bin_results_real_lg(i,iii)=bin_results_real_lg(i,iii)+H_real_lg(ii)*weights_real_lg(ii)
bin_weight_counter(i,iii)=bin_weight_counter(i,iii)+weights_real_lg(ii)
! WRITE(*,*) weights_real_lg(ii)
END IF
END IF
END DO

IF (bin_weight_counter(i,iii)>0.D0) THEN
bin_results_real_lg(i,iii)=bin_results_real_lg(i,iii)/bin_weight_counter(i,iii)
ELSE
bin_results_real_lg(i,iii)=-1.D0
END IF


END DO
END DO

DO ii=0,9
DO i=1,100
bin_weight_counter(i,ii)=0.D0
END DO
END DO


DO iii=0,9
DO i=1,10
DO ii=1,n_count_real_cmb
IF (inside_fi_real_cmb(ii)>(bin_help10(i,iii)-bin_width10)) THEN
IF (inside_fi_real_cmb(ii)<=(bin_help10(i,iii)+bin_width10)) THEN
bin_results_real_cmb(i,iii)=bin_results_real_cmb(i,iii)+H_real_cmb(ii)*weights_real_cmb(ii)
bin_weight_counter(i,iii)=bin_weight_counter(i,iii)+weights_real_cmb(ii)
! WRITE(*,*) weights_real_cmb(ii)
END IF
END IF
END DO

IF (bin_weight_counter(i,iii)>0.D0) THEN
bin_results_real_cmb(i,iii)=bin_results_real_cmb(i,iii)/bin_weight_counter(i,iii)
ELSE
bin_results_real_cmb(i,iii)=-1.D0
END IF


END DO
END DO







DO uuu=1,64

DO ii=0,9
DO i=1,100
bin_weight_counter(i,ii)=0.D0
END DO
END DO



DO iii=0,9
DO i=1,10
DO ii=1,n_count_0(uuu)
IF ((inside_fi_0(ii,uuu)>(bin_help10(i,iii)-bin_width10)).AND.(inside_fi_0(ii,uuu)<=(bin_help10(i,iii)+bin_width10))) THEN
bin_results_0(i,iii,uuu)=bin_results_0(i,iii,uuu)+H_0(ii,uuu)*weights_0(ii,uuu)
bin_weight_counter(i,iii)=bin_weight_counter(i,iii)+weights_0(ii,uuu)
END IF
END DO

IF (bin_weight_counter(i,iii)>0.D0) THEN
bin_results_0(i,iii,uuu)=bin_results_0(i,iii,uuu)/bin_weight_counter(i,iii)
ELSE
bin_results_0(i,iii,uuu)=-1.D0
END IF

END DO

END DO


END DO



DO uuu=1,64

DO ii=0,9
DO i=1,100
bin_weight_counter(i,ii)=0.D0
END DO
END DO



DO iii=0,9
! WRITE(*,*) iii
DO i=1,10
DO ii=1,n_count_ts(uuu)
IF ((inside_fi_ts(ii,uuu)>(bin_help10(i,iii)-bin_width10)).AND.(inside_fi_ts(ii,uuu)<=(bin_help10(i,iii)+bin_width10))) THEN
bin_results_ts(i,iii,uuu)=bin_results_ts(i,iii,uuu)+H_ts(ii,uuu)*weights_ts(ii,uuu)
bin_weight_counter(i,iii)=bin_weight_counter(i,iii)+weights_ts(ii,uuu)
END IF
END DO
IF (bin_weight_counter(i,iii)>0.D0) THEN
bin_results_ts(i,iii,uuu)=bin_results_ts(i,iii,uuu)/bin_weight_counter(i,iii)
ELSE
bin_results_ts(i,iii,uuu)=-1.D0
END IF
! WRITE(*,*) bin_results_ts(i,iii,uuu),uuu,iii,i
END DO

END DO


END DO




DO uuu=1,64

WRITE(id_str,*) uuu
id_str=TRIM(adjustl(id_str))

OPEN (50,file='plotdata/bin_mock'//TRIM(id_str)//'_ts.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_ts(i,iii,uuu)>0.D0) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_ts(i,iii,uuu)
END IF
END DO
END DO

 CLOSE(50)

 
 
OPEN (50,file='plotdata/bin_mock'//TRIM(id_str)//'_0.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_0(i,iii,uuu)>0.D0) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_0(i,iii,uuu)
END IF
END DO
END DO

 CLOSE(50)


END DO

 
 
OPEN (50,file='plotdata/bin_mock_real_lg.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_real_lg(i,iii)>0.D0) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii)
END IF
END DO
END DO

 CLOSE(50)

OPEN (50,file='plotdata/bin_mock_real_cmb.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_real_cmb(i,iii)>0.D0) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_cmb(i,iii)
END IF
END DO
END DO

 CLOSE(50)

 
 

 
 
 DO i=1,10
DO iii=0,9
 bin_0_av(i,iii)=0.D0
 bin_ts_av(i,iii)=0.D0
 bin_0_low(i,iii)=3.D0
 bin_0_high(i,iii)=-1.D0
 bin_ts_low(i,iii)=3.D0
 bin_ts_high(i,iii)=-1.D0 
 nc_ts=0
 nc_0=0
 DO uuu=1,64
 IF (bin_results_0(i,iii,uuu)>0.D0) THEN
bin_0_av(i,iii)=bin_0_av(i,iii)+bin_results_0(i,iii,uuu)
IF (bin_0_low(i,iii)>bin_results_0(i,iii,uuu)) THEN
bin_0_low(i,iii)=bin_results_0(i,iii,uuu)
END IF
IF (bin_0_high(i,iii)<bin_results_0(i,iii,uuu)) THEN
bin_0_high(i,iii)=bin_results_0(i,iii,uuu)
END IF
nc_0=nc_0+1
END IF
 IF (bin_results_ts(i,iii,uuu)>0.D0) THEN
bin_ts_av(i,iii)=bin_ts_av(i,iii)+bin_results_ts(i,iii,uuu)
IF (bin_ts_low(i,iii)>bin_results_ts(i,iii,uuu)) THEN
bin_ts_low(i,iii)=bin_results_ts(i,iii,uuu)
END IF
IF (bin_ts_high(i,iii)<bin_results_ts(i,iii,uuu)) THEN
bin_ts_high(i,iii)=bin_results_ts(i,iii,uuu)
END IF
nc_ts=nc_ts+1
END IF
 END DO

 IF (nc_0>0) THEN
 bin_0_av(i,iii)=bin_0_av(i,iii)/DBLE(nc_0)
 ELSE
 bin_0_low(i,iii)=-1.D0
 bin_0_high(i,iii)=3.D0
 bin_0_av(i,iii)=-1.D0
 END IF
 
  IF (nc_ts>0) THEN
 bin_ts_av(i,iii)=bin_ts_av(i,iii)/DBLE(nc_ts)
 ELSE
 bin_ts_low(i,iii)=-1.D0
 bin_ts_high(i,iii)=3.D0
 bin_ts_av(i,iii)=-1.D0
 END IF
 
END DO  
END DO 



 DO i=1,10
DO iii=0,9

 bin_ts_sigma(i,iii)=0.D0
 bin_0_sigma(i,iii)=0.D0
nc_ts=0
nc_0=0
 
 
 DO uuu=1,64
 IF (bin_results_0(i,iii,uuu)>0.D0) THEN
bin_0_sigma(i,iii)=bin_0_sigma(i,iii)+((bin_0_av(i,iii)-bin_results_0(i,iii,uuu))**2)
nc_0=nc_0+1
END IF


 IF (bin_results_ts(i,iii,uuu)>0.D0) THEN
bin_ts_sigma(i,iii)=bin_ts_sigma(i,iii)+((bin_ts_av(i,iii)-bin_results_ts(i,iii,uuu))**2)
nc_ts=nc_ts+1
END IF

 END DO
! WRITE(*,*) nc_ts,nc_0
 IF (nc_ts>16) THEN ! 2*8 ... also nur 2 echte Katalogue ... zu wenig für solide Aussagen
 bin_ts_sigma(i,iii)=SQRT(bin_ts_sigma(i,iii)/DBLE(nc_ts-1))
 ELSE
 bin_ts_sigma(i,iii)=100.D0
 END IF
 
 IF (nc_0>16) THEN
 bin_0_sigma(i,iii)=SQRT(bin_0_sigma(i,iii)/DBLE(nc_0-1))
 ELSE
 bin_0_sigma(i,iii)=100.D0
 END IF
 
 bin_0_low(i,iii)=bin_0_av(i,iii)-3.D0*bin_0_sigma(i,iii)
 bin_0_high(i,iii)=bin_0_av(i,iii)+3.D0*bin_0_sigma(i,iii)
 bin_ts_low(i,iii)=bin_ts_av(i,iii)-3.D0*bin_ts_sigma(i,iii)
 bin_ts_high(i,iii)=bin_ts_av(i,iii)+3.D0*bin_ts_sigma(i,iii)
 
 
END DO  
END DO 





DO i=1,10
DO iii=0,9

dev_bin_ts_lg(i,iii)=ABS((bin_results_real_lg(i,iii)-bin_ts_av(i,iii))/bin_ts_sigma(i,iii))
dev_bin_0_lg(i,iii)=ABS((bin_results_real_lg(i,iii)-bin_0_av(i,iii))/bin_0_sigma(i,iii))


prop_bin_0_lg(i,iii)=int_prob_dist(NINT(dev_bin_0_lg(i,iii)*100.D0))
prop_bin_ts_lg(i,iii)=int_prob_dist(NINT(dev_bin_ts_lg(i,iii)*100.D0))
 
like_bin_0_lg(i,iii)=prop_bin_0_lg(i,iii)/(prop_bin_0_lg(i,iii)+prop_bin_ts_lg(i,iii))
like_bin_ts_lg(i,iii)=prop_bin_ts_lg(i,iii)/(prop_bin_0_lg(i,iii)+prop_bin_ts_lg(i,iii))
END DO  
END DO 


DO i=1,10
DO iii=0,9

dev_bin_ts_cmb(i,iii)=ABS((bin_results_real_cmb(i,iii)-bin_ts_av(i,iii))/bin_ts_sigma(i,iii))
dev_bin_0_cmb(i,iii)=ABS((bin_results_real_cmb(i,iii)-bin_0_av(i,iii))/bin_0_sigma(i,iii))


prop_bin_0_cmb(i,iii)=int_prob_dist(NINT(dev_bin_0_cmb(i,iii)*100.D0))
prop_bin_ts_cmb(i,iii)=int_prob_dist(NINT(dev_bin_ts_cmb(i,iii)*100.D0))
 
like_bin_0_cmb(i,iii)=prop_bin_0_cmb(i,iii)/(prop_bin_0_cmb(i,iii)+prop_bin_ts_cmb(i,iii))
like_bin_ts_cmb(i,iii)=prop_bin_ts_cmb(i,iii)/(prop_bin_0_cmb(i,iii)+prop_bin_ts_cmb(i,iii))
END DO  
END DO 

  OPEN (50,file='analysis/allbin_prop_new.txt')

  WRITE(50,*) 'LG reference frame'
DO i=1,10
DO iii=0,8
IF (like_bin_0_lg(i,iii)>like_bin_ts_lg(i,iii)) THEN
help_x=1
ELSE
help_x=0
END IF
WRITE(50,*) bin_help10(i,iii),dev_bin_0_lg(i,iii),dev_bin_ts_lg(i,iii),prop_bin_0_lg(i,iii),prop_bin_ts_lg(i,iii),&
like_bin_0_lg(i,iii),like_bin_ts_lg(i,iii),help_x
END DO  
END DO

  WRITE(50,*) 'CMB reference frame'
DO i=1,10
DO iii=0,8
IF (like_bin_0_cmb(i,iii)>like_bin_ts_cmb(i,iii)) THEN
help_x=1
ELSE
help_x=0
END IF
WRITE(50,*) bin_help10(i,iii),dev_bin_0_cmb(i,iii),dev_bin_ts_cmb(i,iii),prop_bin_0_cmb(i,iii),prop_bin_ts_cmb(i,iii),&
like_bin_0_cmb(i,iii),like_bin_ts_cmb(i,iii),help_x
END DO  
END DO

 CLOSE(50)


 
  OPEN (50,file='plotdata/bin_results_plot3sigms_new_lg.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_real_cmb(i,iii)>0.5) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii),bin_0_av(i,iii),&
bin_0_high(i,iii),bin_0_low(i,iii),bin_ts_av(i,iii),bin_ts_high(i,iii),bin_ts_low(i,iii)
END IF
END DO  
END DO

 CLOSE(50)

  
  OPEN (50,file='plotdata/bin_results_plot3sigms_new_cmb.txt')

DO i=1,10
DO iii=0,9
IF (bin_results_real_cmb(i,iii)>0.5) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_cmb(i,iii),bin_0_av(i,iii),&
bin_0_high(i,iii),bin_0_low(i,iii),bin_ts_av(i,iii),bin_ts_high(i,iii),bin_ts_low(i,iii)
END IF
END DO  
END DO

 CLOSE(50)




   OPEN (50,file='plotdata/bin_results_0_all.txt')

DO i=1,10
DO iii=0,9
WRITE(50,*) bin_help10(i,iii),bin_results_0(i,iii,1:64),bin_0_av(i,iii)
END DO  
END DO

 CLOSE(50)


   OPEN (50,file='plotdata/bin_results_ts_all.txt')

DO i=1,10
DO iii=0,9
WRITE(50,*) bin_help10(i,iii),bin_results_ts(i,iii,1:64),bin_ts_av(i,iii)
END DO  
END DO

 CLOSE(50)


 
 


OPEN (50,file='plotdata/binfit_shift_indiv_real_lg.txt')
READ(50,*) k_real_ind_lg,d_real_ind_lg,dummy_var,dummy_var,dummy_var
 CLOSE(50)


OPEN (50,file='plotdata/binfit_shift_indiv_real_cmb.txt')
READ(50,*) k_real_ind_cmb,d_real_ind_cmb,dummy_var,dummy_var,dummy_var
 CLOSE(50)




OPEN (50,file='plotdata/binfit_shift_indiv_0.txt')
DO i=1,64
READ(50,*) k_0_ind(i),d_0_ind(i),dummy_var,dummy_var,dummy_var
END DO
 CLOSE(50)
 
 
OPEN (50,file='plotdata/binfit_shift_indiv_ts.txt')
DO i=1,64
READ(50,*) k_ts_ind(i),d_ts_ind(i),dummy_var,dummy_var,dummy_var
END DO
 CLOSE(50)


k_ts_ind_av=0.D0
d_ts_ind_av=0.D0
k_0_ind_av=0.D0
d_0_ind_av=0.D0
 
DO i=1,64
k_ts_ind_av=k_ts_ind_av+k_ts_ind(i)
d_ts_ind_av=d_ts_ind_av+d_ts_ind(i)
k_0_ind_av=k_0_ind_av+k_0_ind(i)
d_0_ind_av=d_0_ind_av+d_0_ind(i)
END DO
 
k_ts_ind_av=k_ts_ind_av/64.D0
d_ts_ind_av=d_ts_ind_av/64.D0
k_0_ind_av=k_0_ind_av/64.D0
d_0_ind_av=d_0_ind_av/64.D0


k_ts_ind_sigma=0.D0
d_ts_ind_sigma=0.D0
k_0_ind_sigma=0.D0
d_0_ind_sigma=0.D0
 
DO i=1,64
k_ts_ind_sigma=k_ts_ind_sigma+((k_ts_ind(i)-k_ts_ind_av)**2)
d_ts_ind_sigma=d_ts_ind_sigma+((d_ts_ind(i)-d_ts_ind_av)**2)
k_0_ind_sigma=k_0_ind_sigma+((k_0_ind(i)-k_0_ind_av)**2)
d_0_ind_sigma=d_0_ind_sigma+((d_0_ind(i)-d_0_ind_av)**2)
END DO
 
k_ts_ind_sigma=SQRT(k_ts_ind_sigma/64.D0)
d_ts_ind_sigma=SQRT(d_ts_ind_sigma/64.D0)
k_0_ind_sigma=SQRT(k_0_ind_sigma/64.D0)
d_0_ind_sigma=SQRT(d_0_ind_sigma/64.D0)








dev_0_av_lg=ABS((k_real_ind_lg-k_0_ind_av)/k_0_ind_sigma)
dev_ts_av_lg=ABS((k_real_ind_lg-k_ts_ind_av)/k_ts_ind_sigma)


prop_0_av_lg=int_prob_dist(NINT(dev_0_av_lg*100.D0))
prop_ts_av_lg=int_prob_dist(NINT(dev_ts_av_lg*100.D0))
 
like_0_av_lg=prop_0_av_lg/(prop_0_av_lg+prop_ts_av_lg)
like_ts_av_lg=prop_ts_av_lg/(prop_0_av_lg+prop_ts_av_lg)
 

dev_0_av_cmb=ABS((k_real_ind_cmb-k_0_ind_av)/k_0_ind_sigma)
dev_ts_av_cmb=ABS((k_real_ind_cmb-k_ts_ind_av)/k_ts_ind_sigma)


prop_0_av_cmb=int_prob_dist(NINT(dev_0_av_cmb*100.D0))
prop_ts_av_cmb=int_prob_dist(NINT(dev_ts_av_cmb*100.D0))
 
like_0_av_cmb=prop_0_av_cmb/(prop_0_av_cmb+prop_ts_av_cmb)
like_ts_av_cmb=prop_ts_av_cmb/(prop_0_av_cmb+prop_ts_av_cmb)
 
 

 
 
 OPEN (50,file='analysis/bins_shifted.txt')
  WRITE(50,*) 'theory, reference frame, k_real, k_m, k_sigma_m, dev_m, prop_m, like_m'
WRITE(50,*) 'LCDM     ; LG;',k_real_ind_lg,k_0_ind_av,k_0_ind_sigma,dev_0_av_lg,prop_0_av_lg,like_0_av_lg
WRITE(50,*) 'Timescape; LG;',k_real_ind_lg,k_ts_ind_av,k_ts_ind_sigma,dev_ts_av_lg,prop_ts_av_lg,like_ts_av_lg
WRITE(50,*) 'LCDM     ; CMB;',k_real_ind_cmb,k_0_ind_av,k_0_ind_sigma,dev_0_av_cmb,prop_0_av_cmb,like_0_av_cmb
WRITE(50,*) 'Timescape; CMB;',k_real_ind_cmb,k_ts_ind_av,k_ts_ind_sigma,dev_ts_av_cmb,prop_ts_av_cmb,like_ts_av_cmb
 CLOSE(50)

 
 
 
 
 
 OPEN (50,file='plotdata/bin_results_plot3sigms_all_new.txt')
WRITE(50,*) 'd_real_av_lg=',d_real_ind_lg
WRITE(50,*) 'd_real_av_cmb=',d_real_ind_cmb
WRITE(50,*) 'd_0_av=',d_0_ind_av
WRITE(50,*) 'd_ts_av=',d_ts_ind_av
WRITE(50,*) 'k_real_av_lg=',k_real_ind_lg
WRITE(50,*) 'k_real_av_cmb=',k_real_ind_cmb
WRITE(50,*) 'k_0_av=',k_0_ind_av
WRITE(50,*) 'k_ts_av=',k_ts_ind_av
WRITE(50,*) 'k_scatter_0=',k_0_ind_sigma
WRITE(50,*) 'k_scatter_ts=',k_ts_ind_sigma
WRITE(50,*) 'd_scatter_0=',d_0_ind_sigma
WRITE(50,*) 'd_scatter_ts=',d_ts_ind_sigma
 CLOSE(50)

 
 
 
!  
! 
! 


DO iii=0,9
DO i=1,10


n_good_ts=0
n_good_0=0
DO uuu=1,64

hsorted_0(uuu)=-1.D0
!  Write(*,*) uuu
IF ((bin_results_0(i,iii,uuu)>0.D0).AND.(bin_results_0(i,iii,uuu)<10.D0)) THEN
hsorted_0(uuu)=bin_results_0(i,iii,uuu)
!  Write(*,*) hsorted_0(uuu)
n_good_0=n_good_0+1
! Write(*,*) n_good_0
ELSE 
hsorted_0(uuu)=-1.D0
END IF


hsorted_ts(uuu)=-1.D0
IF ((bin_results_ts(i,iii,uuu)>0.D0).AND.(bin_results_ts(i,iii,uuu)<10.D0)) THEN
hsorted_ts(uuu)=bin_results_ts(i,iii,uuu)
n_good_ts=n_good_ts+1
ELSE 
hsorted_ts(uuu)=-1.D0
END IF

END DO



DO e=1,64
DO ee=e,64
!  Write(*,*) e,ee
IF ((hsorted_0(e)).LT.(hsorted_0(ee))) THEN
help_sort=hsorted_0(e)
hsorted_0(e)=hsorted_0(ee)
hsorted_0(ee)=help_sort

END IF

IF ((hsorted_ts(e)).LT.(hsorted_ts(ee))) THEN
help_sort=hsorted_ts(e)
hsorted_ts(e)=hsorted_ts(ee)
hsorted_ts(ee)=help_sort
END IF

END DO
END DO
! Write(*,*) n_good_0,n_good_ts
! 
! WRITE(*,*) hsorted_0(1:64)
!


IF (mod(n_good_0,2)==0) THEN
n_half=NINT(DBLE(n_good_0)/2.D0)
bin_results_0_median(i,iii)=(hsorted_0(n_half)+hsorted_0(n_half+1))/2.D0
ELSE
n_half=FLOOR(DBLE(n_good_0)/2.D0)+1
bin_results_0_median(i,iii)=hsorted_0(n_half)
END IF



IF (mod(n_good_ts,2)==0) THEN
n_half=NINT(DBLE(n_good_ts)/2.D0)
bin_results_ts_median(i,iii)=(hsorted_ts(n_half)+hsorted_ts(n_half+1))/2.D0
ELSE
n_half=FLOOR(DBLE(n_good_ts)/2.D0)+1
bin_results_ts_median(i,iii)=hsorted_ts(n_half)
END IF



END DO 
END DO


DO iii=0,9
DO i=1,10
delta_0(i,iii)=0.D0
delta_ts(i,iii)=0.D0


n_good_ts=0
n_good_0=0
DO uuu=1,64

IF (bin_results_0(i,iii,uuu)>0.D0) THEN
n_good_0=n_good_0+1
delta_0(i,iii)=delta_0(i,iii)+(bin_results_0_median(i,iii)-bin_results_0(i,iii,uuu))**2
END IF

IF (bin_results_ts(i,iii,uuu)>0.D0) THEN
n_good_ts=n_good_ts+1
delta_ts(i,iii)=delta_ts(i,iii)+(bin_results_ts_median(i,iii)-bin_results_ts(i,iii,uuu))**2
END IF

END DO

delta_0(i,iii)=SQRT(delta_0(i,iii)/DBLE(n_good_0))
delta_ts(i,iii)=SQRT(delta_ts(i,iii)/DBLE(n_good_ts))


END DO
END DO

! 


DO iii=0,9

WRITE(id_str,*) iii
id_str=TRIM(adjustl(id_str))

OPEN (50,file='plotdata/bin_results_plot3sigms_'//TRIM(id_str)//'.txt')

DO i=1,10
! IF ((delta_0(i,iii)>0.D0).AND.(delta_ts(i,iii)>0.D0)) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii),bin_results_real_cmb(i,iii),bin_results_0_median(i,iii),&
bin_results_0_median(i,iii)+delta_0(i,iii),bin_results_0_median(i,iii)-delta_0(i,iii),&
bin_results_ts_median(i,iii),bin_results_ts_median(i,iii)+delta_ts(i,iii),&
bin_results_ts_median(i,iii)-delta_ts(i,iii)
! END IF
END DO  

 CLOSE(50)
! OPEN(50,file='output_analysis/bin_results_plot3sigms.txt')
! DO i=1,10
! WRITE(50,*) ((DBLE(i)-0.5D0)/10.D0),bin_av_f(i),(bin_av_f(i)+1.D0*bin_sigma_f(i)),(bin_av_f(i)-1.D0*bin_sigma_f(i)),&
! bin_av_l(i),(bin_av_l(i)+1.D0*bin_sigma_l(i)),(bin_av_l(i)-1.D0*bin_sigma_l(i))
! END DO
!  CLOSE(50)

 
END DO



DO iii=0,9

WRITE(id_str,*) iii
id_str=TRIM(adjustl(id_str))

OPEN (50,file='plotdata/bins_shifted_'//TRIM(id_str)//'.txt')

DO i=1,10
IF ((delta_0(i,iii)>0.D0).AND.(delta_ts(i,iii)>0.D0)) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii),bin_results_real_cmb(i,iii),&
bin_results_0_median(i,iii),bin_results_ts_median(i,iii)
END IF
END DO  



 CLOSE(50)



END DO





OPEN (50,file='plotdata/bins_shifted_allcombo.txt')

DO iii=0,9
DO i=1,10
IF ((delta_0(i,iii)>0.D0).AND.(delta_ts(i,iii)>0.D0)) THEN
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii),bin_results_real_cmb(i,iii),&
bin_results_0_median(i,iii),bin_results_ts_median(i,iii)
END IF
END DO  
END DO

 CLOSE(50)

 
OPEN (50,file='plotdata/bin_results_plot3sigms_all.txt')

DO iii=0,9
DO i=1,10
WRITE(50,*) bin_help10(i,iii),bin_results_real_lg(i,iii),bin_results_real_cmb(i,iii),bin_results_0_median(i,iii),&
bin_results_0_median(i,iii)+delta_0(i,iii),bin_results_0_median(i,iii)-delta_0(i,iii),&
bin_results_ts_median(i,iii),bin_results_ts_median(i,iii)+delta_ts(i,iii),&
bin_results_ts_median(i,iii)-delta_ts(i,iii)
END DO  
END DO

 CLOSE(50)

 
 
 
OPEN (50,file='plotdata/binfit_shift.txt')

DO i=0,10
READ(50,*) k_real_lg(i),d_real_lg(i),k_sigma_real_lg(i),dummy_var,dummy_var
READ(50,*) k_real_cmb(i),d_real_cmb(i),k_sigma_real_cmb(i),dummy_var,dummy_var
READ(50,*) k_0(i),d_0(i),k_sigma_0(i),dummy_var,dummy_var
READ(50,*) k_ts(i),d_ts(i),k_sigma_ts(i),dummy_var,dummy_var
END DO 

 CLOSE(50)

 

d_0_av=0.D0 
d_real_av_lg =0.D0
d_real_av_cmb =0.D0
d_ts_av=0.D0
DO i=0,9
d_0_av=d_0_av+d_0(i)
d_real_av_lg=d_real_av_lg+d_real_lg(i)
d_real_av_cmb=d_real_av_cmb+d_real_cmb(i)
d_ts_av=d_ts_av+d_ts(i)
END DO
d_0_av=d_0_av/10.D0
d_real_av_lg=d_real_av_lg/10.D0
d_real_av_cmb=d_real_av_cmb/10.D0
d_ts_av=d_ts_av/10.D0
 
k_0_av=0.D0 
k_real_av_lg=0.D0
k_real_av_cmb=0.D0
k_ts_av=0.D0
DO i=0,9
k_0_av=k_0_av+k_0(i)
k_real_av_lg=k_real_av_lg+k_real_lg(i)
k_real_av_cmb=k_real_av_cmb+k_real_cmb(i)
k_ts_av=k_ts_av+k_ts(i)
END DO
k_0_av=k_0_av/10.D0
k_real_av_lg=k_real_av_lg/10.D0
k_real_av_cmb=k_real_av_cmb/10.D0
k_ts_av=k_ts_av/10.D0

k_scatter_0=0.D0
k_scatter_ts=0.D0
DO i=0,9
k_scatter_0=k_scatter_0+(k_0(i)-k_0_av)**2
k_scatter_ts=k_scatter_ts+(k_ts(i)-k_ts_av)**2
END DO
k_scatter_0=SQRT(k_scatter_0/10.D0)
k_scatter_ts=SQRT(k_scatter_ts/10.D0)

d_scatter_0=0.D0
d_scatter_ts=0.D0
DO i=0,9
d_scatter_0=d_scatter_0+(d_0(i)-d_0_av)**2
d_scatter_ts=d_scatter_ts+(d_ts(i)-d_ts_av)**2
END DO
d_scatter_0=SQRT(d_scatter_0/10.D0)
d_scatter_ts=SQRT(d_scatter_ts/10.D0)



dev_0_av_lg=ABS((k_real_av_lg-k_0_av)/k_scatter_0)
dev_ts_av_lg=ABS((k_real_av_lg-k_ts_av)/k_scatter_ts)

prop_0_av_lg=int_prob_dist(NINT(dev_0_av_lg*100.D0))
prop_ts_av_lg=int_prob_dist(NINT(dev_ts_av_lg*100.D0))
 
like_0_av_lg=prop_0_av_lg/(prop_0_av_lg+prop_ts_av_lg)
like_ts_av_lg=prop_ts_av_lg/(prop_0_av_lg+prop_ts_av_lg)
 
dev_0_av_cmb=ABS((k_real_av_cmb-k_0_av)/k_scatter_0)
dev_ts_av_cmb=ABS((k_real_av_cmb-k_ts_av)/k_scatter_ts)

prop_0_av_cmb=int_prob_dist(NINT(dev_0_av_cmb*100.D0))
prop_ts_av_cmb=int_prob_dist(NINT(dev_ts_av_cmb*100.D0))
 
like_0_av_cmb=prop_0_av_cmb/(prop_0_av_cmb+prop_ts_av_cmb)
like_ts_av_cmb=prop_ts_av_cmb/(prop_0_av_cmb+prop_ts_av_cmb)
 
 
 
DO i=0,10

dev_0_lg(i)=ABS((k_real_lg(i)-k_0(i))/k_sigma_0(i))
dev_ts_lg(i)=ABS((k_real_lg(i)-k_ts(i))/k_sigma_ts(i))

 prop_0_lg(i)=int_prob_dist(NINT(dev_0_lg(i)*100.D0))
 prop_ts_lg(i)=int_prob_dist(NINT(dev_ts_lg(i)*100.D0))
 
 like_0_lg(i)=prop_0_lg(i)/(prop_0_lg(i)+prop_ts_lg(i))
 like_ts_lg(i)=prop_ts_lg(i)/(prop_0_lg(i)+prop_ts_lg(i))
 
 
 dev_0_cmb(i)=ABS((k_real_cmb(i)-k_0(i))/k_sigma_0(i))
dev_ts_cmb(i)=ABS((k_real_cmb(i)-k_ts(i))/k_sigma_ts(i))

 prop_0_cmb(i)=int_prob_dist(NINT(dev_0_cmb(i)*100.D0))
 prop_ts_cmb(i)=int_prob_dist(NINT(dev_ts_cmb(i)*100.D0))
 
 like_0_cmb(i)=prop_0_cmb(i)/(prop_0_cmb(i)+prop_ts_cmb(i))
 like_ts_cmb(i)=prop_ts_cmb(i)/(prop_0_cmb(i)+prop_ts_cmb(i))
 
 
 END DO
 
 
 
 OPEN (50,file='plotdata/bins_shifted_analysis.txt')
 WRITE(50,*) 'reference frame, dev_lcdm, dev_lcdm, prop_0, prop_ts, like_0, like_ts'
DO i=0,9
WRITE(50,*) 'LG',dev_0_lg(i),dev_ts_lg(i),prop_0_lg(i),prop_ts_lg(i),like_0_lg(i),like_ts_lg(i)
WRITE(50,*) 'CMB',dev_0_cmb(i),dev_ts_cmb(i),prop_0_cmb(i),prop_ts_cmb(i),like_0_cmb(i),like_ts_cmb(i)
END DO 
WRITE(50,*) '-------------------------------------------------------------------------------'
WRITE(50,*) 'LG',dev_0_lg(10),dev_ts_lg(10),prop_0_lg(10),prop_ts_lg(10),like_0_lg(10),like_ts_lg(10)
WRITE(50,*) 'CMB',dev_0_cmb(10),dev_ts_cmb(10),prop_0_cmb(10),prop_ts_cmb(10),like_0_cmb(10),like_ts_cmb(10)
WRITE(50,*) 'LG',dev_0_av_lg,dev_ts_av_lg,prop_0_av_lg,prop_ts_av_lg,like_0_av_lg,like_ts_av_lg
WRITE(50,*) 'CMB',dev_0_av_cmb,dev_ts_av_cmb,prop_0_av_cmb,prop_ts_av_cmb,like_0_av_cmb,like_ts_av_cmb
 CLOSE(50)

 
 
 
 
 
 OPEN (50,file='plotdata/bin_results_plot3sigms_all_avk.txt')
WRITE(50,*) 'd_real_av_lg=',d_real_av_lg
WRITE(50,*) 'd_real_av_cmb=',d_real_av_cmb
WRITE(50,*) 'd_0_av=',d_0_av
WRITE(50,*) 'd_ts_av=',d_ts_av
WRITE(50,*) 'k_real_av_lg=',k_real_av_lg
WRITE(50,*) 'k_real_av_cmb=',k_real_av_cmb
WRITE(50,*) 'k_0_av=',k_0_av
WRITE(50,*) 'k_ts_av=',k_ts_av
WRITE(50,*) 'k_scatter_0=',k_scatter_0
WRITE(50,*) 'k_scatter_ts=',k_scatter_ts
WRITE(50,*) 'd_scatter_0=',d_scatter_0
WRITE(50,*) 'd_scatter_ts=',d_scatter_ts
 CLOSE(50)

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


END PROGRAM 



