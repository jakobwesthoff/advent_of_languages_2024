//    /\
//   /  \
//   /  \
//  /  o \
//  /    \
// / u    \
// --------
//    ||
//    ||
public class HelloXmas {
  public static void main(String args[]) {
    System.out.println(new XmasTree(5));
  }
}

class XmasTree {
  private int groups;

  public XmasTree(int groups) {
    this.groups = groups;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();
    
    b.append(new TreeGroups(this.groups));
    b.append(new Divider(this.groups));
    b.append(new TreeTrunk(this.groups));

    return b.toString();
  }
}

class TreeGroups {
  private int groups;

  public TreeGroups(int groups) {
    this.groups = groups;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();
    
    for (int i=0; i<this.groups; i++) {
      b.append(new TreeGroup(this.groups, i));
    }

    return b.toString();
  }
}

class FirstTreeGroupLine {
  private int groups;
  private int n;

  public FirstTreeGroupLine(int groups, int n) {
    this.groups = groups;
    this.n = n;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();

    b.append(new Spaces(this.groups - this.n));
    b.append(new Slash());
    b.append(new Spaces(this.n * 2));
    b.append(new Backslash());
    b.append("\n");

    return b.toString();
  }
}

class SecondTreeGroupLine {
  private int groups;
  private int n;

  public SecondTreeGroupLine(int groups, int n) {
    this.groups = groups;
    this.n = n;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();

    b.append(new Spaces(this.groups - this.n - 1));
    b.append(new Slash());
    b.append(new Spaces((this.n + 1) * 2));
    b.append(new Backslash());
    b.append("\n");

    return b.toString();
  }
}

class TreeGroup {
  private int groups;
  private int n;

  public TreeGroup(int groups, int n) {
    this.groups = groups;
    this.n = n;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();
    
    b.append(new FirstTreeGroupLine(this.groups, this.n));
    b.append(new SecondTreeGroupLine(this.groups, this.n));

    return b.toString();
  }
}


class Slash {
  public String toString() {
    return "/";
  }
}

class Backslash {
  public String toString() {
    return "\\";
  }
}

class Trunk {
  public String toString() {
    return "||";
  }
}

class TrunkLine {
  private int groups;

  public TrunkLine(int groups) {
    this.groups = groups;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();

    b.append(new Spaces(this.groups));
    b.append(new Trunk());
    b.append("\n");
    
    return b.toString();
  }
}

class TreeTrunk {
  private int groups;

  public TreeTrunk(int groups) {
    this.groups = groups;
  }

  public String toString() {
    StringBuilder b = new StringBuilder();
    b.append(new TrunkLine(this.groups));
    b.append(new TrunkLine(this.groups));

    return b.toString();
  }
}

class Divider {
  private int groups;

  public Divider(int groups) {
    this.groups = groups;
  }

  public String toString() {
    return "-".repeat(this.groups*2+2) + "\n";
  }
}

class Spaces {
  private int n;

  public Spaces(int n) {
    this.n = n;
  }

  public String toString() {
    return " ".repeat(this.n);
  }
}
