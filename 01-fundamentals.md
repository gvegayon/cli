
# Fundamentals

Here are some day to day operations related to navigating your computer
and managing folders and files.

## Get help

The first, most important thing you should know is how to ask for help.
Beyond googling–or [duckduckgoing](https://duckduckgo.com)–or looking
for answers in [StackOverflow](https://stackoverflow.com), you should
know that most commands have their own documentation which can be
accessed using the `man` command, or, if available, calling the function
with the `-h` or `--help` flags. Here are two examples:

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

## Location location location

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

## Creating directories

## Moving, deleting, and renaming files