# Homebrew Tap for Caffeine Lang

## Installation

```bash
brew tap robertdurst/caffeine
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
brew audit --strict Formula/caffeine_lang.rb
brew install --build-from-source Formula/caffeine_lang.rb
brew test caffeine_lang
```

## Troubleshooting

If you encounter issues:

1. Try `brew untap robertdurst/caffeine` and then re-tap
2. Clear Homebrew cache: `brew cleanup`
3. Report issues at https://github.com/robertdurst/homebrew-caffeine/issues

## License

GPL-3.0
