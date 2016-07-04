# translator
This project is aiming at building a multi-languages translator by Haskell, to use it, first:

```git clone git@github.com:zhangli0102/translator.git``` in your comfortable directory. then:

```stack build``` in your dir, this needs stack pre-installed, after that:

```echo "words to translate" | stack exec translator MODE``` where MODE can be engch (English to Chinese), cheng (Chinese to English), engger (English to German), gereng (German to English), gerch (German to Chinese) or chger (Chinese to German) for now. More options to be added in the future.

