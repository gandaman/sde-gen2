The CommonAPI C++ Tooling is not built from source at this time, but simply
downloaded from released binaries.

"Material" therefore only constitues a definition of which version to
download.  To make it _really_ simple, the whole URL is defined in the text
file.

It's still useful to keep this is materials/ directory since the Makefile
does dependency checking - i.e. it will make a new download & install if
the material information is updated - otherwise it will not do it
unnecessarily.
