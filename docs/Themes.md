Themes are actually games implemented over the existing challenges.

-------------------------------------------------------------------
#### How to create your theme: ####

To create a new *theme* you have to create a directory using the following
path `<game_directory>/.../implementations/<language>/<theme_name>` inside
this directory you have to place:
*   a file named `name` containing the name of the adventure to display as
    multiple choice option displayed when running `mayalinux`
*   a file named `title.txt` containing the title of the adventure (ascii
    art titles looks better)
*   **unofficial** (optional) a file named `display_settings` containing
    the personalization of the variable PS1 [N.B. it may change]
*   a file named `start` containing the name of the first level to run
*   a folder for each level that the game would like to challenge the player
    with. The folder name will be the level name (e.g. the one that will be
    in the `start` file). In every level folder there has to be:
    -   a file named `challenge` containing the associated challenge chosen
        from the available [[Challenges]] (it may be omitted, in that case
        the MayaLinux_rev core will look for a challenge named as the level,
        but this usage is discouraged)
    -   a file named `succeeded` containing the name of the level to run if
        this level is succeeded (if it doesn't exist the MayaLinux_rev core
        will look for the file `next`, just for backward compatibility, do
        not use that name)
    -   (optional) a file named `failed` containing the name of the level
        to run if this level is failed (if it doesn't exist the same level
        is built again)
    -   (optional) a file named `level_dir` containing the desired directory
        name to playing in the level. It may be omitted, in that case the
        MayaLinux_rev core will use the same named as the level one (this
        may be useful depending on PS1 settings)
    -   a file named `intro.txt` containing the themed introduction to the
        level, it is printed after the level is built.
    -   (optional) a file named `retry.txt`, it is printed when the level
        restart after the player fails the level, if omitted the core will
        look for `intro4loser.txt` to be printed (It substitute the intro.txt).
    -   (optional) a file named `intro4loser.txt`, it is printed when the
        level is reached after a level failing, if omitted it will be printed
        `intro.txt`.
    -   and all the challenge needed files. (A future work is to implement a
        tool that tell you what they are)
