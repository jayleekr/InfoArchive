# Useful Technics for git !!!

## How to easily checkout files which are not staged yet

Untracked files are excluded in this case
``` sh
$ git status . -s -uno | awk '{print$2}' | xargs git checkout --
```

