A *challenge* is a tasks to execute to succeed the level that game implementations may provide to the players.

--------------------------

#### How to create a new challenge ####
###### N.B. Create a new challenge doesn't change the already implemented games ######

To create a new level you have to place a directory, named with the name of the challenge, at the path `<game_dir>/.../core/challenges/`. Inside this directory you have to put the files `build.sh` and `complete.sh`.

*   `build.sh` will be executed to build the level, it must place the needed file inside the playing path saved in `$playing_path` and take the needed contents form `$level_path`

    ###### N.B. Do not assume that the current work directory is in the challenge one, use `$challenge_path` to refer to it
*   `complete.sh` will be executed from the player when she completed all the instructions, it must check the correctness of her works and export the level_succeeded with the value `yes` if it's all right (`export level_succeeded="yes"`), at the end of the file you have to run $build_next that will build the next level (`$build_next`).

    ###### N.B. run `$build_next` even on failing the challenge, the game core will handle it ######

To standardize the game is a good practice to use `$readme.txt` for the name of files that has to be read and `$action.sh` for the name of files that has to be executed.
To permit internationalizations of the game the challenge should not print any text but use instead specific text files that will be added to `$level_path` directory or the variables placed in the `language_pack` file.

At the moment there is the following variables:
*   exiting="Are you sure to exit? [y/n]"
*   no="no"
*   yes="yes"
*   press_enter="Press Enter to continue"
*   cheater="Nice try, but you have to try harder to cheat at this game!"
*   readme="readme"
*   action="continue"
*   instructions="instructions"


#### In the future will be added the ability to specify which file the challenge needs to automatically validate if the level is a correct implementation of the challenge