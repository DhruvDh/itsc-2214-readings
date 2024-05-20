---
title: "Using the Autograder"
---

These instructions will guide you on how to use the autograder for all your labs. The autograder helps you check your code and provides feedback on your assignments. Follow these steps for a smooth grading experience.

## Installing Required Software

Ensure you have all the necessary software installed. Follow the instructions in the [Installing Required Software](https://charlotte-cci-icc.github.io/itsc-2214-readings/labs/00_installing_req_software.html) chapter or the instructions provided in class.

## Downloading Project Files

For each lab, you will be provided with a link to download the project files. Unzip these files into a designated folder, preferably this folder will be placed inside a `ITSC 2214` folder for all labs for this class.

## Opening the Project in Visual Studio Code

1. **Open Visual Studio Code.**
2. **Open the Project Folder:**
   - Go to `File > Open Folder`.
   - Select the folder where you extracted the project files.

## Writing Your Code

Each lab will contain specific instructions on what code you need to write.

## Checking Autograder Feedback

You can check the feedback from the autograder using the following steps:

**Using the Terminal:**

1. Open a terminal in Visual Studio Code.
2. Run the command: `umm grade ./script.rhai`

**Using the Command Palette:**

1. Open the command palette with `Ctrl + Shift + P` on Windows or `Cmd + Shift + P` on Mac.
2. Type "run task" and select "Tasks: Run Task". (In future use, you can select "Tasks: Rerun Last Task".)
3. Select the "Grade Assignment" task.
4. Choose `script.rhai` and press Enter.

**Note:** The first few labs might not have tasks correctly configured.

## Viewing Generated Feedback

After running the grading command, the autograder will provide feedback on the tests that have failed, and tell if you have been penalized for any reason. You can view the feedback in the terminal or the `feedback` folder in the project directory.

It will also generate links that will further explain the reason for penalty, or explain the test that failed. You can click on these links to view the detailed feedback. Here is an example of a generated feedback link: <https://feedback.dhruvdh.com/be5593a1-2b8f-49fc-a4ec-981095ae0702>

## Creating a Submission

When you are ready to submit your assignment:

1. Run the command: `umm create-submission` in the terminal.
2. This will generate a zip file with a name like `submission-2024-05-20-07-50-41.zip`.
3. Submit the generated zip file to Gradescope.

## Additional Resources

- **Autograder Commands:** The autograder provides various commands to help you manage your project. You can see a list of available commands by running `umm --help` in the terminal.

## AI Feedback

When you check your code with the autograder, you will receive feedback from an AI teaching assistant. If you are not satisfied with the response, you can request new feedback by clicking on one of the buttons that best describes your situation. These buttons include options like:

- **Your suggestions are too broad and vague.**
- **I don't understand.**
- **Your suggestions work, but I don't understand why.**
- **The changes you suggested are unnecessary or already implemented in my submission.**
- **Request alternate explanation/solution.**
- **This explanation seems incorrect.**

You can also provide additional notes in the text box below these buttons. This interaction helps tailor the feedback to better suit your needs.

Here is an example of the feedback interface: <https://feedback.dhruvdh.com/be5593a1-2b8f-49fc-a4ec-981095ae0702>

The AI feedback generator will prioritize key issues to help you make progress, provide relevant examples, and encourage critical thinking. It will avoid sharing direct solutions to foster independent problem-solving skills.
