//    /\
//   /  \
//   /  \
//  /  o \
//  /    \
// / u    \
// --------
//    ||
//    ||
package main;

import (
  "fmt";
  "strings";
)

type Tree struct {
  lines []string;
  length int;
} 

func NewTree(length int) *Tree {
  return &Tree{
    lines: []string{},
    length: length,
  }
}

func (tree *Tree) createGroups() {
  for n := range(tree.length) {
    tree.lines = append(
      tree.lines,
      fmt.Sprintf("%*s%*s", tree.length - n + 1, "/", n*2 + 1, "\\"),
    )
    tree.lines = append(
      tree.lines,
      fmt.Sprintf("%*s%*s", tree.length - n, "/", (n+1)*2 + 1, "\\"),
    )
  }
}

func (tree *Tree) createTrunk() {
  tree.lines = append(
    tree.lines,
    fmt.Sprintf("%*s|", tree.length, "|"),
  );
  tree.lines = append(
    tree.lines,
    fmt.Sprintf("%*s|", tree.length, "|"),
  );
}

func (tree *Tree) String() string {
  tree.createGroups();
  tree.lines = append(tree.lines, fmt.Sprintf("%.*s", tree.length * 2 + 2, "-------------------------------------------------------------------------"))
  tree.createTrunk();
  return strings.Join(tree.lines, "\n");
}

func main() {
  tree := NewTree(9);
  fmt.Printf("%s", tree);
}
