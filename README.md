# translator
This project is aiming at building a multi-languages translator by Haskell, to use it, first:

```git clone git@github.com:zhangli0102/translator.git``` in your comfortable directory. then:

```stack build``` in your dir, this needs stack pre-installed, after that:

```echo "words to translate" | stack exec translator MODE``` where MODE can be engch(English to Chinese) or cheng (Chinese to English) for now. More options to be added in the future.

