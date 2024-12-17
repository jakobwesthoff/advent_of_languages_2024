<?php
declare(strict_types=1);

//    /\   
//   /  \  
//   /  \  
//  /  o \ 
//  /    \ 
// / u    \
// --------
//    ||   
//    ||   

class TreeBuilder {
  public function __construct(private int $groups) {}
  public function build(): array {
    return [
      "groups" => $this->makeGroups(),
      "divider" => $this->makeDivider(),
      "trunk" => $this->makeTrunk(),
    ];
  }

  private function spaces(int $n): string {
    return str_repeat(" ", $n);
  }

  private function makeGroups(): array {
    $output = [];
    for($i=0; $i<$this->groups; $i++) {
      $spaceBefore = $this->spaces($this->groups - $i);
      $spaceInBetween = $this->spaces($i*2);
      $output[] = "{$spaceBefore}/${spaceInBetween}\\";

      $spaceBefore = $this->spaces($this->groups - $i - 1);
      $spaceInBetween = $this->spaces(($i+1)*2);
      $output[] = "{$spaceBefore}/{$spaceInBetween}\\";
    }

    return $output;
  }

  private function makeDivider(): string {
    return str_repeat("-", $this->groups*2+2);
  }

  private function makeTrunk(): array {
    $spacing = $this->spaces($this->groups);
    $line = "{$spacing}||";
    return [$line, $line];
  }
}
