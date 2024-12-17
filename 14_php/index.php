<?php
declare(strict_types=1);

//   /\
//  /  \
//  /  \
// /  o \
// /    \
/// u    \

//   ||
//   ||

require_once("TreeBuilder.php");

$builder = new TreeBuilder(3);
$tree = $builder->build();

require("template.php");
