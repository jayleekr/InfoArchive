import threading


class NetThread(threading.Thread):
    def __init__(self, *args, **kwargs):
        threading.Thread.__init__(self, *args, **kwargs)
        self.exc = None
        self.ret = None
    def run(self):
        try:
            if self._target:
                self.ret = self._target(*self._args, **self._kwargs)
        except BaseException as exc:
            self.exc = exc
    def joing(self, timeout=None):
        threading.Thread.join(self, timeout)
        if self.exc:
            raise self.exc
        return self.ret