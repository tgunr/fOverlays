! File: help.markup
! Version: 0.1
! DRI: Dave Carlton
! Description: Another fine Factor file!
! Copyright (C) 2022 Dave Carlton.
! See http://factorcode.org/license.txt for BSD license.

USING: help.markup.private io namespaces sequences
skov.basis.ui.tools.environment.tree.help-tree ui.gadgets.panes
    ;
IN: help.markup
: $inputs ( element -- )
    "Inputs" $heading
    [ [ "none" print ] ($block) ]
    [ [ values-row ] map $table ] if-empty ;

: $outputs ( element -- )
    "Outputs" $heading
    [ [ "none" print ] ($block) ]
    [ [ values-row ] map $table ] if-empty ;

: $see ( element -- )
    check-first <definition-tree> nl output-stream get write-gadget ;

: $graph ( element -- )
    check-first <help-tree> nl nl output-stream get write-gadget ;

