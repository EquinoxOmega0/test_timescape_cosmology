PROGRAM kst_programme
! declaration of variables
IMPLICIT NONE

 
double precision :: PI
character(200) :: path_real,path_LCDM,path_timescape,file_real,file_LCDM,file_timescape
double precision, allocatable :: H_real(:),fi_real(:),H_LCDM(:),fi_LCDM(:),H_timescape(:),fi_timescape(:)
double precision, allocatable :: weights_real(:),weights_LCDM(:),weights_timescape(:),meandist_real(:)
integer :: n_real,n_LCDM,n_timescape,i,io_err,n_id,ii,uuu
double precision :: n_real_weight,n_LCDM_weight,n_timescape_weight,help_count,dev_LCDM,dev_timescape
double precision :: distance_LCDM,prob_value_LCDM,distance_timescape,prob_value_timescape,dummy
double precision :: pseudo_mean_LCDM,pseudo_mean_timescape,pseudo_mean_real
character(20) :: id_str
double precision :: rms_LCDM,rms_timescape,ratio_rms

WRITE(*,*) '============================================================'
WRITE(*,*) '    programme Chi2 TEST started'
WRITE(*,*) '============================================================'

! define constants
PI=ACOS(-1.D0)

path_real='real_data_calibrated'
path_LCDM='sim_data_lcdm'
path_timescape='sim_data_timescape'

path_real=adjustl(path_real)
path_LCDM=adjustl(path_LCDM)
path_timescape=adjustl(path_timescape)


 OPEN (55,file='analysis/chi2_test_all.txt')

 DO uuu=1,4
 
 
DO n_id=1,64
WRITE(*,*) uuu,n_id
WRITE(id_str,*) n_id
id_str=TRIM(adjustl(id_str))

select case (uuu)       
case (1)                 
file_real='full_results_lg.txt'
file_LCDM='full_results_'//TRIM(id_str)//'.txt'
file_timescape='full_results_'//TRIM(id_str)//'.txt'
case (2)                 
file_real='full_results_cmb.txt'
file_LCDM='full_results_'//TRIM(id_str)//'.txt'
file_timescape='full_results_'//TRIM(id_str)//'.txt'
case (3)                  
file_real='selected_results_lg.txt'
file_LCDM='selected_results_'//TRIM(id_str)//'.txt'
file_timescape='selected_results_'//TRIM(id_str)//'.txt'
case (4) 
file_real='selected_results_cmb.txt'
file_LCDM='selected_results_'//TRIM(id_str)//'.txt'
file_timescape='selected_results_'//TRIM(id_str)//'.txt'
end select





file_real=adjustl(file_real)
file_LCDM=adjustl(file_LCDM)
file_timescape=adjustl(file_timescape)

! get length of files
OPEN (50,file=TRIM(path_real)//'/'//TRIM(file_real))
io_err=0
n_real=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_real=n_real+1
END DO
 CLOSE(50)
n_real=n_real-1


! get length of files
OPEN (50,file=TRIM(path_LCDM)//'/'//TRIM(file_LCDM))
io_err=0
n_LCDM=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_LCDM=n_LCDM+1
END DO
 CLOSE(50)
n_LCDM=n_LCDM-1
!  n_LCDM=n_LCDM-1
! n_real=n_LCDM
! n_real=10
! get length of files
OPEN (50,file=TRIM(path_timescape)//'/'//TRIM(file_timescape))
io_err=0
n_timescape=0
DO WHILE (io_err==0) 
READ(50,*,iostat=io_err) 
n_timescape=n_timescape+1
END DO
 CLOSE(50)
n_timescape=n_timescape-1
! WRITE(*,*) n_real,n_LCDM,n_timescape

allocate(H_real(1:n_real))
allocate(fi_real(1:n_real))
allocate(weights_real(1:n_real))
allocate(meandist_real(1:n_real))
allocate(H_LCDM(1:n_LCDM))
allocate(fi_LCDM(1:n_LCDM))
allocate(weights_LCDM(1:n_LCDM))
allocate(H_timescape(1:n_timescape))
allocate(fi_timescape(1:n_timescape))
allocate(weights_timescape(1:n_timescape))

! allocate(H_timescape(1:n_real))
! allocate(fi_timescape(1:n_real))
! allocate(weights_timescape(1:n_real))

OPEN (50,file=TRIM(path_real)//'/'//TRIM(file_real))
DO i=1,n_real
READ(50,*) fi_real(i),H_real(i),dummy,weights_real(i)
END DO
 CLOSE(50)


OPEN (50,file=TRIM(path_LCDM)//'/'//TRIM(file_LCDM))
DO i=1,n_LCDM
READ(50,*) fi_LCDM(i),H_LCDM(i),dummy,weights_LCDM(i)
END DO
 CLOSE(50)

! OPEN (50,file=TRIM(path_real)//'/'//TRIM(file_real))
! DO i=1,n_real
OPEN (50,file=TRIM(path_timescape)//'/'//TRIM(file_timescape))
DO i=1,n_timescape
READ(50,*) fi_timescape(i),H_timescape(i),dummy,weights_timescape(i)
END DO
 CLOSE(50)

 
n_real_weight=0
n_LCDM_weight=0
n_timescape_weight=0
pseudo_mean_LCDM=0.D0
pseudo_mean_timescape=0.D0


DO i=1,n_real
weights_real(i)=NINT(1.D0/(weights_real(i)**2))
n_real_weight=n_real_weight+weights_real(i)
END DO

DO i=1,n_real
pseudo_mean_real=0.D0
DO ii=1,n_real
pseudo_mean_real=pseudo_mean_real+&
(((fi_real(i)-fi_real(ii))**2)+((H_real(i)-H_real(ii))**2))*weights_real(ii)
END DO
meandist_real(i)=SQRT(pseudo_mean_real/n_real_weight)
END DO

DO i=1,n_LCDM
weights_LCDM(i)=NINT(1.D0/(weights_LCDM(i)**2))
n_LCDM_weight=n_LCDM_weight+weights_LCDM(i)
END DO

! pseudo_mean_LCDM=SQRT(pseudo_mean_real)*n_LCDM_weight/(n_real_weight**2)

DO i=1,n_timescape
weights_timescape(i)=NINT(1.D0/(weights_timescape(i)**2))
n_timescape_weight=n_timescape_weight+weights_timescape(i)
END DO

! pseudo_mean_timescape=SQRT(pseudo_mean_real)*n_timescape_weight/(n_real_weight**2)
! pseudo_mean_timescape=SQRT(pseudo_mean_timescape)*n_real_weight/(n_timescape_weight**2)
! WRITE(*,*) n_real_weight,n_LCDM_weight,n_timescape_weight
!  WRITE(*,*) pseudo_mean_LCDM,pseudo_mean_timescape
dev_LCDM=0.D0
dev_timescape=0.D0

DO i=1,n_real

distance_LCDM=0.D0
distance_timescape=0.D0

DO ii=1,n_LCDM
distance_LCDM=distance_LCDM+&
(((fi_real(i)-fi_LCDM(ii))**2)+((H_real(i)-H_LCDM(ii))**2))*weights_LCDM(ii)
END DO
distance_LCDM=SQRT(distance_LCDM/n_LCDM_weight)

DO ii=1,n_timescape
distance_timescape=distance_timescape+&
(((fi_real(i)-fi_timescape(ii))**2)+((H_real(i)-H_timescape(ii))**2))*weights_timescape(ii)
END DO
distance_timescape=SQRT(distance_timescape/n_timescape_weight)

dev_LCDM=dev_LCDM+((distance_LCDM-meandist_real(i))**2)*weights_real(i)/(meandist_real(i)**2)
dev_timescape=dev_timescape+((distance_timescape-meandist_real(i))**2)*weights_real(i)/(meandist_real(i)**2)

END DO
! 
! distance_LCDM=SQRT(distance_LCDM/(n_real_weight*n_LCDM_weight))
! distance_timescape=SQRT(distance_timescape/(n_real_weight*n_timescape_weight))

rms_LCDM=SQRT(dev_LCDM/n_real_weight)
rms_timescape=SQRT(dev_timescape/n_real_weight)
ratio_rms=rms_timescape/rms_LCDM

WRITE(55,"(F10.7,F10.7,F10.7)") rms_LCDM,rms_timescape,ratio_rms


deallocate(H_real)
deallocate(fi_real)
deallocate(H_LCDM)
deallocate(fi_LCDM)
deallocate(H_timescape)
deallocate(fi_timescape)
deallocate(weights_real)
deallocate(weights_LCDM)
deallocate(weights_timescape)
deallocate(meandist_real)


END DO
END DO
CLOSE(55)
 
WRITE(*,*) '============================================================'
WRITE(*,*) '    programme complete'
WRITE(*,*) '============================================================'




END PROGRAM
























 
