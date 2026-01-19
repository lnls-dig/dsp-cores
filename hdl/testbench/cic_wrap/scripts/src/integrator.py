import numpy as np
from .filt_common import FiltCommon

class Integrator(FiltCommon):
  def __init__(self):
    self._a = np.array([1.0, -1.0])
    self._b = np.array([1.0])