<?php

// TODO: Enable @auto ruleset once v3.88.0 is released

return (new PhpCsFixer\Config())
  ->setParallelConfig(PhpCsFixer\Runner\Parallel\ParallelConfigFactory::detect())
  ->setRules([
    '@PER-CS' => true,
  ])
  ->setIndent('  ')
  ->setLineEnding("\n")
;
