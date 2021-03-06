
# Fundamentals

Here are some day to day operations related to navigating your computer
and managing folders and files.

## Get help

The first, most important thing you should know is how to ask for help.
Beyond googling–or [duckduckgoing](https://duckduckgo.com)–or looking
for answers in [StackOverflow](https://stackoverflow.com), you should
know that most commands have their documentation which can be accessed
using the `man` command, or, if available, calling the function with the
`-h` or `--help` flags. Here are two examples:

``` bash
# Manual of the cd command
man cd

# Help of cd
cd --help
```

The former will take you to the manual, which could be rather long. In
order to get out of there, you should type the `q` key on your keyboard.
The latter will print some information in a much compact way, including
the most important options.

## Location location location: Moving around

The first thing you need to know is to be aware in which part of your
system you are currently located at. For that, we use the `pwd` command

``` bash
pwd
```

    ## /home/george/sources

By itself, the `pwd` command will print-out the full path of your
location, yet, if it happens that you accessed it through a [symbolic
link](), it could be misleading. So, to avoid falling into error, add
the `-P` flag (physical) to the end of the command, like `pwd -P`.

The second thing location-related you need to know is how to move to a
particular location. To move around you have to use the `cd` command.
For example, if we wanted to go to `/home/george/dir1`, we would need to
type:

``` bash
cd /home/george/dir1
```

We can also use relative paths. Since we already were at `/home/george`,
we could have simply typed

``` bash
cd dir1
```

## What’s in here?: Listing files

Within any folder–for which you have the permission to see–you can list
files and folders using the `ls` command. By itself, we would be listing
objects within the current directory (`pwd`), e.g.,

``` bash
ls
```

    ## 01-fundamentals.Rmd
    ## 02-git.Rmd
    ## 03-r.Rmd
    ## 04-users.Rmd
    ## README.md

Otherwise, we can be explicit regarding what folder we want to
investigate, for example

``` bash
ls /home/george/sources
```

    ## 01-fundamentals.Rmd
    ## 02-git.Rmd
    ## 03-r.Rmd
    ## 04-users.Rmd
    ## README.md

If the number of files is not that big, then this would usually be OK.
Nonetheless, it is easier to list one element per line using the `-l`
flag:

``` bash
ls -l /home/george/sources
```

    ## total 24
    ## -rw-r--r-- 1 1001 121 4685 Oct 18 21:58 01-fundamentals.Rmd
    ## -rw-r--r-- 1 1001 121 2251 Oct 18 21:58 02-git.Rmd
    ## -rw-r--r-- 1 1001 121 2892 Oct 18 21:58 03-r.Rmd
    ## -rw-r--r-- 1 1001 121 2000 Oct 18 21:58 04-users.Rmd
    ## -rw-r--r-- 1 1001 121  188 Oct 18 21:58 README.md

I like listing files by timestamp and adding the `-t` flag, and make the
size of the files “human-readable” with the `-h` flag:

``` bash
ls -lth /home/george/sources
```

    ## total 24K
    ## -rw-r--r-- 1 1001 121 4.6K Oct 18 21:58 01-fundamentals.Rmd
    ## -rw-r--r-- 1 1001 121 2.2K Oct 18 21:58 02-git.Rmd
    ## -rw-r--r-- 1 1001 121 2.9K Oct 18 21:58 03-r.Rmd
    ## -rw-r--r-- 1 1001 121 2.0K Oct 18 21:58 04-users.Rmd
    ## -rw-r--r-- 1 1001 121  188 Oct 18 21:58 README.md

That way the most recently modified elements will show up on the top.

## Creating and deleting directories

Directories can be created from anywhere to anywhere within the system
with the `mkdir` command. For example, from the `/home/` directory, we
can create a folder named `my-project-1` in `/home/` using either
relative or absolute paths:

``` bash
# Making sure we are at home!
pwd

# Creating the subdir
mkdir my-project-1
```

    ## /home

Or, the following would also work

``` bash
mkdir /home/my-project-1/
```

What about creating nested folders? Well, if that’s the case, we can use
the `-p` flag (parents) to create any missing directory. Suppose we’d
like to create a directory under `/home/my-labs/lab1`. If
`/home/my-labs` does not exists, the following would fail:

``` bash
mkdir /home/my-labs/lab1
```

To make it work, we would need to add the `-p` flag:

``` bash
mkdir -p /home/my-labs/lab1
```

## Deleting, moving, and renaming files and folders

Deleting one or multiple files at the same time is another common task.
To delete files, we can use the `rm` (remove) function. Imagine we want
to remove a file located at `/home/my-labs/lab1/output.txt`. Either of
the following would work

``` bash
# Using absolute path
rm /home/my-labs/lab1/output.txt

# Using relative path, assuming we are located at /home/my-labs/lab1
rm output.txt
```

If, instead, we wish to remove a *pattern* of files located at
`/home/my-labs/lab1`, in particular, `output1.txt`, `output2.txt`, etc.,
we could do it using the following command:

``` bash
rm /home/my-labs/lab1/output*.txt
```

In the case of folders, `rm` can also be used to delete them. Although
the command `rmdir` also deletes folders; it only removes empty
directories, whereas `rm` can remove empty and non-empty directories. If
we try to remove a non-empty directory with `rm`, e.g.,
`rm /home/my-labs/`, we would get an error as the folder isn’t empty.
Instead, we’d need to use the `-f`–force–and `-r`–recursive–flags:

``` bash
rm -rf /home/my-labs/
```

That would delete the entire `my-labs` folder.
