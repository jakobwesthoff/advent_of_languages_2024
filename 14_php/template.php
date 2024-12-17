<html>
  <head>
    <title>Merry Xmas - Advent of Languages</title>
    <style>
      html, body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
      }
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 5rem;
        font-family: monospace;
      }
      .line {
        white-space: pre
      }

      .groups {
        color: #00ff00;
      }
      .divider {
        color: #ffcc00;
      }
      .trunk {
        color: #ff0000;
      }
    </style>
  </head>
  <body>
    <div class="tree">
      <div class="groups">
        <?php foreach ($tree['groups'] as $group) {?>
          <div class="line"><?= $group ?></div>
        <?php } ?>
      </div>
      <div class="divider">
        <div class="line"><?= $tree['divider'] ?></div>
      </div>
      <div class="trunk">
        <div class="line"><?= $tree['trunk'][0] ?></div>
        <div class="line"><?= $tree['trunk'][1] ?></div>
      </div>
    </div>
  </body>
</html>
