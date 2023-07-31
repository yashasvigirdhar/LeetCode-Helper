#!/bin/bash
#
# Script to get some help with practicing leetcode questions
#
# This specifically helps to get a new random question on each invocation. 
#
# Requirements: questions.txt file in the same folder which contains all the 
# questions you want to cover. The file should have a single question link
# per line.
#
# This helps in cases where the leetcode site shows those questions inside a topic
# and you'd already know how to solve if you go from there. The script simulates a
# real interview where you don't know the topic beforehand.
#
#

function show_usage (){
  	printf "Usage: $0 action parameter\n"
  	printf "\n"
  	printf "Actions:\n"
  	printf "  get, Gets a new unsolved question\n"
  	printf "  mark-completed <leetcode link>, Marks a question as completed\n"
  	printf "  get-completed, Gets all the completed questions\n"
	printf "  get-completed-count, Gets the number of completed questions\n"
	printf "  get-remaining-count, Gets the number of remaining questions\n"
	printf "  help, Prints this help text\n"

  	return 0
}

function get_new() {
	echo "Getting a new question for you"
  	grep -v ^# questions.txt | sort -R | head -n 1
  	return 0;
}

function mark_completed() {
	echo "Marking $1 as completed"
	sed -i '' "s|$1|#$1|" questions.txt
	return 0;
}

function get_completed() {
	echo "All completed questions:"
	grep ^# questions.txt | sed 's/#//'
}

function get_completed_count() {
	echo "Number of completed questions:"
	grep ^# questions.txt | wc -l
}

function get_remaining_count() {
	echo "Remaining number of questions:"
	grep -v ^# questions.txt | wc -l
}

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]] 
then
	show_usage
elif [[ "$1" == "get" ]] 
then
	get_new
elif [[ "$1" == "mark-completed" ]]
then
	if [ -z "$2" ]
  	then
    		echo "No question supplied to be marked as completed."
		show_usage
	else
		mark_completed $2
	fi
elif [[ "$1" == "get-completed" ]]
then
	get_completed
elif [[ "$1" == "get-remaining-count" ]]
then
	get_remaining_count
elif [[ "$1" == "get-completed-count" ]]
then
	get_completed_count
else
	echo "Incorrect input provided"
	show_usage
fi

