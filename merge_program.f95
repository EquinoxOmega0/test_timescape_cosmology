PROGRAM combine_for_scatter
 use ieee_arithmetic
IMPLICIT NONE

INTEGER, parameter :: n_grid = 20
! declaration of variables
double precision :: PI,goldenratio!,ts_modificator,slope_ts
integer :: io_err,n,i,ii,iii,n_fg,npara,n_help,uuu,n_id,n_real_lg,n_real_cmb,nin_i,nin_ii,n2,n_inside
double precision, allocatable :: H(:,:),distance(:,:),weights(:,:),inside_fi(:,:)
double precision, allocatable :: H_ts(:,:),distance_ts(:,:),weights_ts(:,:),inside_fi_ts(:,:)
double precision, allocatable :: H_real_cmb(:),distance_real_cmb(:),weights_real_cmb(:),inside_fi_real_cmb(:)
double precision, allocatable :: H_real_lg(:),distance_real_lg(:),weights_real_lg(:),inside_fi_real_lg(:)
double precision, allocatable :: inv_weights_real_cmb(:),inv_weights_real_lg(:)
logical, allocatable :: in_limited(:,:),in_real_cmb_limited(:),in_real_lg_limited(:)
double precision, dimension(0:200,0:200) :: result_map
double precision :: help_x2,help_y2,av_H_lcdm,av_H_ts,bias,ts_high,ts_low,av_fract_infi,z_limit
double precision :: weight_sum_ts,weight_sum_lcdm,delta_inside_fi,d,dbar,k,kbar,av_H_tsobs,div_cor
integer :: help_x,help_y
character(20) :: mockstr
character(20) :: id_str
integer, dimension(1:8) :: n_count
integer, dimension(1:64) :: ncombi_count
double precision, dimension(1:64) :: fract_fi_ts,fract_fi_lcdm
double precision ::  distance_limit,number_limit,bin_width10,fract_fi_realts,fract_fi_reallcdm
double precision, dimension(1:100) :: bin_cmb,bin_lg,bin_lcdm_av,bin_lcdm_up,bin_lcdm_low,bin_lcdm_sigma
double precision, dimension(1:100) :: bin_ts_av,bin_ts_up,bin_ts_low,bin_ts_sigma
double precision, dimension(1:100,1:64) :: bin_lcdm,bin_ts,bin_weight_sum
double precision, dimension(1:100) :: bin_help10,bin_help20,bin_help100,bin_weight_counter1,bin_weight_counter2

double precision, dimension(1:n_grid,1:n_grid) :: map_count_cmb_f,map_count_lg_f,map_count_lcdm_f,map_count_ts_f
double precision, dimension(1:n_grid,1:n_grid) :: map_count_cmb_s,map_count_lg_s,map_count_lcdm_s,map_count_ts_s

double precision, allocatable :: H_combi_ts(:,:),weights_combi_ts(:,:),inside_fi_combi_ts(:,:),distance_combi_ts(:,:)
double precision, allocatable :: H_combi_lcdm(:,:),weights_combi_lcdm(:,:),inv_weights(:,:)
double precision, allocatable :: inside_fi_combi_lcdm(:,:),distance_combi_lcdm(:,:)
double precision, allocatable :: Hcor_combi(:,:),H_combi_obsts(:,:)

double precision :: ts_low_av,ts_high_av,ts_low_sigma,ts_high_sigma,sigma_bias

! define constants
PI=ACOS(-1.D0)
!Defination of golden ratio
goldenratio=(1.D0+SQRT(5.D0))/2.D0
bias=0.75D0

ts_low=50.1D0
ts_high=61.7D0

! ts_low_av=50.1D0
! ts_high_av=61.7D0
! ts_low_sigma=1.7D0
! ts_high_sigma=3.D0
! sigma_bias=1.0
! ts_low=ts_low_av+ts_low_sigma*sigma_bias
! ts_high=ts_high_av-ts_high_sigma*sigma_bias



!  km $\textrm{s}^{-1}$ $\textrm{Mpc}^{-1}$ and the average (from inside a wall) observed (dressed, in the language of timescape cosmology) Hubble parameter to be  km $\textrm{s}^{-1}
 
  OPEN(50,file='limits.txt')
READ(50,*) distance_limit
READ(50,*) number_limit
! READ(50,*) z_limit
 CLOSE(50)
 
 
 OPEN(71,file='protocol.txt')
 OPEN(73,file='av_fract_infi.txt')
 
WRITE(73,*) 'd_limit = ',distance_limit  
 
DO uuu=1,8


IF (uuu==1) THEN
mockstr='mock1'
END IF
IF (uuu==2) THEN
mockstr='mock2'
END IF
IF (uuu==3) THEN
mockstr='mock3'
END IF
IF (uuu==4) THEN
mockstr='mock4'
END IF
IF (uuu==5) THEN
mockstr='mock5'
END IF
IF (uuu==6) THEN
mockstr='mock6'
END IF
IF (uuu==7) THEN
mockstr='mock7'
END IF
IF (uuu==8) THEN
mockstr='mock8'
END IF


mockstr=TRIM(adjustl(mockstr))



! get length of files
OPEN (50,file='sim_LCDM/output/full_results_'//TRIM(mockstr)//'.txt')
io_err=0
n_count(uuu)=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_count(uuu)=n_count(uuu)+1
END DO
 CLOSE(50)
n_count(uuu)=n_count(uuu)-1

END DO

n=0
DO uuu=1,8
IF (n_count(uuu)>n) THEN
n=n_count(uuu)
END IF
END DO

! allocate arrays
allocate(H_ts(1:n,1:8))
allocate(weights_ts(1:n,1:8))
allocate(inside_fi_ts(1:n,1:8))
allocate(distance_ts(1:n,1:8))
allocate(H(1:n,1:8))
allocate(weights(1:n,1:8))
allocate(inside_fi(1:n,1:8))
allocate(distance(1:n,1:8))


n2=2*n
allocate(H_combi_ts(1:n2,1:64))
allocate(weights_combi_ts(1:n2,1:64))
allocate(inside_fi_combi_ts(1:n2,1:64))
allocate(distance_combi_ts(1:n2,1:64))
allocate(H_combi_lcdm(1:n2,1:64))
allocate(weights_combi_lcdm(1:n2,1:64))
allocate(inside_fi_combi_lcdm(1:n2,1:64))
allocate(distance_combi_lcdm(1:n2,1:64))

allocate(Hcor_combi(1:n2,1:64))
allocate(H_combi_obsts(1:n2,1:64))
allocate(in_limited(1:n2,1:64))
allocate(inv_weights(1:n2,1:64))




OPEN (50,file='real_data_lcdm/output/full_results.txt')
io_err=0
n_real_cmb=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_real_cmb=n_real_cmb+1
END DO
 CLOSE(50)
n_real_cmb=n_real_cmb-1

OPEN (50,file='real_data_timescape/output/full_results.txt')
io_err=0
n_real_lg=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_real_lg=n_real_lg+1
END DO
 CLOSE(50)
n_real_lg=n_real_lg-1



allocate(H_real_cmb(1:n_real_cmb))
allocate(distance_real_cmb(1:n_real_cmb))
allocate(weights_real_cmb(1:n_real_cmb))
allocate(inside_fi_real_cmb(1:n_real_cmb))
allocate(in_real_cmb_limited(1:n_real_cmb))
allocate(inv_weights_real_cmb(1:n_real_cmb))


allocate(H_real_lg(1:n_real_lg))
allocate(distance_real_lg(1:n_real_lg))
allocate(weights_real_lg(1:n_real_lg))
allocate(inside_fi_real_lg(1:n_real_lg))
allocate(in_real_lg_limited(1:n_real_lg))
allocate(inv_weights_real_lg(1:n_real_lg))


WRITE(*,*) 'Initialization done'



OPEN (50,file='real_data_lcdm/output/full_results.txt')
DO i=1,n_real_cmb
READ(50,*) inside_fi_real_cmb(i),H_real_cmb(i),distance_real_cmb(i),weights_real_cmb(i)
END DO
 CLOSE(50)
WRITE(*,*) n_real_cmb,'lines of observational data in the CMB frame loaded'

OPEN (50,file='real_data_timescape/output/full_results.txt')
DO i=1,n_real_lg
READ(50,*) inside_fi_real_lg(i),H_real_lg(i),distance_real_lg(i),weights_real_lg(i)
END DO
 CLOSE(50)
WRITE(*,*) n_real_lg,'lines of observational data in the LG frame loaded'

 
! Daten einlesen
DO uuu=1,8


IF (uuu==1) THEN
mockstr='mock1'
END IF
IF (uuu==2) THEN
mockstr='mock2'
END IF
IF (uuu==3) THEN
mockstr='mock3'
END IF
IF (uuu==4) THEN
mockstr='mock4'
END IF
IF (uuu==5) THEN
mockstr='mock5'
END IF
IF (uuu==6) THEN
mockstr='mock6'
END IF
IF (uuu==7) THEN
mockstr='mock7'
END IF
IF (uuu==8) THEN
mockstr='mock8'
END IF


mockstr=TRIM(adjustl(mockstr))


DO i=1,n
in_limited(i,uuu)=.FALSE.
END DO


OPEN(50,file='sim_dark/output/full_results_'//TRIM(mockstr)//'.txt')
DO i=1,n_count(uuu)
READ(50,*) inside_fi_ts(i,uuu),H_ts(i,uuu),distance_ts(i,uuu),weights_ts(i,uuu)
END DO
 CLOSE(50)

 
OPEN(50,file='sim_LCDM/output/full_results_'//TRIM(mockstr)//'.txt')
DO i=1,n_count(uuu)
READ(50,*) inside_fi(i,uuu),H(i,uuu),distance(i,uuu),weights(i,uuu)
END DO
 CLOSE(50)

WRITE(*,*) n_count(uuu),'lines of simulated data loaded'

 END DO


 WRITE(71,*) 'Sizes of combined sets:'


 OPEN(61,file='analysis/components.txt')
! Daten in passend großen Sets zusammenführen
 n_id=0
 DO i=1,8
 DO ii=1,8
 

n_id=n_id+1

  WRITE(61,*) n_id,i,ii

ncombi_count(n_id)=n_count(i)+n_count(ii)
 WRITE(71,*) n_id,ncombi_count(n_id)

DO iii=1,n_count(i)
H_combi_ts(iii,n_id)=H_ts(iii,i)
weights_combi_ts(iii,n_id)=weights_ts(iii,i)
inside_fi_combi_ts(iii,n_id)=inside_fi_ts(iii,i)
distance_combi_ts(iii,n_id)=distance_ts(iii,i)
END DO

DO iii=1,n_count(ii)
H_combi_ts(n_count(i)+iii,n_id)=H_ts(iii,ii)
weights_combi_ts(n_count(i)+iii,n_id)=weights_ts(iii,ii)
inside_fi_combi_ts(n_count(i)+iii,n_id)=inside_fi_ts(iii,ii)
distance_combi_ts(n_count(i)+iii,n_id)=distance_ts(iii,ii)
END DO


DO iii=1,n_count(i)
H_combi_lcdm(iii,n_id)=H(iii,i)
weights_combi_lcdm(iii,n_id)=weights(iii,i)
inside_fi_combi_lcdm(iii,n_id)=inside_fi(iii,i)
distance_combi_lcdm(iii,n_id)=distance(iii,i)
END DO

DO iii=1,n_count(ii)
H_combi_lcdm(n_count(i)+iii,n_id)=H(iii,ii)
weights_combi_lcdm(n_count(i)+iii,n_id)=weights(iii,ii)
inside_fi_combi_lcdm(n_count(i)+iii,n_id)=inside_fi(iii,ii)
distance_combi_lcdm(n_count(i)+iii,n_id)=distance(iii,ii)
END DO



 
 END DO
 END DO
 WRITE(*,*) 'data sets combined'
 CLOSE(61)
! Normalisieren 
 delta_inside_fi=0.D0
 
   OPEN(50,file='analysis/av_inside_fi.txt')
 
DO i=1,64
 
av_H_lcdm=0.D0
av_H_ts=0.D0
weight_sum_lcdm=0.D0
weight_sum_ts=0.D0
fract_fi_ts(i)=0.D0
fract_fi_lcdm(i)=0.D0

DO ii=1,ncombi_count(i)
av_H_lcdm=av_H_lcdm+H_combi_lcdm(ii,i)*weights_combi_lcdm(ii,i)
av_H_ts=av_H_ts+H_combi_ts(ii,i)*weights_combi_ts(ii,i)
weight_sum_lcdm=weight_sum_lcdm+weights_combi_lcdm(ii,i)
weight_sum_ts=weight_sum_ts+weights_combi_ts(ii,i)
fract_fi_lcdm(i)=fract_fi_lcdm(i)+inside_fi_combi_lcdm(ii,i)*weights_combi_lcdm(ii,i)
fract_fi_ts(i)=fract_fi_ts(i)+inside_fi_combi_ts(ii,i)*weights_combi_ts(ii,i)

END DO

av_H_lcdm=av_H_lcdm/weight_sum_lcdm
av_H_ts=av_H_ts/weight_sum_ts

fract_fi_lcdm(i)=fract_fi_lcdm(i)/weight_sum_lcdm
fract_fi_ts(i)=fract_fi_ts(i)/weight_sum_ts
WRITE(50,*) i,fract_fi_lcdm(i),fract_fi_ts(i),(fract_fi_lcdm(i)-fract_fi_ts(i))

delta_inside_fi=delta_inside_fi+(fract_fi_lcdm(i)-fract_fi_ts(i))


DO ii=1,ncombi_count(i)
H_combi_lcdm(ii,i)=H_combi_lcdm(ii,i)/av_H_lcdm
H_combi_ts(ii,i)=H_combi_ts(ii,i)/av_H_ts
END DO


 
 END DO
  CLOSE(50)
 
  WRITE(*,*) 'simulated data normalised'
 ! systematische Abweichung von Beobachtungsmodel und "echten" Daten
 delta_inside_fi=delta_inside_fi/64.D0
 WRITE(71,*) 'difference between fi model and real data'
 WRITE(71,*) delta_inside_fi
 
  OPEN(50,file='plotdata/delta_inside_fi.txt')
 WRITE(50,*) 'd = ',delta_inside_fi
 CLOSE(50)
 
 
 
 av_fract_infi=0.D0
 ! Korrektur dafür
 DO i=1,64
 fract_fi_lcdm(i)=fract_fi_lcdm(i)-delta_inside_fi
 av_fract_infi=av_fract_infi+fract_fi_lcdm(i)
 END DO
 av_fract_infi=av_fract_infi/64.D0
 WRITE(73,*) 'av_fract_infi = ',av_fract_infi
 
 ! füge künstlich die Timescape-Effekte in die Daten ein
 DO i=1,64
 
 k=((ts_low-ts_high)/(1.D0-fract_fi_lcdm(i)))*bias ! bias should be 1, if unbiased and 0, if totally biased
 kbar=k/ts_high
 dbar=-kbar*fract_fi_lcdm(i)
 
 DO ii=1,ncombi_count(i)
 Hcor_combi(ii,i)=kbar*inside_fi_combi_ts(ii,i)+dbar
 H_combi_obsts(ii,i)=H_combi_lcdm(ii,i)+ Hcor_combi(ii,i)
 END DO
 
 ! Werte renormalisieren
 av_H_tsobs=0.D0
  weight_sum_ts=0.D0
 DO ii=1,ncombi_count(i)
 weight_sum_ts=weight_sum_ts+weights_combi_ts(ii,i)
 av_H_tsobs=av_H_tsobs+H_combi_obsts(ii,i)*weights_combi_ts(ii,i)
END DO

av_H_tsobs=av_H_tsobs/weight_sum_ts

 END DO
 
 ! Gewichte richtig stellen und normalisieren
  DO i=1,64
 
 DO ii=1,ncombi_count(i)
 inv_weights(ii,i)=1.D0/SQRT(weights_combi_lcdm(ii,i))
 H_combi_obsts(ii,i)= H_combi_obsts(ii,i)/av_H_tsobs
 END DO
 END DO
 
 
 

  WRITE(*,*) 'fake timescape data calculated'
 
 ! Ausgabe der Modeldaten
 DO i=1,64
  WRITE(id_str,*) i
 id_str=TRIM(adjustl(id_str))
 
 
 OPEN(50,file='sim_data_lcdm/full_results_'//TRIM(id_str)//'.txt')
 DO ii=1,ncombi_count(i)
 WRITE(50,*) inside_fi_combi_lcdm(ii,i),H_combi_lcdm(ii,i),distance_combi_lcdm(ii,i),inv_weights(ii,i)
 END DO
 CLOSE(50)
 
 
 
 
 OPEN(50,file='sim_data_timescape/full_results_'//TRIM(id_str)//'.txt')
 DO ii=1,ncombi_count(i)
 WRITE(50,*) inside_fi_combi_lcdm(ii,i), H_combi_obsts(ii,i),distance_combi_lcdm(ii,i),inv_weights(ii,i)
 END DO
 CLOSE(50)
 
 
 
 END DO
 
  WRITE(*,*) 'simulated data written to files'
 
!Normalisation
 
av_H_lcdm=0.D0
av_H_ts=0.D0
weight_sum_lcdm=0.D0
weight_sum_ts=0.D0
fract_fi_realts=0.D0
fract_fi_reallcdm=0.D0

DO i=1,n_real_cmb
av_H_lcdm=av_H_lcdm+H_real_cmb(i)*weights_real_cmb(i)
weight_sum_lcdm=weight_sum_lcdm+weights_real_cmb(i)
fract_fi_reallcdm=fract_fi_reallcdm+inside_fi_real_cmb(i)*weights_real_cmb(i)
END DO





DO i=1,n_real_lg
av_H_ts=av_H_ts+H_real_lg(i)*weights_real_lg(i)
weight_sum_ts=weight_sum_ts+weights_real_lg(i)
fract_fi_realts=fract_fi_realts+inside_fi_real_lg(i)*weights_real_lg(i)
END DO

av_H_lcdm=av_H_lcdm/weight_sum_lcdm
av_H_ts=av_H_ts/weight_sum_ts

fract_fi_reallcdm=fract_fi_reallcdm/weight_sum_lcdm
fract_fi_realts=fract_fi_realts/weight_sum_ts



 WRITE(73,*) 'fract_fi_realts = ',fract_fi_realts


DO i=1,n_real_cmb
H_real_cmb(i)=H_real_cmb(i)/av_H_lcdm
END DO

DO i=1,n_real_lg
H_real_lg(i)=H_real_lg(i)/av_H_ts
END DO




 DO i=1,n_real_cmb
 inv_weights_real_cmb(i)=1.D0/SQRT(weights_real_cmb(i))
 END DO

 DO i=1,n_real_lg
 inv_weights_real_lg(i)=1.D0/SQRT(weights_real_lg(i))
 END DO
 
 
  WRITE(*,*) 'real data normalised'
 
 OPEN (50,file='real_data_calibrated/full_results_cmb.txt')
DO i=1,n_real_cmb
WRITE(50,*) inside_fi_real_cmb(i),H_real_cmb(i),distance_real_cmb(i),inv_weights_real_cmb(i)
END DO
 CLOSE(50)


OPEN (50,file='real_data_calibrated/full_results_lg.txt')
DO i=1,n_real_lg
WRITE(50,*) inside_fi_real_lg(i),H_real_lg(i),distance_real_lg(i),inv_weights_real_lg(i)
END DO
 CLOSE(50)

   WRITE(*,*) 'real data written to files'
 
 
DO i=1,n_grid
DO ii=1,n_grid
map_count_cmb_f(i,ii)=0.D0
map_count_lg_f(i,ii)=0.D0
map_count_lcdm_f(i,ii)=0.D0
map_count_ts_f(i,ii)=0.D0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT((inside_fi_combi_lcdm(ii,i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_combi_lcdm(ii,i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_lcdm_f(help_x,help_y)=map_count_lcdm_f(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO


OPEN(50,file='plotdata/map_poisson_lcdm_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_lcdm_f(i,ii)
END DO
END DO
 CLOSE(50)


DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT((inside_fi_combi_lcdm(ii,i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_combi_obsts(ii,i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_ts_f(help_x,help_y)=map_count_ts_f(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO



OPEN(50,file='plotdata/map_poisson_ts_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_ts_f(i,ii)
END DO
END DO
 CLOSE(50)

 
DO i=1,n_real_cmb

help_x=NINT((inside_fi_real_cmb(i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_real_cmb(i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_cmb_f(help_x,help_y)=map_count_cmb_f(help_x,help_y)+weights_real_cmb(i)
END IF
END IF

END DO


OPEN(50,file='plotdata/map_poisson_real_cmb_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_cmb_f(i,ii)
END DO
END DO
 CLOSE(50)


 
 
DO i=1,n_real_lg

help_x=NINT((inside_fi_real_lg(i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_real_lg(i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_lg_f(help_x,help_y)=map_count_lg_f(help_x,help_y)+weights_real_lg(i)
END IF
END IF

END DO

OPEN(50,file='plotdata/map_poisson_real_lg_f.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_lg_f(i,ii)
END DO
END DO
 CLOSE(50)



 OPEN(50,file='plotdata/inside_fi_fractions_f.txt')
DO i=1,64
DO ii=1,ncombi_count(i)
WRITE(50,*) inside_fi_combi_lcdm(ii,i),inside_fi_combi_ts(ii,i),weights_combi_lcdm(ii,i)
END DO
END DO
 CLOSE(50)
 
 
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(inside_fi_combi_ts(ii,i)*200.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO

OPEN(50,file='plotdata/inside_fi_model_vs_dark_f.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

  
 
 

 
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(H_combi_lcdm(ii,i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO

OPEN(50,file='plotdata/map_sim_lcdm_all_weighted.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

  
  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


 
 
DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(H_combi_obsts(ii,i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO

OPEN(50,file='plotdata/map_sim_ts_all_weighted.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


 
  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_cmb

help_x=NINT(inside_fi_real_cmb(i)*200.D0)
help_y=NINT(H_real_cmb(i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_cmb(i)
END IF
END IF

END DO


OPEN(50,file='plotdata/map_real_cmb_weighted.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

 
 
   
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_lg

help_x=NINT(inside_fi_real_lg(i)*200.D0)
help_y=NINT(H_real_lg(i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_lg(i)
END IF
END IF

END DO


OPEN(50,file='plotdata/map_real_lg_weighted.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


   
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_cmb

help_x=NINT(distance_real_cmb(i)/4.D0)
help_y=NINT(inside_fi_real_cmb(i)*200.D0)


IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_cmb(i)
END IF
END IF

END DO


OPEN(50,file='plotdata/map_real_fi_distance.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)*4.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


 
 
DO i=1,64
DO ii=1,ncombi_count(i)

help_x=NINT(distance_combi_lcdm(ii,i)/4.D0)
help_y=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)


IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END DO
END DO

OPEN(50,file='plotdata/map_sim_fi_distance.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)*4.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

   WRITE(*,*) 'plot data written to files'
 
 
bin_width10=0.5D0/10.D0

DO i=1,10
bin_help10(i)=(DBLE(i)-0.5D0)/10.D0
END DO


DO i=1,100

bin_cmb(i)=0.D0
bin_lg(i)=0.D0

bin_lcdm_av(i)=0.D0
bin_lcdm_up(i)=0.D0
bin_lcdm_low(i)=0.D0
bin_lcdm_sigma(i)=0.D0

bin_ts_av(i)=0.D0
bin_ts_up(i)=0.D0
bin_ts_low(i)=0.D0
bin_ts_sigma(i)=0.D0

DO ii=1,64
bin_lcdm(i,ii)=0.D0
bin_ts(i,ii)=0.D0
bin_weight_sum(i,ii)=0.D0
END DO

bin_weight_counter1(i)=0.D0
bin_weight_counter2(i)=0.D0
END DO




DO i=1,10
DO ii=1,64
DO iii=1,ncombi_count(ii)
IF ((inside_fi_combi_lcdm(iii,ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_combi_lcdm(iii,ii)<=(bin_help10(i)+bin_width10))) THEN
bin_lcdm(i,ii)=bin_lcdm(i,ii)+weights_combi_lcdm(iii,ii)*H_combi_lcdm(iii,ii)
bin_ts(i,ii)=bin_ts(i,ii)+weights_combi_lcdm(iii,ii)*H_combi_obsts(iii,ii)
bin_weight_sum(i,ii)=bin_weight_sum(i,ii)+weights_combi_lcdm(iii,ii)
END IF
END DO
bin_lcdm(i,ii)=bin_lcdm(i,ii)/bin_weight_sum(i,ii)
bin_ts(i,ii)=bin_ts(i,ii)/bin_weight_sum(i,ii)
END DO
END DO
 
 
 
DO i=1,10
div_cor=0.D0
DO ii=1,64
IF (ieee_is_nan(bin_lcdm(i,ii))) THEN
div_cor=div_cor+1.D0
ELSE
bin_lcdm_av(i)=bin_lcdm_av(i)+bin_lcdm(i,ii)
bin_ts_av(i)=bin_ts_av(i)+bin_ts(i,ii)
ENDIF
END DO 
bin_lcdm_av(i)=bin_lcdm_av(i)/(64.D0-div_cor)
bin_ts_av(i)=bin_ts_av(i)/(64.D0-div_cor)
END DO


DO i=1,10
div_cor=0.D0
DO ii=1,64
IF (ieee_is_nan(bin_lcdm(i,ii))) THEN
div_cor=div_cor+1.D0
ELSE
bin_lcdm_sigma(i)=bin_lcdm_sigma(i)+((bin_lcdm_av(i)-bin_lcdm(i,ii))**2)
bin_ts_sigma(i)=bin_ts_sigma(i)+((bin_ts_av(i)-bin_ts(i,ii))**2)
ENDIF
END DO 
bin_lcdm_sigma(i)=SQRT(bin_lcdm_sigma(i)/(63.D0-div_cor))
bin_ts_sigma(i)=SQRT(bin_ts_sigma(i)/(63.D0-div_cor))
END DO


DO i=1,10
bin_lcdm_up(i)=bin_lcdm_av(i)+bin_lcdm_sigma(i)
bin_lcdm_low(i)=bin_lcdm_av(i)-bin_lcdm_sigma(i)
bin_ts_up(i)=bin_ts_av(i)+bin_ts_sigma(i)
bin_ts_low(i)=bin_ts_av(i)-bin_ts_sigma(i)
END DO




DO i=1,10
DO ii=1,n_real_cmb
IF ((inside_fi_real_cmb(ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_real_cmb(ii)<=(bin_help10(i)+bin_width10))) THEN
bin_cmb(i)=bin_cmb(i)+weights_real_cmb(ii)*H_real_cmb(ii)
bin_weight_counter1(i)=bin_weight_counter1(i)+weights_real_cmb(ii)
END IF
END DO
bin_cmb(i)=bin_cmb(i)/bin_weight_counter1(i)
END DO


 
DO i=1,10
DO ii=1,n_real_lg
IF ((inside_fi_real_lg(ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_real_lg(ii)<=(bin_help10(i)+bin_width10))) THEN
bin_lg(i)=bin_lg(i)+weights_real_lg(ii)*H_real_lg(ii)
bin_weight_counter2(i)=bin_weight_counter2(i)+weights_real_lg(ii)
END IF
END DO
bin_lg(i)=bin_lg(i)/bin_weight_counter2(i)
END DO


 

OPEN(50,file='plotdata/bin10_res.txt')
DO i=1,10
WRITE(50,*) bin_help10(i),bin_cmb(i),bin_lg(i),bin_lcdm_av(i),bin_lcdm_up(i),bin_lcdm_low(i),&
            bin_ts_av(i),bin_ts_up(i),bin_ts_low(i)
END DO
 CLOSE(50)


 
 
   WRITE(*,*) 'binned data written to files'
 
 

DO i=1,64
! WRITE(*,*) i
DO ii=1,ncombi_count(i)
in_limited(ii,i)=.FALSE.
IF (weights_combi_ts(ii,i)>number_limit) THEN
IF (distance_combi_lcdm(ii,i)<distance_limit) THEN
in_limited(ii,i)=.TRUE.
END IF
END IF
END DO
END DO


DO i=1,n_real_cmb
! WRITE(*,*) i
in_real_cmb_limited(i)=.FALSE.
IF (weights_real_cmb(i)>number_limit) THEN
IF (distance_real_cmb(i)<distance_limit) THEN
in_real_cmb_limited(i)=.TRUE.
END IF
END IF
END DO

DO i=1,n_real_lg
! WRITE(*,*) i
in_real_lg_limited(i)=.FALSE.
IF (weights_real_lg(i)>number_limit) THEN
IF (distance_real_lg(i)<distance_limit) THEN
in_real_lg_limited(i)=.TRUE.
END IF
END IF
END DO


    WRITE(*,*) 'selection criteria imposed'



! Normalisieren 
 delta_inside_fi=0.D0
 
DO i=1,64
 
av_H_lcdm=0.D0
av_H_ts=0.D0
weight_sum_lcdm=0.D0
weight_sum_ts=0.D0
fract_fi_ts(i)=0.D0
fract_fi_lcdm(i)=0.D0
n_inside=0


DO ii=1,ncombi_count(i)

IF (in_limited(ii,i)) THEN
n_inside=n_inside+1
av_H_lcdm=av_H_lcdm+H_combi_lcdm(ii,i)*weights_combi_lcdm(ii,i)
av_H_ts=av_H_ts+H_combi_ts(ii,i)*weights_combi_ts(ii,i)
weight_sum_lcdm=weight_sum_lcdm+weights_combi_lcdm(ii,i)
weight_sum_ts=weight_sum_ts+weights_combi_ts(ii,i)
fract_fi_lcdm(i)=fract_fi_lcdm(i)+inside_fi_combi_lcdm(ii,i)*weights_combi_lcdm(ii,i)
fract_fi_ts(i)=fract_fi_ts(i)+inside_fi_combi_ts(ii,i)*weights_combi_ts(ii,i)
END IF

END DO

WRITE(*,*) n_inside

av_H_lcdm=av_H_lcdm/weight_sum_lcdm
av_H_ts=av_H_ts/weight_sum_ts

fract_fi_lcdm(i)=fract_fi_lcdm(i)/weight_sum_lcdm
fract_fi_ts(i)=fract_fi_ts(i)/weight_sum_ts
WRITE(*,*) fract_fi_lcdm(i),fract_fi_ts(i)
delta_inside_fi=delta_inside_fi+(fract_fi_lcdm(i)-fract_fi_ts(i))


DO ii=1,ncombi_count(i)

IF (in_limited(ii,i)) THEN
H_combi_lcdm(ii,i)=H_combi_lcdm(ii,i)/av_H_lcdm
H_combi_ts(ii,i)=H_combi_ts(ii,i)/av_H_ts
END IF

END DO


 
 END DO
 
     WRITE(*,*) 'simulated data normalised for selected data'
 
 ! systematische Abweichung von Beobachtungsmodel und "echten" Daten
 delta_inside_fi=delta_inside_fi/64.D0
 WRITE(*,*) delta_inside_fi
 
 av_fract_infi=0.D0
 ! Korrektur dafür
 DO i=1,64
 fract_fi_lcdm(i)=fract_fi_lcdm(i)-delta_inside_fi
 WRITE(*,*) i,fract_fi_lcdm(i)
 av_fract_infi=av_fract_infi+fract_fi_lcdm(i)
 END DO
 av_fract_infi=av_fract_infi/64.D0
 WRITE(73,*) 'av_fract_infi_selected = ',av_fract_infi
 
 ! füge künstlich die Timescape-Effekte in die Daten ein
 DO i=1,64
 
 k=((ts_low-ts_high)/(1.D0-fract_fi_lcdm(i)))*bias ! bias should be 1, if unbiased and 0, if totally biased
 kbar=k/ts_high
 dbar=-kbar*fract_fi_lcdm(i)
 
 DO ii=1,ncombi_count(i)
 IF (in_limited(ii,i)) THEN
 Hcor_combi(ii,i)=kbar*inside_fi_combi_ts(ii,i)+dbar
 H_combi_obsts(ii,i)=H_combi_lcdm(ii,i)+ Hcor_combi(ii,i)
 END IF
 END DO
 
 ! Werte renormalisieren
 av_H_tsobs=0.D0
  weight_sum_ts=0.D0
 DO ii=1,ncombi_count(i)
 IF (in_limited(ii,i)) THEN
 weight_sum_ts=weight_sum_ts+weights_combi_ts(ii,i)
 av_H_tsobs=av_H_tsobs+H_combi_obsts(ii,i)*weights_combi_ts(ii,i)
 END IF
END DO

av_H_tsobs=av_H_tsobs/weight_sum_ts

 END DO
 
 ! Gewichte richtig stellen
  DO i=1,64
 
 DO ii=1,ncombi_count(i)
 IF (in_limited(ii,i)) THEN
 weights_combi_lcdm(ii,i)=1.D0/SQRT(weights_combi_lcdm(ii,i))
  H_combi_obsts(ii,i)= H_combi_obsts(ii,i)/av_H_tsobs
 END IF
 END DO
 END DO
 
   WRITE(*,*) 'fake timescape data calculated for selected data'
 
 ! Ausgabe der Modeldaten
 DO i=1,64
  WRITE(id_str,*) i
 id_str=TRIM(adjustl(id_str))
 
 
 OPEN(50,file='sim_data_lcdm/selected_results_'//TRIM(id_str)//'.txt')
 DO ii=1,ncombi_count(i)
 IF (in_limited(ii,i)) THEN
 WRITE(50,*) inside_fi_combi_lcdm(ii,i),H_combi_lcdm(ii,i),distance_combi_lcdm(ii,i),weights_combi_lcdm(ii,i)
 END IF
 END DO
 CLOSE(50)
 
 
 
 
 OPEN(50,file='sim_data_timescape/selected_results_'//TRIM(id_str)//'.txt')
 DO ii=1,ncombi_count(i)
 IF (in_limited(ii,i)) THEN
 WRITE(50,*) inside_fi_combi_lcdm(ii,i), H_combi_obsts(ii,i),distance_combi_lcdm(ii,i),weights_combi_lcdm(ii,i)
 END IF
 END DO
 CLOSE(50)
 
 
 
 END DO
 
    WRITE(*,*) 'simulated data written to files'
 

 
!Normalisation
 
av_H_lcdm=0.D0
av_H_ts=0.D0
weight_sum_lcdm=0.D0
weight_sum_ts=0.D0
fract_fi_realts=0.D0
fract_fi_reallcdm=0.D0

DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
av_H_lcdm=av_H_lcdm+H_real_cmb(i)*weights_real_cmb(i)
weight_sum_lcdm=weight_sum_lcdm+weights_real_cmb(i)
fract_fi_reallcdm=fract_fi_reallcdm+inside_fi_real_cmb(i)*weights_real_cmb(i)
END IF
END DO





DO i=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
av_H_ts=av_H_ts+H_real_lg(i)*weights_real_lg(i)
weight_sum_ts=weight_sum_ts+weights_real_lg(i)
fract_fi_realts=fract_fi_realts+inside_fi_real_lg(i)*weights_real_lg(i)
END IF
END DO

av_H_lcdm=av_H_lcdm/weight_sum_lcdm
av_H_ts=av_H_ts/weight_sum_ts

fract_fi_reallcdm=fract_fi_reallcdm/weight_sum_lcdm
fract_fi_realts=fract_fi_realts/weight_sum_ts
 WRITE(73,*) 'fract_fi_realts_selected = ',fract_fi_realts




DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
H_real_cmb(i)=H_real_cmb(i)/av_H_lcdm
END IF
END DO

DO i=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
H_real_lg(i)=H_real_lg(i)/av_H_ts
END IF
END DO



 DO i=1,n_real_cmb
 IF (in_real_cmb_limited(i)) THEN
 inv_weights_real_cmb(i)=1.D0/SQRT(weights_real_cmb(i))
 END IF
 END DO

 DO i=1,n_real_lg
 IF (in_real_lg_limited(i)) THEN
 inv_weights_real_lg(i)=1.D0/SQRT(weights_real_lg(i))
 END IF
 END DO
 
      WRITE(*,*) 'real data normalised for selected data'

 
 OPEN (50,file='real_data_calibrated/selected_results_cmb.txt')
DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
WRITE(50,*) inside_fi_real_cmb(i),H_real_cmb(i),distance_real_cmb(i),inv_weights_real_cmb(i)
END IF
END DO
 CLOSE(50)


OPEN (50,file='real_data_calibrated/selected_results_lg.txt')
DO i=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
WRITE(50,*) inside_fi_real_lg(i),H_real_lg(i),distance_real_lg(i),inv_weights_real_lg(i)
END IF
END DO
 CLOSE(50)

 
     WRITE(*,*) 'real data written to files'

     
 
 
DO i=1,n_grid
DO ii=1,n_grid
map_count_cmb_f(i,ii)=0.D0
map_count_lg_f(i,ii)=0.D0
map_count_lcdm_f(i,ii)=0.D0
map_count_ts_f(i,ii)=0.D0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT((inside_fi_combi_lcdm(ii,i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_combi_lcdm(ii,i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_lcdm_f(help_x,help_y)=map_count_lcdm_f(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF
END IF
END DO
END DO


OPEN(50,file='plotdata/map_poisson_lcdm_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_lcdm_f(i,ii)
END DO
END DO
 CLOSE(50)


DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT((inside_fi_combi_lcdm(ii,i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_combi_obsts(ii,i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_ts_f(help_x,help_y)=map_count_ts_f(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF
END IF
END DO
END DO



OPEN(50,file='plotdata/map_poisson_ts_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_ts_f(i,ii)
END DO
END DO
 CLOSE(50)

 
DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
help_x=NINT((inside_fi_real_cmb(i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_real_cmb(i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_cmb_f(help_x,help_y)=map_count_cmb_f(help_x,help_y)+weights_real_cmb(i)
END IF
END IF
END IF
END DO


OPEN(50,file='plotdata/map_poisson_real_cmb_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_cmb_f(i,ii)
END DO
END DO
 CLOSE(50)


 
 
DO i=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
help_x=NINT((inside_fi_real_lg(i)+(1.D0/(2.D0*DBLE(n_grid))))*DBLE(n_grid))
help_y=NINT((H_real_lg(i)+(1.D0/(DBLE(n_grid))))*(DBLE(n_grid)/2.D0))

IF ((help_x>0).AND.(help_x<(n_grid+1))) THEN
IF ((help_y>0).AND.(help_y<(n_grid+1))) THEN
map_count_lg_f(help_x,help_y)=map_count_lg_f(help_x,help_y)+weights_real_lg(i)
END IF
END IF
END IF
END DO

OPEN(50,file='plotdata/map_poisson_real_lg_s.txt')
DO i=1,n_grid
DO ii=1,n_grid
help_x2=(DBLE(i)/DBLE(n_grid))-(1.D0/(2.D0*DBLE(n_grid)))
help_y2=(DBLE(ii)/(DBLE(n_grid)/2.D0))-(1.D0/(DBLE(n_grid)))
WRITE(50,*) help_x2,help_y2,map_count_lg_f(i,ii)
END DO
END DO
 CLOSE(50)




 OPEN(50,file='plotdata/inside_fi_fractions_s.txt')
DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
WRITE(50,*) inside_fi_combi_lcdm(ii,i),inside_fi_combi_ts(ii,i),weights_combi_lcdm(ii,i)
END IF
END DO
END DO
 CLOSE(50)
 
 
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(inside_fi_combi_ts(ii,i)*200.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF
END IF
END DO
END DO

OPEN(50,file='plotdata/inside_fi_model_vs_dark_s.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

  
 
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO



DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(H_combi_lcdm(ii,i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF
END IF
END DO
END DO



OPEN(50,file='plotdata/map_sim_lcdm_all_weighted_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

  
  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


 
 
DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)
help_y=NINT(H_combi_obsts(ii,i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF
END IF
END DO
END DO

OPEN(50,file='plotdata/map_sim_ts_all_weighted_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


 
  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
help_x=NINT(inside_fi_real_cmb(i)*200.D0)
help_y=NINT(H_real_cmb(i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_cmb(i)
END IF
END IF
END IF
END DO


OPEN(50,file='plotdata/map_real_cmb_weighted_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)

 
 
   
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
help_x=NINT(inside_fi_real_lg(i)*200.D0)
help_y=NINT(H_real_lg(i)*100.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_lg(i)
END IF
END IF
END IF
END DO


OPEN(50,file='plotdata/map_real_lg_weighted_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)/200.D0)
help_y2=(DBLE(ii)/100.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


   
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO

 
DO i=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
help_x=NINT(distance_real_cmb(i)/4.D0)
help_y=NINT(inside_fi_real_cmb(i)*200.D0)


IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_real_cmb(i)
END IF
END IF
END IF
END DO


OPEN(50,file='plotdata/map_real_fi_distance_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)*4.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


  
DO i=0,200
DO ii=0,200
result_map(i,ii)=0
END DO
END DO


 
 
DO i=1,64
DO ii=1,ncombi_count(i)
IF (in_limited(ii,i)) THEN
help_x=NINT(distance_combi_lcdm(ii,i)/4.D0)
help_y=NINT(inside_fi_combi_lcdm(ii,i)*200.D0)

IF ((help_x>0).AND.(help_x<200)) THEN
IF ((help_y>0).AND.(help_y<200)) THEN
result_map(help_x,help_y)=result_map(help_x,help_y)+weights_combi_lcdm(ii,i)
END IF
END IF

END IF
END DO
END DO

OPEN(50,file='plotdata/map_sim_fi_distance_selected.txt')
DO i=0,200
DO ii=0,200
help_x2=(DBLE(i)*4.D0)
help_y2=(DBLE(ii)/200.D0)
WRITE(50,*) help_x2,help_y2,result_map(i,ii)
END DO
END DO
 CLOSE(50)


     WRITE(*,*) 'plot data written to files'
 
bin_width10=0.5D0/10.D0

DO i=1,10
bin_help10(i)=(DBLE(i)-0.5D0)/10.D0
END DO


DO i=1,100

bin_cmb(i)=0.D0
bin_lg(i)=0.D0

bin_lcdm_av(i)=0.D0
bin_lcdm_up(i)=0.D0
bin_lcdm_low(i)=0.D0
bin_lcdm_sigma(i)=0.D0

bin_ts_av(i)=0.D0
bin_ts_up(i)=0.D0
bin_ts_low(i)=0.D0
bin_ts_sigma(i)=0.D0

DO ii=1,64
bin_lcdm(i,ii)=0.D0
bin_ts(i,ii)=0.D0
bin_weight_sum(i,ii)=0.D0
END DO

bin_weight_counter1(i)=0.D0
bin_weight_counter2(i)=0.D0
END DO




DO i=1,10
DO ii=1,64
DO iii=1,ncombi_count(ii)
IF (in_limited(iii,ii)) THEN
IF ((inside_fi_combi_lcdm(iii,ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_combi_lcdm(iii,ii)<=(bin_help10(i)+bin_width10))) THEN
bin_lcdm(i,ii)=bin_lcdm(i,ii)+weights_combi_lcdm(iii,ii)*H_combi_lcdm(iii,ii)
bin_ts(i,ii)=bin_ts(i,ii)+weights_combi_lcdm(iii,ii)*H_combi_obsts(iii,ii)
bin_weight_sum(i,ii)=bin_weight_sum(i,ii)+weights_combi_lcdm(iii,ii)
END IF
END IF
END DO
bin_lcdm(i,ii)=bin_lcdm(i,ii)/bin_weight_sum(i,ii)
bin_ts(i,ii)=bin_ts(i,ii)/bin_weight_sum(i,ii)
END DO
END DO
 
 
DO i=1,10
div_cor=0.D0
DO ii=1,64
IF (ieee_is_nan(bin_lcdm(i,ii))) THEN
div_cor=div_cor+1.D0
ELSE
bin_lcdm_av(i)=bin_lcdm_av(i)+bin_lcdm(i,ii)
bin_ts_av(i)=bin_ts_av(i)+bin_ts(i,ii)
ENDIF
END DO 
bin_lcdm_av(i)=bin_lcdm_av(i)/(64.D0-div_cor)
bin_ts_av(i)=bin_ts_av(i)/(64.D0-div_cor)
END DO


DO i=1,10
div_cor=0.D0
DO ii=1,64
IF (ieee_is_nan(bin_lcdm(i,ii))) THEN
div_cor=div_cor+1.D0
ELSE
bin_lcdm_sigma(i)=bin_lcdm_sigma(i)+((bin_lcdm_av(i)-bin_lcdm(i,ii))**2)
bin_ts_sigma(i)=bin_ts_sigma(i)+((bin_ts_av(i)-bin_ts(i,ii))**2)
ENDIF
END DO 
bin_lcdm_sigma(i)=SQRT(bin_lcdm_sigma(i)/(63.D0-div_cor))
bin_ts_sigma(i)=SQRT(bin_ts_sigma(i)/(63.D0-div_cor))
END DO





DO i=1,10
bin_lcdm_up(i)=bin_lcdm_av(i)+bin_lcdm_sigma(i)
bin_lcdm_low(i)=bin_lcdm_av(i)-bin_lcdm_sigma(i)
bin_ts_up(i)=bin_ts_av(i)+bin_ts_sigma(i)
bin_ts_low(i)=bin_ts_av(i)-bin_ts_sigma(i)
END DO




DO i=1,10
DO ii=1,n_real_cmb
IF (in_real_cmb_limited(i)) THEN
IF ((inside_fi_real_cmb(ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_real_cmb(ii)<=(bin_help10(i)+bin_width10))) THEN
bin_cmb(i)=bin_cmb(i)+weights_real_cmb(ii)*H_real_cmb(ii)
bin_weight_counter1(i)=bin_weight_counter1(i)+weights_real_cmb(ii)
END IF
END IF
END DO
bin_cmb(i)=bin_cmb(i)/bin_weight_counter1(i)
END DO


 
DO i=1,10
DO ii=1,n_real_lg
IF (in_real_lg_limited(i)) THEN
IF ((inside_fi_real_lg(ii)>(bin_help10(i)-bin_width10)).AND.(inside_fi_real_lg(ii)<=(bin_help10(i)+bin_width10))) THEN
bin_lg(i)=bin_lg(i)+weights_real_lg(ii)*H_real_lg(ii)
bin_weight_counter2(i)=bin_weight_counter2(i)+weights_real_lg(ii)
END IF
END IF
END DO
bin_lg(i)=bin_lg(i)/bin_weight_counter2(i)
END DO


 

OPEN(50,file='plotdata/bin10_res_selected.txt')
DO i=1,10
WRITE(50,*) bin_help10(i),bin_cmb(i),bin_lg(i),bin_lcdm_av(i),bin_lcdm_up(i),bin_lcdm_low(i),&
            bin_ts_av(i),bin_ts_up(i),bin_ts_low(i)
END DO
 CLOSE(50)


 
     WRITE(*,*) 'binned data written to files'
 
 
 CLOSE(73)
 CLOSE(71)
 
 
 


END PROGRAM 
