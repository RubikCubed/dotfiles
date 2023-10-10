{
  config,
  pkgs,
  ...
}: let
  haskell = pkgs.haskell.packages.ghc94;
  packages = p:
    with p; [
      /*
      adjunctions
      aeson
      async
      base
      bytestring
      comonad
      constraints
      containers
      contravariant
      criterion
      data-fix
      distributive
      effectful
      exceptions
      free
      foldl
      kan-extensions
      lens
      megaparsec
      mtl
      parser-combinators
      */
      pretty-simple
      /*
      prettyprinter
      primitive
      profunctors
      QuickCheck
      random
      recursion-schemes
      semigroupoids
      text-short
      stm
      template-haskell
      text
      text-show
      transformers
      unordered-containers
      */
    ];
in {
  home.packages = with haskell; [
    #   cabal-fmt
    cabal-install
    #   cabal-plan
    fourmolu
    (ghcWithHoogle packages)
#    haskell-language-server
    hlint
    #   ghcid
  ];

  home.file = {
    ".ghc/ghci.conf".text = ''
      :def hoogle \x -> pure $ ":!hoogle \"" <> x <> "\" --count=20"
      :def! doc \x -> pure $ ":!hoogle --info \"" ++ x ++ "\""
      :set prompt "> "
      :set prompt-cont "  | "
      :set -XNoStarIsType
      :set -Wno-unused-top-binds
      :set +m

      :seti -Wall -Wno-type-defaults -Wno-name-shadowing
      :seti -fno-defer-type-errors -fno-show-valid-hole-fits
      :set -package pretty-simple
      :seti -interactive-print=Text.Pretty.Simple.pPrint
    '';
    ".haskeline".text = "editMode: Vi";
  };

  home.sessionVariables.CABAL_DIR = "${config.xdg.dataHome}/cabal";
  home.sessionPath = ["${config.xdg.dataHome}/cabal/bin"];
}
