+++
title = "Git mergetool and difftool: more panes, more gains."
date = 2020-04-01T09:54:55Z
tags = ["git", "mergetool", "difftool"]
draft = true
+++

{{< figure src="https://git-scm.com/images/logos/downloads/Git-Logo-Black.png" title="git log-o"alt="git logo" link="https://git-scm.com/downloads/logos" width="50%">}}

Git is an amazing tool. Without Git, collaborative development would be very different and far more chaotic. As a long-time user and even longer learner, I'm always impressed at how many hidden gems there still are.

If I had to play a round of [Pointless](https://en.wikipedia.org/wiki/Pointless) with Git, `mergetool` and `difftool` would undoubtedly be two of the commands I'd pick. They're amazing but widely under-appreciated. In this post we'll look at both of them and show you how to view changes and resolve conflicts better than ever before.

## But first, Vim.
As an un-ashamed Vim lover, this post will use Vim as the editor for these commands. If you're not familiar with Vim, then I absolutely recommend you head over to [vim-adventures.com](https://vim-adventures.com/) after reading this. Vim is a powerful and highly customisable editor with everything you need without leaving your terminal.

You don't have to know Vim to follow this, but I will dive in to some specifics. Feel free to use this information to set a different tool of your choice, such as [Meld](https://meldmerge.org/) or just classic [diff](http://man7.org/linux/man-pages/man1/diff.1.html).

_Found yourself stuck in Vim at any point? You're not alone. Head over to [Stack Overflow](https://stackoverflow.blog/2017/05/23/stack-overflow-helping-one-million-developers-exit-vim/) to join the now 2.1 million people like you. The world feels a little smaller now doesn't it?_

## difftool

Depending on your team, workflow and many other factors, you may or may not run into many conflicts. You will, however, most definitely be changing things and generating diffs. Here's what the manpage says about  `git difftool`:

> git difftool is a Git command that allows you to compare and edit files between revisions using common diff tools. git difftool is a frontend to git diff and accepts the same options and arguments.

When you run `git diff` you'll see a pretty simple output with the changes shown as a unified diff straight into stdout. For example:

```bash
diff --git a/fhrs/establishments_test.go b/fhrs/establishments_test.go
index 2e064f9..70fa151 100644
--- a/fhrs/establishments_test.go
+++ b/fhrs/establishments_test.go
@@ -232,7 +232,7 @@ func TestGetByID_Headers(t *testing.T) {
                io.WriteString(w, body)
        })

-       if err := client.SetLanguage(Cymraeg); err != nil {
+       if err := client.SetLanguage(LanguageCymraeg); err != nil {
                t.Error(err)
        }
```

 For simple changes like this, there's little to worry about, but for more complex changes this gets pretty unwieldy. It gets more complex still if you want to search it and go beyond just a quick compare and stare. Try running the following on a repo with some changes:

```bash
git config --global diff.tool vimdiff
git difftool
```

You'll notice your output now appears in a vim window with a nice side-by-side diff and all available searching and navigation goodness the editor provides.

### How do I exit the tool?

If you're struggling to escape, you'll need to type `ESC` followed by `:qa!` for each of the files you've changed. The `ESC` exits your current vim mode and then gives the command to `(q)uit (a)ll` with some added `!` for force.

### How do I remove or change my difftool?

I prefer to edit my `~/.gitconfig` file directly and simply add and remove lines, but you can also run `git config --global --unset diff.tool` to remove it or re-run the above with something else to change it.

### Further configuration

To make things easier, I like to add an [alias](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) so I can run my difftool every time instead of `git diff`. I also found the confirmation pretty irritating, so I also turned that off. Below are the entries in my `.gitconfig`.

```bash
[alias]
  df = difftool
[difftool]
  prompt = false
```

For Vim, you can customise the colorscheme used for diffs, if yours isn't very readable or visually pleasing. Here's an example `.vimrc`.


```bash
if &diff
    colorscheme evening
else
    colorscheme morning
endif
```

## mergetool

```bash
git config --global merge.tool vimdiff
git mergetool
```
## References
