import atexit
import os
import readline
import rlcompleter

histfile = os.path.join(os.environ["HOME"], ".pythonhistory")
readline.parse_and_bind("tab: complete")
if os.path.isfile(histfile):
    readline.read_history_file(histfile)
atexit.register(readline.write_history_file, histfile)
del os, histfile, readline, rlcompleter, atexit
