# LeetCode-Helper
A short script to get some help with practicing leetcode questions

The input is a set of all the questions that you want to practice and the script gives you a new random question from that set each time. 
Along with that, it gives you some other helper commands to get a better idea of your stats.

This helps in cases where the leetcode site shows those questions inside a topic
and you'd already know how to solve if you go from there. The script simulates a
real interview where you don't know the topic beforehand.

### Requirements 
`questions.txt` file in the same folder which contains all the questions you want to cover. 
The file should have a single question link per line. The file in this repo contains 
all the questions from the bonus sections of LC's [Data Structures and Algorithms crash course][1].

### Supported Commands

* `./lc-helper.sh help`

Prints out the help text which shows what all commands are supported.

* `./lc-helper.sh get`

Returns a new random question from the remaining unsolved questions. This would not consider the questions which have been mark as completed (See `mark-completed`).

* `./lc-helper.sh mark-completed <https-lc-link-for-question`

Marks a question as completed. This would make sure this question is not considered in subsequent `get` calls. 

Returns no of remaining (unsolved) questions.

* `./lc-helper.sh get-remaining-count`

Returns no of remaining (unsolved) questions.

* `./lc-helper.sh get-completed`

Returns the list of all the completed questions. 

### Usage

Just download both the `lc-helper.sh` and `questions.txt` file locally in the same folder and you are done!

### Contributing

PRs welcome!

[1]: https://leetcode.com/explore/interview/card/leetcodes-interview-crash-course-data-structures-and-algorithms/
