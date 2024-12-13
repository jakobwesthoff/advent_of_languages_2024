-module(tree).
-export([draw/0]).
 
%    /\
%   /  \
%   /  \
%  /  o \
%  /    \
% / u    \
% --------
%    ||
%    ||

draw() -> 
  Groups=7,
  Tree = make_groups(Groups) ++  make_divider(Groups) ++ make_trunk(Groups),
  [ io:format("~s~n", [Line]) || Line <- Tree ],
  ok.

make_groups(Groups) ->
  make_groups(0, Groups, []).

make_groups(N, Groups, Lines) when N < Groups ->
  OuterSpaces1 = string:chars($ , Groups-N),
  InnerSpaces1 = string:chars($ , N*2),
  Line1 = OuterSpaces1 ++ "/" ++ InnerSpaces1 ++ "\\",
  OuterSpaces2 = string:chars($ , Groups-N-1),
  InnerSpaces2 = string:chars($ , (N+1)*2),
  Line2 = OuterSpaces2 ++ "/" ++ InnerSpaces2 ++ "\\",
  make_groups(N+1, Groups, Lines ++ [Line1, Line2]);
make_groups(Groups, Groups, Lines) ->
  Lines.

make_divider(Groups) ->
  Divider = string:chars($-, Groups*2+2),
  [Divider].

make_trunk(Groups) ->
  Trunk = string:chars($ , Groups) ++ "||",
  [Trunk, Trunk].
