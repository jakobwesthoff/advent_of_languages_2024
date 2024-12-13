type BuildTuple<
  N extends number,
  Acc extends any[] = []
> = Acc['length'] extends N
  ? Acc
  : BuildTuple<N, [...Acc, any];

type Substract<A extends number, B extends number> =
  BuildTuple<A> extends [...BuildTuple<B>, ...infer R]
  ? R['length']
  : never;

type Add<A extends number, B extends number> =
  [...BuildTuple<A>, ...BuildTuple<B>] extends infer R extends any[]
  ? R['length']
  : never;

type Multiply<A extends number, B extends number, Acc extends any[] = []> =
  BuildTuple<B> extends []
  ? Acc['length'] extends number
    ? Acc['length']
    : never
  : Multiply<A, Substract<B, 1>, [...Acc, ...BuildTuple<A>]>;

type RepeatedString<
  S extends string,
  N extends number,
  Counter extends number = N,
  Acc extends string = ""> =
  BuildTuple<Counter> extends []
  ? Acc
  : RepeatedString<S, N, Substract<Counter, 1>, `${Acc}${S}`>

type TreeGroup<N extends number, LEN extends number> = [
  `${RepeatedString<" ", Substract<LEN, N>>}/${RepeatedString<" ", Multiply<N, 2>>}\\`,
  `${RepeatedString<" ", Substract<Substract<LEN, N>, 1>>}/${RepeatedString<" ", Multiply<Add<N, 1>, 2>>}\\`,
];

type TreeGroups<
  LEN extends number,
  Counter extends number = LEN,
  Acc extends string[] = []
> = BuildTuple<Counter> extends []
  ? Acc
  : TreeGroups<LEN, Substract<Counter, 1>, [...Acc, ...TreeGroup<Substract<LEN, Counter>, LEN>]>;

type TreeTrunk<N extends number> = [
  `${RepeatedString<' ', N>}||`,
  `${RepeatedString<' ', N>}||`,
];

type XmasTree<N extends number> = [
  ...TreeGroups<N>,
  RepeatedString<'-', Add<Multiply<N, 2>, 2>>,
  ...TreeTrunk<N>
];

// I dare you: Try and change something in this Tree array and see, how the
// typescript compiler is complaining at COMPILE TIME about it! :)
let tree: XmasTree<3> = [
  "   /\\",
  "  /  \\",
  "  /  \\",
  " /    \\",
  " /    \\",
  "/      \\",
  "--------",
  "   ||",
  "   ||",
];

console.log(tree.join("\n"));
