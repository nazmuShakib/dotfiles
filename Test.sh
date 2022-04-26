#!/bin/bash

green=$(tput setaf 46)
red=$(tput setaf 9)
reset=$(tput sgr0)
bold=$(tput bold)
blue=$(tput setaf 33)

raw="${1%.*}"
folder="testing ${raw}"
problem_name="${1}"
testcaseGen="gen_${raw}.cpp"
solution="sol_${raw}.cpp"
inputs="testCase_${raw}.txt"

function execute() {
	if test -f "errors.txt"; then
		echo -n "" >errors.txt
	fi

	printf "Number of Testcases "
	read t

	for ((i = 1; i <= ${t}; ++i)); do
		make all

		./"${testcaseGen%.*}.out" $RANDOM $RANDOM $RANDOM >"${inputs}"
		./"${solution%.*}.out" <"${inputs}" >out1.txt
		./"${problem_name%.*}.out" <"${inputs}" >out2.txt

		if diff --tabsize=1 -F --label --side-by-side --ignore-space-change out2.txt out1.txt >dont_show_on_terminal.txt; then
			echo "${blue}Case ${i}: ${reset}${green}${bold}Accepted${reset}"
		else
			echo "${blue}Case ${i}: ${reset}${red}${bold}Wrong Answer${reset}"
			printf 'Wrong Answer on Case %d\nTry more, u r losing day by day because of your lazyness\n' ${i} >>errors.txt
			echo "input :" >>errors.txt
			cat ${inputs} >>errors.txt
			echo "Output :" >>errors.txt
			cat out2.txt >>errors.txt
			echo "Expected :" >>errors.txt
			cat out1.txt >>errors.txt
		fi
	done
}
select opt in "Create" "Run" "Clear"; do
	if [ "${opt}" == "Create" ]; then
		mkdir "${folder}"
		cd "${folder}"
		touch "${problem_name}"
		cp ../${1} ./"${problem_name}"
		touch ${testcaseGen} ${solution}
		touch ${inputs}
		echo "cd to ${folder}"
		exit
	elif [ "${opt}" == "Run" ]; then
		execute
	elif [ "${opt}" == "Clear" ]; then
		rm -f out* dont_show_on_terminal.txt ${inputs} *solu*_* errors.txt gen* prob*
	else
		printf '%s\n' "Invalid Command. Try Again."
	fi
	break
done
