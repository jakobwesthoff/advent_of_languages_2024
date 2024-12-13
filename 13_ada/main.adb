with Ada.Wide_Text_IO; use Ada.Wide_Text_IO;
with Ada.Strings.Wide_Unbounded; use Ada.Strings.Wide_Unbounded;
with Random;

--     /\
--    /  \
--    /  \
--   /  o \
--   /    \
--  / u    \
--  --------
--     ||
--     ||
procedure Main is
  function Make_Ornament(N: Natural) return Wide_String is
    Ornament : Wide_String := "⭐";
    Builder : Unbounded_Wide_String := To_Unbounded_Wide_String("");
    I : Natural := 0;
  begin
    while I < N loop
      if Random.Chance(20.0) and I < N - 1 then
        Append(Builder, Ornament);
        I := I + 2;
      else
        Append(Builder, " ");
        I := I + 1;
      end if;
    end loop;
    return To_Wide_String(Builder);
  end Make_Ornament;

  function Make_Space(N: Natural) return Wide_String is
  begin
    return (1..N => ' ');
  end Make_Space;

  procedure Print_Group(N: Natural; Length: Natural) is
    Outer_Spacing_1: Wide_String := Make_Space(Length - N);
    Inner_Spacing_1: Wide_String := Make_Ornament(N*2);
    Outer_Spacing_2: Wide_String := Make_Space(Length - N - 1);
    Inner_Spacing_2: Wide_String := Make_Ornament((N+1)*2);
  begin
    Put_Line(Outer_Spacing_1 & "/" & Inner_Spacing_1 & "\");
    Put_Line(Outer_Spacing_2 & "/" & Inner_Spacing_2 & "\");
  end Print_Group;

  procedure Print_Groups(Length: Natural) is
  begin
    for N in 0..Length - 1 loop
      Print_Group(N, Length);
    end loop;
  end Print_Groups;
begin
  Random.Initialize;
  Print_Groups(6);
end Main;
