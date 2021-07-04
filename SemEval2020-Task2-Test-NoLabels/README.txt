*******************************************************************************************************
*                      			SemEval 2020 Task 2                      		      *
*		Predicting Multilingual and Cross-Lingual (Graded) Lexical Entailment        	      *
* 		Ivan Vulić, Goran Glavaš, Simone Paolo Ponzetto, and Anna Korhonen      	      *
*******************************************************************************************************


*This package contains the *TEST* data for the SemEval-2020 Task 2 on Predicting Multilingual and Cross-Lingual (Graded) Lexical Entailment. Besides the README file, the package contains the folder "test" which is divided into two subfolders for the two subtasks:

- Subtask 1: Monolingual in multiple languages (i.e., multilingual; subdirectory "monolingual")
- Subtask 2: Cross-lingual (subdirectory "cross-lingual")

*The test sets cover the following languages (along with their language ISO codes):
- English: 	EN
- German: 	DE
- Italian:	IT
- Croatian:	HR
- Turkish:	TR
- Albanian:	SQ	(surprise language)

Albanian (SQ) is the surprise test language for which, unlike for the other languages, we have not released prior trial / development data.

###############
# DATA FORMAT #
###############

*We provide the test data in the same format as previously specified for the trial data and development data, only this time without gold labels. Concretely, every row of each test file contains a pair of concepts

concept_1 concept_2

- concept_1 denotes the first concept in the pair, while concept_2 refers to the second concept in the pair. Note that since lexical entailment is an asymmetric relation, the order of concepts in each pair *matters*. For instance, the pair "dog, animal" will have a high graded lexical entailment score, but the pair "animal, dog" will have a low score. Along the same line, in the binary task "dog, animal" will have label 1, while "animal, dog" gets assigned label 0 (since "animal is not a type of dog").

- A single whitespace is used as the delimiter.

- Multiword expressions are also allowed in the datasets: the constituent single words are glued together by underscores, e.g., macchina_per_scrivere.

- For cross-lingual datasets we also keep track of the language for each concept: each concept has a language prefix with an underscore prepended. This means that the Italian word "macchina" is provided as "it_macchina", and the Croatian word "stroj" as "hr_stroj".

- For monolingual datasets we do not use any language prefixes: "macchina" remains "macchina", and "stroj" remains "stroj".

- The same format with concept pairs is used as test data format for monolingual and cross-lingual graded lexical entailment task for all six languages and fifteen language pairs. The corresponding binary prediction test sets are slightly smaller as they are obtained by converting graded scores into binary scores (where we leave out mid-range graded pairs <1.5,4.5>, and only the pairs with their grade in the interval [0,1.5] are assigned the binary label 0, while the pairs with their grade in the interval [4.5,6] are assigned the binary label 1).

!Important!: Predicted (system) files must have exactly the same name and same format as the provided test data files both for binary and graded lexical entailment, and they must be fully aligned with the specifications in the gold files. This effectively means that prediction files must contain exactly the same concept pairs as the gold files in the same order of pairs, only with added predicted scores/labels.

For example, the first few lines in the graded cross-lingual English-Italian test set ("/cross-lingual/graded/en-it.graded.test.data.txt") are:

it_occupazione en_job
en_salary it_salario
en_politician it_governatore
en_blade it_coltello
it_animale en_container
...

Your corresponding file (to be submitted for evaluation) should just additionally contain the score (for binary LE test files this should be only 0 or 1), on the 0-6 scale, e.g: 

it_occupazione en_job 3.23
en_salary it_salario 4.71
en_politician it_governatore 0.11
en_blade it_coltello 6.00
it_animale en_container 0.75
...

#####################################
# SUBMISSION INSTRUCTIONS           #
#####################################

* We have two tracks: 
     - DIST track: Systems using only distributional information from large corpora
     - ANY track: All systems, using any kind of information, including lexico-semantic resources (e.g., WordNet, BabelNet)

Each participating team is allowed to submit at most 3 runs for each of the tracks (i.e., at most 3 DIST runs and at most 3 ANY runs). Each run is to be submitted as a single ZIP archive (.zip file) with the following name structure: "teamname_track_run_number.zip". For example, if your team name is "blue" and you're submitting your second run for the "DIST" track, your submission filename should be "blue_DIST_run_2.zip". In order to prevent name collisions that could happen in case of two different teams choosing the same team name, please use rather specific team names (for example, not just the abbreviation/name of your University or research lab, but, if applicable and possible, also some indicator of your unit/group/lab/faculty/school/department...).

Every run submission (i.e., every submitted .zip archive) should have exactly the same structure as the test archive "SemEval2020-Task2-Test-NoLabels.zip" you downloaded (and inside of which you found this README file). Concretely, the archive should contain two directories: 

- cross-lingual
- monolingual

Each of these two directories should contain two subdirectories:

- binary
- graded

In the "binary" and "graded" directories, you should place the test files (with predicted scores, binary or graded, depending on the directory!) for languages ("monolingual") and language pairs ("cross-lingual") for the tasks in which you are participating. You can participate in any (sub)set of tasks that you choose: simply omit the prediction files for the tasks you choose not to participate in. We will assume you are participating in all the subtasks for which you submit the corresponding test files with predictions generated by your system. The files with predictions should follow the naming of the original test files we provided. 

Example: assume that the second run on the DIST track of the team "blue" makes the following predictions: 

- monolingual graded LE scores for English
- monolingual graded LE scores for Italian
- monolingual graded LE scores for Albanian
- cross-lingual graded LE scores for English-Italian
- cross-lingual graded LE scores for English-Albanian
- monolingual binary LE scores for English
- monolingual binary LE scores for Albanian
- cross-lingual binary LE scores for English-Albanian

The corresponding submission archive ("blue_DIST_run_2.zip") should contain the following files: 

/monolingual/graded/en.graded.test.data.txt
/monolingual/graded/it.graded.test.data.txt
/monolingual/graded/sq.graded.test.data.txt
/monolingual/binary/en.binary.test.data.txt
/monolingual/binary/sq.binary.test.data.txt
/cross-lingual/graded/en-it.graded.test.data.txt
/cross-lingual/graded/en-sq.graded.test.data.txt
/cross-lingual/binary/en-sq.binary.test.data.txt

The submissions should be uploaded using the following (Dropbox-File Request) link:
https://www.dropbox.com/request/xnOrggkhc6R6Zlq6N3Tv

You need to enter your name (first and last) and an email address and upload the archive (.zip file) containing the predictions for your run (one upload is needed for each run). You should provide the contact details of the team lead (i.e., the contact person for the team). 

Submissions are possible until Wednesday, March 11, 23.59 UTC-12 ("anywhere on Earth").

#####################################
# CONTACT                           #
#####################################

*For further information, questions, and clarifications contact us at:
- Goran Glavaš (goran@informatik.uni-mannheim.de)
- Ivan Vulić (iv250@cam.ac.uk)
