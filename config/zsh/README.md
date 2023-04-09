### Zsh

Some of these utility functions rely on the default `$SHELL` being `zsh`.

You can check this:

```
echo $SHELL
```


You can change this by using `chsh`:

```
chsh -s $(which zsh)
```


Log out to apply the changes.




On WSL2, I had to shutdown and start up again.

```
wsl.exe --shutdown
```
