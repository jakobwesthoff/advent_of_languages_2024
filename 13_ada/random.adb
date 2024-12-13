with Ada.Numerics.Float_Random;

package body Random is
  Gen : Ada.Numerics.Float_Random.Generator;

  function Chance(Percentage: Float) return Boolean is
  begin
    return (Ada.Numerics.Float_Random.Random(Gen) < (Percentage / 100.0));
  end Chance;

  procedure Initialize is 
  begin
    Ada.Numerics.Float_Random.Reset(Gen);
  end Initialize;
end Random;
