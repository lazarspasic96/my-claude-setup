# Toggle Switcher UI Template

Complete HTML/CSS/JS template for the 5-variant design comparison view. Self-contained, zero dependencies.

## Web Template

Generate a single HTML file with this structure. Replace `{{VARIANT_X_CONTENT}}` placeholders with each variant's full implementation.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Design Variants — Pick Your Favorite</title>
  <style>
    *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

    /* --- Toggle Bar --- */
    .toggle-bar {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 9999;
      display: flex;
      align-items: center;
      gap: 6px;
      padding: 10px 16px;
      background: #111;
      border-bottom: 1px solid #2a2a2a;
      font-family: system-ui, -apple-system, sans-serif;
      overflow-x: auto;
      -webkit-overflow-scrolling: touch;
    }

    .toggle-bar__label {
      color: #666;
      font-size: 11px;
      text-transform: uppercase;
      letter-spacing: 0.08em;
      white-space: nowrap;
      margin-right: 4px;
    }

    .toggle-btn {
      padding: 6px 14px;
      border: 1px solid #333;
      border-radius: 4px;
      background: transparent;
      color: #999;
      font-size: 13px;
      font-family: inherit;
      cursor: pointer;
      white-space: nowrap;
      transition: all 150ms ease-out;
    }

    .toggle-btn:hover { border-color: #555; color: #ccc; }

    .toggle-btn.active {
      background: #fff;
      color: #111;
      border-color: #fff;
      font-weight: 600;
    }

    .toggle-btn kbd {
      display: inline-block;
      margin-right: 4px;
      padding: 1px 5px;
      border-radius: 3px;
      background: rgba(255,255,255,0.1);
      font-size: 11px;
      font-family: inherit;
    }

    .toggle-btn.active kbd { background: rgba(0,0,0,0.1); }

    /* --- Variant Containers --- */
    .variant-wrapper { padding-top: 52px; }

    .variant {
      display: none;
      opacity: 0;
      transition: opacity 200ms ease-out;
    }

    .variant.visible {
      display: block;
      opacity: 1;
    }

    /* --- Responsive --- */
    @media (max-width: 640px) {
      .toggle-bar { gap: 4px; padding: 8px 10px; }
      .toggle-btn { padding: 5px 10px; font-size: 12px; }
      .toggle-btn kbd { display: none; }
    }
  </style>
</head>
<body>
  <!-- Toggle Bar -->
  <nav class="toggle-bar" role="tablist" aria-label="Design variants">
    <span class="toggle-bar__label">Designs</span>
    <button class="toggle-btn active" role="tab" aria-selected="true"
            data-variant="a" aria-controls="variant-a">
      <kbd>1</kbd> A: {{STYLE_A_NAME}}
    </button>
    <button class="toggle-btn" role="tab" aria-selected="false"
            data-variant="b" aria-controls="variant-b">
      <kbd>2</kbd> B: {{STYLE_B_NAME}}
    </button>
    <button class="toggle-btn" role="tab" aria-selected="false"
            data-variant="c" aria-controls="variant-c">
      <kbd>3</kbd> C: {{STYLE_C_NAME}}
    </button>
    <button class="toggle-btn" role="tab" aria-selected="false"
            data-variant="d" aria-controls="variant-d">
      <kbd>4</kbd> D: {{STYLE_D_NAME}}
    </button>
    <button class="toggle-btn" role="tab" aria-selected="false"
            data-variant="e" aria-controls="variant-e">
      <kbd>5</kbd> E: {{STYLE_E_NAME}}
    </button>
  </nav>

  <!-- Variant Sections -->
  <div class="variant-wrapper">
    <section class="variant visible" id="variant-a" role="tabpanel"
             data-variant="a" aria-label="Design A">
      {{VARIANT_A_CONTENT}}
    </section>
    <section class="variant" id="variant-b" role="tabpanel"
             data-variant="b" aria-label="Design B">
      {{VARIANT_B_CONTENT}}
    </section>
    <section class="variant" id="variant-c" role="tabpanel"
             data-variant="c" aria-label="Design C">
      {{VARIANT_C_CONTENT}}
    </section>
    <section class="variant" id="variant-d" role="tabpanel"
             data-variant="d" aria-label="Design D">
      {{VARIANT_D_CONTENT}}
    </section>
    <section class="variant" id="variant-e" role="tabpanel"
             data-variant="e" aria-label="Design E">
      {{VARIANT_E_CONTENT}}
    </section>
  </div>

  <script>
    const buttons = document.querySelectorAll('.toggle-btn');
    const variants = document.querySelectorAll('.variant');

    function switchVariant(id) {
      buttons.forEach(btn => {
        const isActive = btn.dataset.variant === id;
        btn.classList.toggle('active', isActive);
        btn.setAttribute('aria-selected', isActive);
      });
      variants.forEach(v => {
        v.classList.toggle('visible', v.dataset.variant === id);
      });
    }

    buttons.forEach(btn => {
      btn.addEventListener('click', () => switchVariant(btn.dataset.variant));
    });

    document.addEventListener('keydown', (e) => {
      const map = { '1': 'a', '2': 'b', '3': 'c', '4': 'd', '5': 'e' };
      if (map[e.key]) switchVariant(map[e.key]);
    });
  </script>
</body>
</html>
```

## Variant Content Rules

Each `{{VARIANT_X_CONTENT}}` section:
- Must be fully self-contained HTML/CSS (scoped styles using variant-specific class prefix like `.va-`, `.vb-`, etc.)
- Must include its own `<style>` block with scoped selectors to avoid cross-variant CSS bleed
- Must include its own Google Fonts `<link>` if using web fonts
- Must NOT use global element selectors (`body`, `h1`, `p` etc.) — always scope

Example scoping pattern:
```html
<!-- Inside variant-a -->
<style>
  .va-container { font-family: 'Fraunces', serif; background: #F5F0E8; }
  .va-heading { font-size: 4rem; font-weight: 900; color: #1A1A1A; }
</style>
<div class="va-container">
  <h1 class="va-heading">Dashboard</h1>
</div>
```

## React Native Output

For React Native projects, do NOT generate a toggle HTML file. Instead:
1. Generate 5 separate component files: `VariantA.tsx`, `VariantB.tsx`, ..., `VariantE.tsx`
2. Generate one `DesignComparison.tsx` wrapper with a simple tab/segment control switching between them
3. Each variant file is a complete, self-contained component with its own StyleSheet
4. List all files with a brief description of each variant's style

## Extraction

When user picks a variant, extract it by:
1. Copy the content inside the chosen `<section data-variant="X">` block
2. Unscope the CSS (remove variant prefix like `.va-` → use clean class names)
3. Move `<style>` and `<link>` tags to proper document head
4. Output as clean standalone HTML/CSS or React component
