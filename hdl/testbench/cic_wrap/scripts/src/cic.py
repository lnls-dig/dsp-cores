from .comb import Comb
from .integrator import Integrator

from scipy import signal
import numpy as np

class CICFilt:
  def __init__(self, M, R = 1, D=1):
    '''
    M: Filter order (number of combs and integrators)
    R: Decimation rate
    D: Comb differential delay
    '''
    self._M = M
    self._R = R
    self._D = D
    INT = Integrator()
    COMB = Comb(D)

    self._a_integ, self._b_integ = self._cascade_filters(INT, self.M)
    self._a_comb, self._b_comb = self._cascade_filters(COMB, self.M)

  def _cascade_filters(self, filter, order):
    a = filter.a.copy()
    b = filter.b.copy()

    for _ in range(order-1):
      a = np.convolve(a, filter.a)
      b = np.convolve(b, filter.b)

    return a, b

  def call_integ_vhdl(self, x):
    x = np.atleast_2d(x)
    integ = signal.lfilter(self._b_integ, self._a_integ, x, axis=-1)
    vhdl_integ_delay = self.M + 1
    zeros = np.zeros((1,vhdl_integ_delay))

    return np.concatenate((zeros, integ[:,:-vhdl_integ_delay]), axis=1)

  def call_comb_vhdl(self,x):
    x = np.atleast_2d(x)
    comb = signal.lfilter(self._b_comb, self._a_comb, x, axis=-1)
    vhdl_comb_delay = self.M - 1
    zeros = np.zeros((1,vhdl_comb_delay))
    comb = np.concatenate((zeros, comb[:,:]), axis=1)
    rcomb = np.repeat(comb, self.R, axis=-1)

    return rcomb

  def __call__(self, x, method=0):
    '''
    method: {0, 1, 'vhdl'} - default: 'vhdl'
    Implementations of CIC on floating points may cause numerical erros.
    Methods 0 and 1 return the same CIC filtering, but implemented on different
    ways:
    0: filters the signal through the integrators, decimate it and then filter
       it through the combs.
    1: uses the total transfer function (running sum).
    `vhdl`: same as method 0, but adding the internal delays that our VHDL
            implementation has.
    '''
    # Ensures the input has 2 dimensions.
    # Useful if used for filtering the output of an IQ demodulator.
    x = np.atleast_2d(x)
    if method == 0:
      x1 = signal.lfilter(self.b_integ, self.a_integ, x, axis=-1)[:, ::self._R]
      return signal.lfilter(self.b_comb, self.a_comb, x1, axis=-1)
    elif method == 1:
      x1 = signal.lfilter(np.ones(self.R*self.D), 1, x)
      for _ in range(self.M-1):
        x1 = signal.lfilter(np.ones(self.R*self.D), 1, x1)
      return x1
    elif method == 'vhdl':
      return self.call_comb_vhdl(self.call_integ_vhdl(x)[:, ::self.R])

  def frp(self, points=65536, whole=False):
    if whole: # If whole = True, it goes from -pi to pi
      w = np.linspace(-np.pi, np.pi, points, endpoint=False)
    else:
      w = np.linspace(0, np.pi, points, endpoint=False)

    with np.errstate(divide='ignore', invalid='ignore'):
      h = ( (1-np.exp(-1j*w*self.R*self.D)) / (1 - np.exp(-1j*w)) ) ** self.M

    return w, h

  @property
  def M(self):
    return self._M

  @property
  def R(self):
    return self._R

  @property
  def D(self):
    return self._D

  # COMB coefficients on fs/R
  @property
  def comb(self):
    return self._a_comb, self._b_comb

  # INT coefficients on fs
  @property
  def integ(self):
    return self._a_integ, self._b_integ
