The CommonAPI C++ Tooling is not built from source currently - simply
downloaded from released binaries.

"Material" is therefore only a definition of which version to download.  To
make it _really_ simple, the whole URL is defined in the text file.

It's still useful to keep this is materials/ directory since the Makefile
does dependency checking.  The download and installation will be skipped
if not needed - such as if the results are newer than the material.  If
the url file is changed however, make will recognize that the steps need
to be repeated.
