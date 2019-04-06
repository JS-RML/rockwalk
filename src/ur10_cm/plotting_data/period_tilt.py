#!/usr/bin/env python

import math
import numpy as np
import matplotlib.pyplot as plt


period, tilt = np.loadtxt("period_tilt_data.txt", unpack=True)

pol_fit = np.polyfit(tilt, period, 3)

p = np.poly1d(pol_fit)

#


#Compute theoretical period

R = 0.350
a = 0.150


theoretical_tilt = np.linspace(2,80,100)


theoretical_period = 2*np.pi*np.sqrt(np.divide(np.square(R-a),(9.81*a*np.sin(np.radians(theoretical_tilt)))))

plt.axis([0,80,0,10])

plt.plot(theoretical_tilt, theoretical_period, color='c', linewidth=2.0, label='Theoretical')
# plt.plot(theoretical_tilt, p(theoretical_tilt))
plt.scatter(tilt, period, color ='b', label = 'Empirical')


plt.xlabel("Dihedral Angle (deg)")
plt.ylabel("Period (s)")

plt.legend(loc=2)
plt.pause(15)
plt.draw()
