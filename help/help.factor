! File: help
! Version: 0.1
! DRI: Dave Carlton
! Description: Another fine Factor file!
! Copyright (C) 2022 Dave Carlton.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays assocs classes combinators effects
help.markup help.topics kernel make namespaces prettyprint
sequences skov.basis.ui.tools.environment.tree.help-tree words
words.symbol ;
IN: help

M: word word-help*
    stack-effect [ in>> ] [ out>> ] bi [
        [
            dup pair? [
                first2 dup effect? [ \ $quotation swap 2array ] when
            ] [
                object
            ] if [ effect>string ] dip
        ] { } map>assoc
    ] bi@ [ \ $inputs prefix ] dip \ $outputs prefix 2array ;

M: word article-title
    dup [ parsing-word? ] [ symbol? ] bi or [ name>> ] [ unparse ] if ;

: (old-word-help) ( word -- element )
    [
        {
            [ \ $vocabulary swap 2array , ]
            [ word-help % ]
            [ \ $related swap 2array , ]
            [ dup global at [ get-global \ $value swap 2array , ] [ drop ] if ]
            [ \ $definition swap 2array , ]
        } cleave
    ] { } make ;

DEFER: $graph
: (word-help) ( word -- element )
    [
        {
            [ \ $vocabulary swap 2array , ]
            [ \ $graph swap 2array , ]
            [ word-help % ]
            [ dup global at [ get-global \ $value swap 2array , ] [ drop ] if ]
            [ \ $definition swap 2array , ]
            [ \ $related swap 2array , ]
        } cleave
    ] { } make ;

M: class article-content (word-help) ;
