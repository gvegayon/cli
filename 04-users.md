
# Users and groups management

From time to time, you will need to add/remove users/groups from your
system. Depending on the operating system, you can add users by the
`adduser` command.

# Modes

## Numeric

-   4: read
-   2: write
-   1: execute

So, for example, if we wanted to add read/write permission, it would be
4 + 2 = 6. For the case of read/execute only it would be 4 + 1 = 5. The
numeric mode can be set changed using a three digit number:

-   First position: Owner
-   Second position: Group
-   Third position: Everyone else (others)

## Symbolic

-   `r`: read
-   `w`: write
-   `x`: execute

And who this applies to:

-   `u`: owner
-   `g`: group
-   `o`: Others
-   `a`: all of the above

## Checking the mode of a file

Modes are reflected in a string of length 3\*3 + 1 = 10. Like the
following:

``` bash
drwxr-xr-x
```

The first character indicates the type of element:

-   `-` A file
-   `l` A (symbolic) link
-   `d` A folder

Then, the following characters are three groups of three representing
owner, group, and others. In this particular case:

`drwxr-xr--`

-   `d` is a directory
-   `rwx` The owner has read, write, and execute permissions,
-   `r-x` The group can only read and execute, and
-   `r--` All other users can only read

## Examples

1.  Create the `GroupA`, a folder `/home/GroupAData`, and make the user
    `user1` the owner of the folder

    ``` bash
    addgroup GroupA
    mkdir /home/GroupAData
    chown user1: -R /home/GroupAData
    ```

2.  Add `user2` to `GroupA`, and set that only the owner and group
    members can have access (read/write/execute) to the group folder

    ``` bash
    usermod -a -G GroupA user2
    ```

    Where the `-a` flag indicates “append” and `-G GroupA` the list of
    groups to be added

    ``` bash
    chmod -R 770 /home/GroupAData
    ```

    Where the `-R` flag denotes “recursively.” Alternatively, you could
    use the symbolic way:

    ``` bash
    chmod -R ug+rwx,o-rwx /home/GroupAData
    ```
