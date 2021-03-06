
Introduction
============

This is Seong-Kook Shin's personal GNU Emacs (primarily for version 24.x) scripts.

I use this scripts on both my Gentoo Linux and my Macbook pro.

Here's a list of notable difference between other init scripts:

* Unless key packages are missing, /emacs-scripts/ are tolerent to missing packages.
* /emacs-script/ will compile most scripts and gives a profile report
* Works on Gentoo Linux and darwin(Mac)
* Providing pre-selected fontset (Latin and Korean)
* Korean support (mail, input-method, etc.)
* consistent key-bindings on several interpreter based languages

There are so many enhancements that I provided in /emacs-scripts/.  Please read the [wiki](https://github.com/cinsk/emacs-scripts/wiki) for the explanation.

Please, don't ask me of Windows configuration.  I hardly use it, so I can't help you.  However, I do accept any help or patches to support Windows.



List of used & customized packages 
==================================

* `package.el` support (even on Emacs version 23)
* ediff (for better frame handling, etc.)
* cc-mode (subword mode, linux kernel style, etc.)
* shell
* ibuffer
* hippie-expand
* iswitchb
* markdown
* vim-modeline
* magit
* lisp (emacs-lisp, common-lisp, slime, etc.)
* latex
* mmm-mode
* nxml (auto-correction on Gentoo installed schemas)
* dired-x
* xcscope
* mail
* yaml-mode
* css-mode
* cal-korea-x
* org-mode
* ruby-mode with inf-ruby
* python-mode
* maven
* w3m
* browse-url
* gnuplot
* go
* lua
* yasnippet
* scala2-mode with sbt-mode
* ess
* filladapt
* sunrise
* ido


Installation
============

Make sure that you have recent GNU Emacs at least 23 or above. (I
highly recommend to use 24.3 or above)

        $ cd
        $ # Make sure that you back up the old .emacs.d/
        $ rm -rf .emacs.d
        $ git clone https://github.com/cinsk/emacs-scripts.git .emacs.d

That's all.  Note that at the first time you launch Emacs after you
installed my scripts, Emacs will take some times for byte compilation
of several scripts.

I highly recommend to install additional packages.  To do that, start
Emacs, run `M-x list-packages`, then:

1. Navigate the list using `n` and `p` keys.
2. select following packages using `i` key.  If you accidentally select
   an unintended package, press `u` to deselect it.

        s
        dired+
        htmlize
        org
        sunrise-commander
        yasnippet
        icomplete+
        markdown-mode

3. For the rich environment, I recommend to select following packages too:

        auctex
        clojure-mode
        ess
        inf-ruby
        js-comint
        lua-mode
        python-mode
        ruby-mode
        sbt-mode
        scala-mode2
        slime
        yaml-mode
    
4. Once you selected all packages you need, press `x` to install them.

5. For safety, restart Emacs.


Org Agenda files
----------------

If you don't know about org agenda views, probably you don't need to
read this.  (See
[Agenda Views](http://orgmode.org/manual/Agenda-Views.html) for more).

If you have lots of org agenda files, please move them into
`$HOME/.emacs.d/agenda/` directory.  This directory will be created
automatically after launching Emacs with my scripts;   Any `.org` file
in that directory will be addded into the variable `org-agenda-files` on
startup.


If you want to sync your agenda files with
[Dropbox](https://www.dropbox.com/), then follow these instructions:

1. Assume that your Dropbox folder is `$HOME/Dropbox/`, create a
   directory for the agenda directory (say, `$HOME/Dropbox/agenda`).

        $ mkdir $HOME/Dropbox/agenda
    
2. Remove `$HOME/.emacs.d/agenda` directory, and create a symbolic
   link, agenda to `$HOME/Dropbox/agenda`:

        $ cd $HOME/.emacs.d/
        $ rmdir agenda
        $ ln -s $HOME/Dropbox/agenda .

OUTDATED
--------

I no longer uses X resources for Emacs font.  However you could use it
if you want.  Assuming that you use bash(1), add following sentence in
your `$HOME/.bashrc`:

        [[ -n "$DISPLAY" ]] && xrdb -merge ~/.emacs.d/emacs.res


