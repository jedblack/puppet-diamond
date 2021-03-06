# coding=utf-8

"""
Uses /proc/stat to collect data on context switches

#### Dependencies

 * /proc/stat

"""

import diamond.collector
import os
import re

class SystemStatCollector(diamond.collector.Collector):

  PROC = '/proc/stat'
  MAX_VALUES = {
    'ctxt': diamond.collector.MAX_COUNTER,
  }

  def get_default_config_help(self):
    config_help = super(SystemStatCollector, self).get_default_config_help()
    config_help.update({
    })
    return config_help

  def get_default_config(self):
    """
    Returns the default collector settings
    """
    config = super(SystemStatCollector, self).get_default_config()
    config.update({
      'enabled':  'True',
      'path':     'stat'
    })
    return config

  def collect(self):
    if not os.access(self.PROC, os.R_OK):
      return None

    results = {}
    reg = re.compile('^(ctxt)\s(\d+)')

    file = open(self.PROC)
    for line in file:
      match = reg.match(line)
      if match:
        name = match.group(1)
        value = match.group(2)
        results[name] = self.derivative(name, int(value), self.MAX_VALUES[name])
    file.close()

    for key, value in results.items():
      self.publish(key, value, 2)
