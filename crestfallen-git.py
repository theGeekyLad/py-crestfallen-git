# res=$(zenity --info --no-wrap --text="There are <b>3 uncommitted changes</b> across 2 projects.\n\nA stitch in time saves nine. Considering committing\nand pushing your changes first.\n\n<i>Suspending in 10s anyway...</i>" --extra-button "Omg! Cancel suspend" --title="Git is worried :(")

from pathlib import Path
import subprocess
import os

# constants
gitProjectsList = [
    '/home/thegeekylad/Projects/traders-toolkit',
    '/home/thegeekylad/Projects/hackoberfest20/GreenLight',
    '/home/thegeekylad/Projects/hackoberfest20/Java-A-Z'
]

projectCount = 0
for path in gitProjectsList:
    os.chdir(path)
    proc = subprocess.run(['git', 'status'], stdout=subprocess.PIPE)
    s = proc.stdout.decode('UTF-8').strip()
    sArr = s.split('\n')
    gitStatus = sArr[len(sArr) - 1]
    if 'working tree clean' not in gitStatus:
        projectCount += 1

if projectCount > 0:
    dialogProc = subprocess.run([
        'zenity',
        '--info',
        '--no-wrap',
        '--title=Git is worried :(',
        '--text=There are uncommitted changes across <b>' + str(projectCount) + ' projects</b>.\n\nA stitch in time saves nine. Considering committing\nand pushing your changes first.\n\n<i>Suspending in 10s anyway...</i>',        
        '--extra-button=Omg! Cancel suspend',
        '--timeout=10'
    ], stdout=subprocess.PIPE)
    exitValue = dialogProc.stdout.decode('UTF-8').strip()
    if len(exitValue) > 0:
        print('Now cancel suspend.')
