#!/usr/bin/env python

import os


def switchmode(var):
    if var in os.environ and os.environ.get(var).upper() == 'DEV':
        print('Running Development Server', flush=True)
        os.system('python identidock.py')
    else:
        print('Runnig Production Server', flush=True)
        os.system('uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191')


if __name__ == '__main__':
    switchmode('ENV')
