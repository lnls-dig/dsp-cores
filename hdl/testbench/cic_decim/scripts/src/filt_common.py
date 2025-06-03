from scipy import signal
from abc import ABC

class FiltCommon(ABC):
  def frp(self, points=65536, whole=False):
    w, h = signal.freqz(self.b, self.a, points, whole)
    return w, h

  def __call__(self,x):
    return signal.lfilter(self.b, self.a, x)

  @property
  def a(self):
    return self._a

  @property
  def b(self):
    return self._b
