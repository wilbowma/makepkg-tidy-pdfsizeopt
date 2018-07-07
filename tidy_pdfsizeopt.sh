#!/usr/bin/bash
#
#   tidy_pdfsizeopt.sh - Optimize the size of PDFs with pdfsizeopt.
#
#   Copyright (c) 2018 William J. Bowman <wjb@williamjbowman.com>


[[ -n "$LIBMAKEPKG_TIDY_PDFSIZEOPT_SH" ]] && return
LIBMAKEPKG_TIDY_PDFSIZEOPT_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/util/message.sh"
source "$LIBRARY/util/option.sh"


packaging_options+=('pdfsizeopt')
tidy_modify+=('tidy_pdfsizeopt')

tidy_pdfsizeopt() {
  if check_option "pdfsizeopt" "y"; then
    msg2 "$(gettext "Optimizing PDFs ...")"
    find . -type f -iname "*.pdf" -exec pdfsizeopt --do-regenerate-all-fonts=no --use-jbig2=yes --use-image-optimizer="ect -9 -keep -progressive --strict --mt-deflate %(targetfnq)s" '{}' \; 2>/dev/null
    find . -type f -iname "*.pso.pdf" -exec rename .pso.pdf .pdf '{}' + 2>/dev/null
  fi
}
