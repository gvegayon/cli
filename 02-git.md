
# git - the stupid content tracker

## Set up

``` bash
git config --global user.email "you@example.com"
git config --global user.email "Your Name"
```

## Initializing a project

Before jumping right to creating a new git repo, we first need to make
room where we wish to home the project. So we start with [the
fundamentals](01-fundamentals.md):

``` bash
cd /home/
mkdir my-new-project
cd my-new-project
```

Once there, we can use the command `git init` to initialize the project.
We will also use `git status` to check if things worked as expected

``` bash
git init
git status
```

    ## Initialized empty Git repository in /home/my-new-project/.git/
    ## On branch master
    ## 
    ## No commits yet
    ## 
    ## nothing to commit (create/copy files and use "git add" to track)

And we are done!

## Working on a project: Adding files

To illustrate how adding files to the tree works, we will start by
creating a README file using CLI.

``` bash
# This creates the README.md file with the input after `echo`
echo "# A title in markdown" > README.md

# This prints the file on screen
cat README.md
```

    ## # A title in markdown

If want `README.md` to be tracked, we need to add it using `git add`.
After adding the file, we will use `git status` to see what’s going on.

``` bash
git add README.md
git status
```

    ## On branch master
    ## 
    ## No commits yet
    ## 
    ## Changes to be committed:
    ##   (use "git rm --cached <file>..." to unstage)
    ##  new file:   README.md

Once we are done adding files, we can proceed with the commit using
`git commit` (Duh!).

``` bash
git commit -m "My first commit."
```

    ## [master (root-commit) 5398e9d] My first commit.
    ##  1 file changed, 1 insertion(+)
    ##  create mode 100644 README.md

## Modifying files

After adding files to the project, the next thing that will happen is
start working on them. As an example, we will add a couple of lines to
the README.md file using the `>>` operator, after which we will use
`git status` to see what changed

``` bash
# Appending an empty line
echo "" >> README.md

# Appending some text
echo "This is an example Git Project" >> README.md

# Printing on screen
cat README.md
```

    ## # A title in markdown
    ## 
    ## This is an example Git Project

Let’s now check the status

``` bash
# And checking the status
git status
```

    ## On branch master
    ## Changes not staged for commit:
    ##   (use "git add <file>..." to update what will be committed)
    ##   (use "git restore <file>..." to discard changes in working directory)
    ##  modified:   README.md
    ## 
    ## no changes added to commit (use "git add" and/or "git commit -a")

To commit the changes, we can either add them to the staging area and do
the commit, or, do both on the fly using the `-a` flag in `git commit`:

``` bash
git add README.md
git commit -m "Improving the README file"
git status
```

Or

``` bash
git commit -a -m "Improving the README file"
git status
```

    ## [master ced9829] Improving the README file
    ##  1 file changed, 2 insertions(+)
    ## On branch master
    ## nothing to commit, working tree clean

Both yield the same result
