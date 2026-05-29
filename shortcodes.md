# Shortcodes Reference

Shortcodes are used inside `.md` post files.
Inline shortcodes use `{{ }}`, block shortcodes use `{% %}...{% end %}`.

---

## Inline shortcodes

### `cycle` — clickable cycling word

Renders as `//word//` with the word cycling to the next on each click, looping
back to the first.

**Inline** — for short lists, pass words directly:
```
{{ cycle(words=["writing", "thinking", "speaking"]) }}
```

**Named list** — for long lists, define the array once in `data/cycles.toml`
under `[lists]`, then reference it by key:
```toml
# data/cycles.toml
[lists]
verbs = ["writing", "thinking", "speaking", "dreaming", "forgetting"]
```
```
{{ cycle(key="verbs") }}
```

Optional `random=true` flag — picks a random word on each click instead of cycling
sequentially. Works with both `words=` and `key=`. Never lands on the same word twice
in a row (when the list has more than one word).

```
{{ cycle(words=["brick", "clay", "mortar"], random=true) }}
{{ cycle(key="verbs", random=true) }}
```

---



### `big` — giant display word

```
{{ big(text="WORD") }}
```

Renders as a full-width block in VT323 at ~5rem with a red glow.
Good for a dramatic single word or short phrase standing alone on its line.

---

### `accent` — red emphasis

```
{{ accent(text="word") }}
```

Colors the text in the site's red accent. Stays inline.
Use for a word that should stain the sentence around it.

---

### `outline` — hollow lettering

```
{{ outline(text="WORD") }}
```

VT323 at ~3rem, transparent fill with a red stroke outline.
Good for a word that is present only as a shape.

---

### `flicker` — neon fault

```
{{ flicker(text="word") }}
```

Text flickers in and out like a faulty sign, with a glow when lit.
Works inline; the animation is subtle and periodic.

---

### `spin` — slow rotation

```
{{ spin(text="⊕") }}
```

Rotates the content continuously (6s per revolution). Works best on
symbols or single characters — spinning a long word is disorienting
by design, but use with intent.

---

### `glitch` — chromatic aberration

```
{{ glitch(text="word") }}
```

Periodic burst of chromatic aberration: top half shifts pink, bottom
half shifts cyan, then it snaps back. The effect fires roughly every
3–4 seconds and lasts a fraction of a second.

---

## Block shortcodes

### `slide` — scrolling treadmill

```
{% slide() %}
text that scrolls forever to the right
{% end %}
```

Full viewport width, like `bleed`. The content scrolls rightward continuously,
re-entering from the left. The content is duplicated internally to make the
loop seamless — you only write it once. Markdown works inside.

Optional `speed` parameter: seconds per full cycle (default 18). Lower = faster.

```
{% slide(speed=8) %}
faster
{% end %}

{% slide(speed=40) %}
very slow drift
{% end %}
```

---

### `bleed` — full-width breakout

```
{% bleed() %}
content here

*markdown works inside*
{% end %}
```

Breaks out of the 860px content column to fill the full viewport width.
Content inside is rendered as Markdown. Good for a passage that should
feel like it escapes the page, or a visual interruption in the prose.

---

## Typography (no shortcodes needed)

`smart_punctuation` is enabled in `config.toml`, so:

- `--`  → en dash  –
- `---` → em dash  —
- Straight quotes go curly automatically

Standard Markdown works as usual:

- `*italic*` or `_italic_`
- `**bold**`
- `***bold italic***`
- `---` on its own line → horizontal rule
