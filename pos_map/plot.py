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
import astropy.coordinates as coord
from astropy.coordinates import SkyCoord, CartesianRepresentation, SphericalRepresentation  # High-level coordinates
from astropy.coordinates import ICRS,Galactic # Low-level frames
from astropy.coordinates import Angle, Latitude, Longitude, Distance  # Angles
from astropy import constants as const
import astropy.units as u



# choose cosmology
cosmo = FlatLambdaCDM(H0=73, Om0=0.25)

h=0.73
usedsidelength=380.0/h

posdata = np.genfromtxt("position_data.txt",dtype=None,names=True,delimiter=",")
resultdata = np.genfromtxt("full_results.txt",dtype=None,names=True,delimiter=",")

ndata=len(posdata)



ra = coord.Angle((posdata['ra']-180.0)*u.degree)
ra = ra.wrap_at(180*u.degree)
dec = coord.Angle(posdata['dec']*u.degree)

area=resultdata['weight']/2.
colors=resultdata['fi']


dist100=(resultdata['dist']<100.)
dist200=(resultdata['dist']>=100.)&(resultdata['dist']<200.)
dist300=(resultdata['dist']>=200.)&(resultdata['dist']<300.)
dist400=(resultdata['dist']>=300.)&(resultdata['dist']<400.)
distmax=(resultdata['dist']>=400.)
selected=(resultdata['dist']<402.8)&(resultdata['weight']>2.5)


fig = plt.clf()
fig = plt.figure(figsize=(8,6))

#cax = plt.scatter(ra.radian, dec.radian,s=area, c=colors, cmap='seismic', vmin=0., vmax=1., alpha=0.5)
#fig.colorbar(cax, ticks=[0, 0.5, 1])
#cax= plt.clf()
cmap_reversed = mpl.cm.get_cmap('seismic_r')

ax = fig.add_subplot(321, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("D$_{c}$ < 100 Mpc", fontsize=8)
ax.grid(True)
ax.scatter(ra.radian[dist100], dec.radian[dist100],s=area[dist100], c=colors[dist100], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

ax = fig.add_subplot(322, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("100 Mpc $\leq$ D$_{c}$ < 200 Mpc", fontsize=8)
ax.grid(True)
ax.scatter(ra.radian[dist200], dec.radian[dist200],s=area[dist200], c=colors[dist200], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

ax = fig.add_subplot(323, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("200 Mpc $\leq$ D$_{c}$ < 300 Mpc", fontsize=8)
ax.grid(True)
ax.scatter(ra.radian[dist300], dec.radian[dist300],s=area[dist300], c=colors[dist300], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

ax = fig.add_subplot(324, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("300 Mpc $\leq$ D$_{c}$ < 400 Mpc", fontsize=8)
ax.grid(True)
ax.scatter(ra.radian[dist400], dec.radian[dist400],s=area[dist400], c=colors[dist400], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

ax = fig.add_subplot(325, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("D$_{c}$ $\geq$ 400 Mpc", fontsize=8)
ax.grid(True)
ax.scatter(ra.radian[distmax], dec.radian[distmax],s=area[distmax], c=colors[distmax], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

ax = fig.add_subplot(326, projection="mollweide")
ax.set_xticklabels(['2h','4h','6h','8h','10h','12h','14h','16h','18h','20h','22h'])
ax.tick_params(axis='both', which='major', labelsize=4)
ax.tick_params(axis='both', which='minor', labelsize=4)
ax.set_title("selected sample", fontsize=8)
ax.grid(True)
im=ax.scatter(ra.radian[selected], dec.radian[selected],s=area[selected], c=colors[selected], cmap=cmap_reversed, vmin=0., vmax=1., alpha=0.5)

fig.subplots_adjust(right=0.9)
cbar_ax = fig.add_axes([0.92, 0.1, 0.015, 0.8])
cbar = fig.colorbar(im, cax=cbar_ax)
cbar.solids.set_edgecolor("face")
cbar.set_alpha(1)
cbar.draw_all()
fig.savefig("../plots/foreground_finite_infinity.png",dpi=400, facecolor='w',edgecolor='w', orientation='portrait',papertype='A3')
os.system("convert ../plots/foreground_finite_infinity.png eps3:../plots/foreground_finite_infinity.eps")





# --- If this line is here, the source code will be complete. ---










































