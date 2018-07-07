makepkg-tidy-pdfsizeopt
===

A `libmakepkg` tidy extension that runs `pdfsizeopt` on all PDFs
in an installed package, optimizing their size.

## Installation
Drop `tidy_pdfsizeopt.sh` into `/usr/share/makepkg/tidy`.
Or, preferably, install from `makepkg-tidy-pdfsizeopt` from the AUR.

To enable it during a `makepkg` run, see below.

## Usage
Add one or more of the following to the `OPTIONS` array used by `makepkg`.
This can be done on a per-`PKGBUILD` basis, or in `/etc/makepkg.conf`.

- `pdfsizeopt`: loselessly compress PDFs found in the `pkgdir`.

I may add other options, which can be not-strictly-loseless in the future.

For example, my `OPTIONS` array in `/etc/makepkg.conf` is the following:

```
OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge pdfsizeopt !debug)
```
