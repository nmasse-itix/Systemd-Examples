# Execute a unit before and after another one

## Use case

In this example, I wanted to mount a file system (/mnt/test).
But before mounting the filesystem, I wanted to make a backup of it.
And after, I want to restore the filesystem from the previous backup.
In addition to that, the backup is stored on another filesystem that needs to be mounted too.

## Install

```sh
./install.sh
```

## Test

```sh
./test.sh
cat /mnt/test/witness
```
