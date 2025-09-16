<?php

declare(strict_types=1);

use PhpCsFixer\Config;
use PhpCsFixer\Finder;
use PhpCsFixer\Runner\Parallel\ParallelConfigFactory;

$finder = (new Finder())
  ->in(__DIR__)
  ->exclude([
    'lib',
    'cache',
    'data',
    'plugins',
  ]);

return (new Config())
  ->setParallelConfig(ParallelConfigFactory::detect())
  ->setRules([
    '@Symfony'                            => true,
    '@PhpCsFixer'                         => true,
    '@PSR12'                              => true,
    '@PHP83Migration'                     => true,
    'php_unit_test_class_requires_covers' => false,
    'declare_strict_types'                => false,
    'binary_operator_spaces'              => [
      'default'   => 'single_space',
      'operators' => [
        '=>' => 'align_single_space_minimal',
      ],
    ],
    'concat_space' => [
      'spacing' => 'one',
    ],
    'global_namespace_import' => [
      'import_classes' => true,
    ],
    'multiline_whitespace_before_semicolons' => [
      'strategy' => 'no_multi_line',
    ],
    'full_opening_tag' => true,
    'echo_tag_syntax'  => [
      'format' => 'short',
    ],
  ])
  ->setFinder($finder)
  ->setIndent(str_repeat(' ', 2));
