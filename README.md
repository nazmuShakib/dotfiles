
# **Dotfiles**

## ***Stress Testing***

For example you have a file named `abc.cpp`. To stress test, you have to run the the command `bash Test.sh abc.cpp`. After executing the commad you will have a shell screen like:

	1) Create
	2) Run
	3) Clear
	#? (you have select your option here)

- ### **Create**

   Selecting this option will create `3 C++` files `abc.cpp, gen_abc.cpp, sol_abc.cpp` and a `testCase_abc.txt` in a folder named `testing abc` and a message saying `cd to testing abc`.

   The file `abc.cpp` is just a copy of the actual `abc.cpp` file. You have to put your probable correct code in it to test against a checker file.

   `sol_abc.cpp` should contain a correct solution of any complexity. This is the checker file.

   `gen_abc.cpp` is for generating testcases. For example, I use `testlib.h` library of codeforces to generate my testcases.

   **Note:** The makefile should reside inside the `testing abc` folder.

- ### **Run**

   Selecting this option will result in a shell screen like

		Number of Testcases

	Input a number and then based on the correctness of your code, you will get outputs like

		Case #casenumber: Accepted
		or
		Case #casenumber: Wrong Answer

	**Note:** You have to be inside the `testing abc` to select this option.

- ### **Clear**

	Selecting this option will remove some auxiliary files that would be created to support the `run` option.

**Caution:** You have to create the required files first. Also, we ignored `whitespace` differences while comparing outputs.

So, a sequence of commands to stress test `abc.cpp` may look like

1. Execute `bash Test.sh abc.cpp` and select option `1`
2. Change directory to `testing abc`
3. Write codes to stress test
4. Execute `bash Test.sh abc.cpp` again and select option `2`
5. Follow `step 3-4` until your code gets `accepted` verdict for all testcases
