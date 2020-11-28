# Crestfallen Git

That right! Git is upset that you'd put your system to sleep without committing changes across local projects. First world problem for every developer. What's worse than losing all your unsaved changes due to an unfortunate hard drive crash? Been there, seen that just a month back to realise the importance of not just making commits, but making them _just in time_.

Well! Once bitten twice shy and here's a nifty little tool for help. :rocket:

## What's required? :pencil:

- **Linux**! Should work across distros but I've tested it for success on my Arch machine
- The tool hooks into event callbacks offered by `acpid` and hence requires it to be installed
  - Ubuntu: `sudo apt install acpid`
  - Arch Linux: `sudo pacman -S acpid`
  - Other distros: `No idea, look it up :D`
- Innately, it intercepts power button presses to conditionally suspend your system and hence requires you to disable the _"power button suspends"_ functionality in system settings
- You **must** have superuser (`sudo`) access :bangbang:

## How to install? :floppy_disk:

1. Download this repo and extract the `.zip` to a directory
2. Fire up a terminal **in that directory**
3. Run `sudo chmod a+x install.sh`
4. Run `install.sh`

**:no_entry: DO NOT:**<br>
:x: Run the installer twice _(don't want your system sleeping repeatedly right? :shit:)_<br>
:x: Fire up the terminal for installation from some other directory

## How to run? :running:

You'd now want to enlist your local Git projects to be tracked:
- Open file `~/.config/py-crestfallen-git/projects` in your favorite editor
- Enlist absolute paths to your Git project directories on separate lines
  - _e.g. `/home/jerry/Projects/TicTacToe`_
- Save and close

Euh, now just press that power button. :new_moon_with_face:

## Great! What's next? :sunrise_over_mountains:

An uninstaller is on the way so stay tuned! If you liked the repo, do :hammer: the :star: button and feel free to raise issues, if you face any.

Made with :heart: by `theGeekyLad`
