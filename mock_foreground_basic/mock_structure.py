#!/usr/bin/python

#Initialization
import os
import sys
import subprocess
import string
import select
import matplotlib.pyplot as plt
import matplotlib as mpl
import scipy.linalg
from scipy import stats
import numpy as np 
import scipy
import math
import csv
import h5py
import pandas as pd
import warnings
import astropy
import seaborn as sns
from astropy.modeling import models, fitting
from pathlib import Path
from scipy import interpolate
from astropy.cosmology import FlatLambdaCDM,z_at_value
from mpl_toolkits.mplot3d import Axes3D
from scipy.spatial import cKDTree as kdtree
from scipy.interpolate import interp1d
from astropy.coordinates import SkyCoord, CartesianRepresentation, SphericalRepresentation  # High-level coordinates
from astropy.coordinates import ICRS,Galactic # Low-level frames
from astropy.coordinates import Angle, Latitude, Longitude, Distance  # Angles
from astropy import constants as const
import astropy.units as u



# choose cosmology
cosmo = FlatLambdaCDM(H0=73, Om0=0.25)

h=0.73
usedsidelength=380.0/h

print "------------------------------------------------"
print "starting programme"

fgdata = np.genfromtxt("massive_fof.txt",dtype=None,names=True,delimiter=",")

fgdatatype=[('x','f'),('y','f'),('z','f'),('mass','f'),('dist1','f'),('dist2','f'),('dist3','f'),('dist4','f'),('dist5','f'),('dist6','f'),('dist7','f'),('dist8','f'),]
n_fg=len(fgdata)

mockcat = np.zeros(n_fg,dtype=fgdatatype)

mockcat['x']=(fgdata['x']-10.0)/h
mockcat['y']=(fgdata['y']-10.0)/h
mockcat['z']=(fgdata['z']-10.0)/h
mockcat['mass']=8.61*1E8*fgdata['np']/h
mockcat['dist1']=np.sqrt(np.power(mockcat['x'],2)+np.power(mockcat['y'],2)+np.power(mockcat['z'],2))
mockcat['dist2']=np.sqrt(np.power((usedsidelength-mockcat['x']),2)+np.power(mockcat['y'],2)+np.power(mockcat['z'],2))
mockcat['dist3']=np.sqrt(np.power(mockcat['x'],2)+np.power((usedsidelength-mockcat['y']),2)+np.power(mockcat['z'],2))
mockcat['dist4']=np.sqrt(np.power(mockcat['x'],2)+np.power(mockcat['y'],2)+np.power((usedsidelength-mockcat['z']),2))
mockcat['dist5']=np.sqrt(np.power((usedsidelength-mockcat['x']),2)+np.power((usedsidelength-mockcat['y']),2)+np.power(mockcat['z'],2))
mockcat['dist6']=np.sqrt(np.power(mockcat['x'],2)+np.power((usedsidelength-mockcat['y']),2)+np.power((usedsidelength-mockcat['z']),2))
mockcat['dist7']=np.sqrt(np.power((usedsidelength-mockcat['x']),2)+np.power(mockcat['y'],2)+np.power((usedsidelength-mockcat['z']),2))
mockcat['dist8']=np.sqrt(np.power((usedsidelength-mockcat['x']),2)+np.power((usedsidelength-mockcat['y']),2)+np.power((usedsidelength-mockcat['z']),2))

basicfilter=(mockcat['x']>0.0)&(mockcat['y']>0.0)&(mockcat['z']>0.0)&(mockcat['x']<usedsidelength)&(mockcat['y']<usedsidelength)&(mockcat['z']<usedsidelength)

virgomassfilter=(mockcat['mass']>(0.6E15/h))&(mockcat['mass']<(1.8E15/h))

cornerfilter=(mockcat['dist1']<(25.0/h))|(mockcat['dist2']<(25.0/h))|(mockcat['dist3']<(25.0/h))|(mockcat['dist4']<(25.0/h))|(mockcat['dist5']<(25.0/h))|(mockcat['dist6']<(25.0/h))|(mockcat['dist7']<(25.0/h))|(mockcat['dist8']<(25.0/h))

allfilter=basicfilter&virgomassfilter&cornerfilter

filteredcat=mockcat[allfilter]


ts_modificator=np.power((50.1/61.7),2)
G=4.302/1000.0
rho_crit=3.0*np.power((70./1000000.),2)/(8.0*np.pi*G)

fgtype=[('x','f'),('y','f'),('z','f'),('mass','f'),('dist','f')]


mockdata = np.genfromtxt("fg_model_mock1.txt",dtype=None,delimiter=" ")
n_gal=len(mockdata)

#mockcat = np.zeros(n_fg,dtype=fgdatatype)

#mockcat['x']=fgdata[:,0]
#mockcat['y']=fgdata[:,1]
#mockcat['z']=fgdata[:,2]
#mockcat['mass']=np.power((fgdata[:,3]*1E6),3)*4.*np.pi*rho_crit*ts_modificator/3.
#

#mockcat[::-1].sort(order='mass')

#localvolume=(mockcat['dist']<25.)

#localcat=mockcat[localvolume]

#virgomassindex=(mockcat['mass']>1E15)



 #sindex=(gal['pabsmag_i']>magmax)&(gal['pabsmag_i']<magmin)&(gal['pabsmag_g']>(magmax-2.0))&(gal['pabsmag_g']<(magmin+2.0))&((gal['pabsmag_g']-gal['pabsmag_i'])<3.0)&((gal['pabsmag_g']-gal['pabsmag_i'])>-2.0)&(gal['z']>0.01)&(gal['z']<z_maxsurvey)
    #sel_index = sindex.sum()
    #galsel=gal[sindex]





print "programme completed"
print "------------------------------------------------" 

# --- If this line is here, the source code will be complete. ---










































