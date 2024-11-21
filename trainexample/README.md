Project Versioning Training with CMake and Git
==============================================
First of all build the project once by doing:
```
(in case of Visual Studio)
mkdir build
cd build
cmake ..
```

What I've Done:
```
just builded and launched the project. What happened?:
The debugger gone to error on main.c cause the unexisted define "FOOBAR_VERSION".
I have added the foobar_version.h near main.c and everything runned successful.
main.c printed the message "v0.0.0-unknown" as expected. (By the way foobar_version.h
exists on "build/foobar_version.h too"). Then I deleted the foobar_version.h file near
main.c and compiler/runner doesn't insult and crashed. OK!?

```
Then I've done next:
```
git tag
(no any tags, everything is clear yet)
git tag -a v0.0.1-train -m "train first beta tag"
(but not that i didn't commited and pushed)
(Builder exported new define with string "v0.0.1-train-dirty")
(And also it exported on build/foobar_version.h the same define like on above)
```
Now I just commit and push.
```
(oops. I've forgot push with tag.)
(The I do:)
git push origin train --tags

```
```
Note! The auto generatings of new version define tags (dirty, or any else) happens only on foobar_version placed
on builded project folder. In my case build/foobar_version.h
```


## License

This example is licensed under the MIT license. See [LICENSE](LICENSE).
