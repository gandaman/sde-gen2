SDE (Software Development Environment)
======================================

This is generation 2 of the GDP SDE build

Generation 2 only means it is built with a new setup. The feature conttent
has been and will continue to be a continuous improvement.  We might label
versioned releases, or not, but a compatible SDE is always released in
combination with a labeled version of GDP.

The principle for generation 2 is to fix some previous problems

- It used to be built by a combination of shell script and instructions
in the go.genivi.org CI build system.  That made it difficult to view
the entire, inflexible to change, and difficult for others to fork &
modify.

The previous design was however built in multiple stages in a pipeline -
for example, most of the tools are compiled by earlier stages or pipelines
that feed into the final assembly pipeline.  This means the CI system would
retrigger new versions of the complete environment, whenever any of the
individual tools is changed.  Using chained pipelines it's not required to
re-run this script on a timer since the CI system will handle all necessary
rebuild triggers, and the minimal set of parts will be built (i.e. typical
build dependency management)

naive script would just rebuild everything all the time, and be massively
inefficient.

The purpose of this repo is to both support efficient pipeline setup for
the CI system, as well as stand-alone builds for those that want to do
that.

Another important reason to build the individual parts separately from
one big script, is that the intermediate build result (such as one 
individual tool) can be downloaded and used stand-alone or might be
used in other configurations.

Purpose and content of this repo:

* Except for major tool installations, version control the content for the
home directory (see below), such as 
** various .dotfiles and other such configuration
** smaller helper scripts and binaries that were not part of earlier pipeline stages
** other needed data, such as desktop wallpaper
* Finally, a single shell script to execute apt-get install of remaining
needed packages, and other final configuration.

Mechanics of operation:
-----------------------

* In addition to actual files to be included, the repo has a simple [Vagrantfile](http://vagrantup.com) that imports a base distro and then:

* All the content of homedir/ is rsync:ed unmodified to the home directory of the VM.  This populates the VM with some relevant configuration files directly.
Extending or configuring the SDE is sometimes just a matter of adding files under homedir/ in exactly the relative location where they should end up.  
*Send pull requests!*

- In the final step, script.sh is run inside the VM for those steps that need to execute such as apt-get installs and any other scripted steps.

