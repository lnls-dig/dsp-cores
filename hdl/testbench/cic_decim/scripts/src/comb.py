import numpy as np
from .filt_common import FiltCommon

class Comb(FiltCommon):
  def __init__(self, D):
    self._D = D

    self._a = np.array(1)

    self._b = np.zeros(D+1)
    self._b[0] = 1
    self._b[-1] = -1

  @property
  def D(self):
    return self._D