---
title: "Installing Required Software"
---

You will need to install the following software on your laptop to work on labs in this course -

1. IDE - [Visual Studio Code](https://code.visualstudio.com/download)
2. Java (JDK 17) - OS-specific installation instructions are below.
3. Git - Version control system. OS-specific installation instructions are below.
4. Autograder - OS-specific installation instructions below.

## One-Liner Install (Experimental)

### Windows

Follow the instructions in the first comment on this gist - <https://gist.github.com/DhruvDh/71d90635a528db1318a36ea35da6d56d>

To run the script on Windows:

1. Open a PowerShell window.
2. Go to the gist and click the `Raw` button next to the file name at the top.
3. Copy the URL from your browser's address bar (this is the `PASTE_RAW_URL`).
4. Replace `PASTE_RAW_URL` in the command below with the URL you copied.
5. Run the command in PowerShell:

```powershell
Invoke-RestMethod -Uri PASTE_RAW_URL | iex
```

For the current version (at the time of writing), you can use this command:

```powershell
Invoke-RestMethod -Uri https://gist.githubusercontent.com/DhruvDh/71d90635a528db1318a36ea35da6d56d/raw/38aa59f4c8ee3698dd2f266321c74f81c171858e/lab-prep-windows.ps1 | iex
```

### MacOS

Follow the instructions in the first comment on this gist - <https://gist.github.com/DhruvDh/f313bf5edd929949a31995e247e28c53>

To run the script on macOS:

1. Open a Terminal window.
2. Go to the gist and click the `Raw` button next to the file name at the top.
3. Copy the URL from your browser's address bar (this is the `PASTE_RAW_URL`).
4. Replace `PASTE_RAW_URL` in the command below with the URL you copied.
5. Run the command in Terminal:

```bash
curl -sL PASTE_RAW_URL | bash
```

For the current version (at the time of writing), you can use this command:

```bash
curl -sL https://gist.githubusercontent.com/DhruvDh/f313bf5edd929949a31995e247e28c53/raw/8be0c2ff7f8e28763944497e41114a69492e3a9f/lab-prep-macos.sh | bash
```

This will download and execute the script, installing all necessary software and configurations for your lab preparation.

## IDE - Visual Studio Code

Download and install Visual Studio Code from [here](https://code.visualstudio.com/download).

Please go through the following videos to get familiar with Visual Studio Code - [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs/getstarted/introvideos)

Then, install the following extensions -

1. <https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack>
2. <https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare>
3. <https://marketplace.visualstudio.com/items?itemName=Codeium.codeium>

Finally, you may be collaborating in labs with other students. Please go to <https://code.visualstudio.com/learn/collaboration/live-share> and learn about how to do the same.

## Windows

### Git

1. We will be using `scoop` again to install git. Ensure you've gone through the previous steps. Copy and paste the following command into the terminal and press enter:

  ```powershell
  scoop install git
  ```

2. Verify that git is installed. Copy and paste the following command into a **NEW** terminal window and press enter:

  ```powershell
  git --version
  ```

  If you don't get an error, you should be good to go.

### Java (JDK 17)

We will be using a "package manager" to install the software we need, called `scoop`. A package manager is a tool that allows you to install software from the command line. It is similar to the `apt` package manager on Ubuntu, or `brew` on MacOS.

1. To start, please open a terminal by opening the start menu, typing `Terminal`, and selecting the `Windows Terminal` app.

  You should see a Powershell window open up. If you see a different shell, please click the down arrow in the top bar and select `Powershell`. You should see a prompt like this:

  ```powershell
  PS C:\Users\yourusername>
  ```

2. If you see a different prompt, please let the instructor know.

  Now, copy and paste the following command into the terminal and press enter:

  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

  This will allow the "current user" (you) to run scripts that you download from the internet.

3. Next, copy and paste the following command into the terminal and press enter:

  ```powershell
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
  ```

  This will download and run the installer for the `scoop` package manager.

4. We will now add a "bucket" to scoop, which is a "bucket" of software `scoop` can install. Java is not in the default "main" bucket. Copy and paste the following command into the terminal and press enter:

  ```powershell
  scoop bucket add java
  ```

5. Now, we can install Java. Copy and paste the following command into the terminal and press enter:

  ```powershell
  scoop install openjdk
  ```

6. Finally, we can verify that Java is installed. Copy and paste the following command into a **NEW** terminal window and press enter:

  ```powershell
  javac --version
  ```
  
  If you don't get an error, you should be good to go.

### Autograder

1. We will need to install a compiler for a different programming language, called `rust`. The compiler will download, compile, and finally install the autograder. Before we begin, we need to install a few dependencies. Copy and paste the following command into the terminal and press enter:

  ```powershell
  scoop install mingw
  ```

1. Now, let's install `rust`. Go to <https://rustup.rs/> and download and run `rustup-init.exe`. This will open a terminal window, and you should see a window that asks you whether or not you want to install pre-requisites. The **third** option should say *Don't install pre-requisites* and that is the one you choose **by pressing `3` and then Enter**.

  ```
  info: downloading installer

  Welcome to Rust!

  This will download and install the official compiler for the Rust
  programming language, and its package manager, Cargo.

  ...
  ...

  Current installation options:


    default host triple: ...
      default toolchain: ...
                 profile: ...
    modify PATH variable: ...

  1) Proceed with installation (default)
  2) Customize installation
  3) Cancel installation
  ```

2. This is a CLI menu-driven installer. Please configure it as follows, by first pressing `2` to customize installation.

  You should then see -

  ```powershell
  I'm going to ask you the value of each of these installation options.
  You may simply press the Enter key to leave unchanged.

  Default host triple? [aarch64-apple-darwin]
  ```

3. Please type `x86_64-pc-windows-gnu` and press enter.

  You should then see -

  ```powershell
  Default toolchain? [stable]
  ```

4. Please type `nightly` and press enter.

  You should then see -

  ```powershell
  Profile (minimal default, default, complete)? [default]
  ```

5. Please type `minimal` and press enter.

  You should then see -

  ```powershell
  Modify PATH variable? (y/n) [y]
  ```

6. Please type `y` and press enter.

  You should then see -

  ```powershell
  Current installation options:

   default host triple: x86_64-pc-windows-gnu
     default toolchain: nightly
                profile: minimal
  modify PATH variable: yes

  1) Proceed with installation (default)
  2) Customize installation
  3) Cancel installation

  > 
  ```

7. Please press enter or `1` to proceed with installation as configured.

8. Open a **NEW** terminal window, type `cargo --version` and press enter. You should see something similar to -

  ```powershell
  cargo 1.77.0-nightly (2ce45605d 2024-01-04)
  ```

  The version number may be different, but as long as you don't see an error, you should be good to go.

9. Finally, we can install the autograder. Copy and paste the following command into the terminal and press enter:

  ```powershell
  cargo install --git=https://github.com/DhruvDh/umm.git
  ```

10. You can now run `umm --help` to check if it was installed correctly. If you don't see any errors, you should be good to go.

## MacOS

### Java (JDK 17)

We will be using a "package manager" to install the software we need, called `brew`. A package manager is a tool that allows you to install software from the command line. It is similar to the `apt` package manager on Ubuntu, or `scoop` on Windows.

1. To start, please open a terminal by opening the spotlight search and typing `Terminal` and selecting the `Terminal` app.

  You should see a terminal window open up. You should see a prompt like this:

  ```bash
  yourusername@yourcomputername ~ %
  ```

  If you see a different prompt, please let the instructor know.

2. Before we begin, we need to install a few dependencies. Copy and paste the following command into the terminal and press enter:

  ```bash
  xcode-select --install
  ```

3. Next, copy and paste the following command into the terminal and press enter:

  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  This will download and run the installer for the `brew` package manager.

  Once the installation is complete, we need to add `brew` to the path, so all future terminals will know where to find it. You can do this by running -

  ```bash
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  ```

  Followed by -
  
  ```bash
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ```

4. Nex, try opening a new terminal window and typing `brew --`version` and pressing enter. You should see something similar to -

  ```bash
  Homebrew 3.2.12
  Homebrew/homebrew-core (git revision 3c2b; last commit 2021-10-13)
  ```

  The version number may be different, but as long as you don't see an error, you should be good to go.

5. We will now install Java. Copy and paste the following command into the terminal and press enter:

  ```bash
  brew install openjdk
  ```

6. Finally, we can verify that Java is installed. Copy and paste the following command into a **NEW** terminal window and press enter:

  ```bash
  javac --version
  ```

  If you don't get an error, you should be good to go.

### Git

1. We will be using `brew` again to install git. Ensure you've gone through the previous steps. Copy and paste the following command into the terminal and press enter:

  ```bash
  brew install git
  ```

2. Verify that git is installed. Copy and paste the following command into a **NEW** terminal window and press enter:

  ```bash
  git --version
  ```

  If you don't get an error, you should be good to go.

### Autograder

1. We will need to install a compiler for a different programming language, called `rust`. The compiler will download, compile, and finally install the autograder.

2. Now, let's install rust. You can do so by running -

  ```bash
  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly
  ```

3. After that, you need to add `rust` to path, so all future terminals will know where to find it. You can do this by running -

  ```bash
  source $HOME/.cargo/env
  ```

4. Open a **NEW** terminal window, type `cargo --version` and press enter. You should see something similar to -

  ```bash
  cargo 1.77.0-nightly (2ce45605d 2024-01-04)
  ```

  The version number may be different, but as long as you don't see an error, you should be good to go.

5. Finally, we can install the autograder. Copy and paste the following command into the terminal and press enter:

  ```bash
  cargo install --git=https://github.com/DhruvDh/umm.git
  ```

6. You can now run `umm --help` to check if it was installed correctly. If you don't see any errors, you should be good to go.
