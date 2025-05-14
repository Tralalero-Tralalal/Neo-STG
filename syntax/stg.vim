
" Vim syntax file for StringTemplate 4 (.stg) files
" Maintainer: you

if exists("b:current_syntax")
  finish
endif

" Comments (C-style)
syntax match stgComment "//.*"
syntax region stgComment start="/\*" end="\*/"

" Template definition and delimiters
syntax match stgTemplateHeader /^\s*\w\+\s*(.*)\s*::=\s*<</
syntax match stgTemplateStart /<</
syntax match stgTemplateEnd />>/

" Interpolated expressions: <...>
syntax region stgExpr matchgroup=Delimiter start=/</ end=/>/ contains=stgDirective,stgIdent,stgString,stgSpecial

" Directives inside <...>
syntax keyword stgDirective if else elseif endif foreach end separator first last rest length stripNulls trunc
syntax keyword stgBoolean true false null
syntax match stgOperator /::=/

" Identifiers inside <...>
syntax match stgIdent /\<[a-zA-Z_][a-zA-Z0-9_]*\>/

" Strings
syntax region stgString start=/"/ skip=/\\"/ end=/"/
syntax region stgString start=/'/ skip=/\\'/ end=/'/

" Highlight groups
highlight link stgComment Comment
highlight link stgTemplateHeader Function
highlight link stgTemplateStart Delimiter
highlight link stgTemplateEnd Delimiter
highlight link stgExpr String
highlight link stgDirective Keyword
highlight link stgIdent Identifier
highlight link stgOperator Operator
highlight link stgBoolean Boolean
highlight link stgString String

let b:current_syntax = "stg"
