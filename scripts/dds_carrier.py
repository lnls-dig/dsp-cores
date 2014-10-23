# -*- coding: utf-8 -*-
"""
Created on Wed Jan  8 16:02:14 2014

@author: aylons
"""

B = 20
fclk = 130e6
fout = 20e6
theta = int(fout*(2**B)/fclk)
print("{0}".format(int(theta)))

#calculating the resulting frequency
fcalc = theta*fclk/2**B