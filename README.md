# Homebrew Tap for Caffeine Lang

## Installation

```bash
brew tap brickell-research/caffeine
brew install caffeine_lang
```

## What is Caffeine Lang?

Caffeine Lang is a programming language. Visit [our repository](https://github.com/Brickell-Research/caffeine_lang) for more information.

## Available Formulae

- `caffeine_lang` - The Caffeine programming language

## Updating

To update to the latest version:

```bash
brew update
brew upgrade caffeine_lang
```

## Development

To test changes locally:

```bash
brew audit --strict caffeine_lang
brew install --build-from-source caffeine_lang
brew test caffeine_lang
```

### Switching Between Live and Local Versions

When developing the formula locally, Homebrew's tap may conflict with your local changes.

**To use the live (published) tap:**

```bash
# Uninstall current version
brew uninstall caffeine_lang

# Remove and re-add the tap from GitHub
brew untap brickell-research/caffeine
brew tap brickell-research/caffeine

# Install from live tap
brew install caffeine_lang
```

**To use your local development version:**

```bash
# Uninstall current version
brew uninstall caffeine_lang

# Reset Homebrew's tap to match your local changes
cd /opt/homebrew/Library/Taps/brickell-research/homebrew-caffeine
git pull origin main

# Or force reset to match remote
git reset --hard origin/main

# Reinstall
brew reinstall caffeine_lang
```

**Quick sync from local repo to Homebrew tap:**

```bash
# After pushing changes to GitHub
cd /opt/homebrew/Library/Taps/brickell-research/homebrew-caffeine
git pull
brew reinstall caffeine_lang
```

## Troubleshooting

If you encounter issues:

1. Try `brew untap brickell-research/caffeine` and then re-tap
2. Clear Homebrew cache: `brew cleanup`
3. Report issues at https://github.com/Brickell-Research/homebrew-caffeine/issues

## License

GPL-3.0
