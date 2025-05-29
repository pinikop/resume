# LaTeX CV Template

A professional CV/resume template system with theme support and automated build management. Create beautiful, customizable CVs with different color themes and easy version tracking.

## Features

- Multiple color themes (classic, modern, professional, nature, ruby, amethyst)
- Automated build system with version management
- Clean and professional layout
- Section-based organization
- Contact information with social media links
- Customizable bullet points and spacing

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/yourusername/resume
cd resume
```

2. Make a copy of the example CV:
```bash
cp example.tex myCV.tex
```

3. Edit `myCV.tex` with your information

4. Build your CV:
```bash
# Basic usage (creates myCV.pdf and a dated copy)
./build.sh

# Keep auxiliary files (useful for debugging)
./build.sh -k

# Specify custom output filename
./build.sh -t CustomName.pdf
```

## Directory Structure

```
.
├── cv-template.cls     # LaTeX class file
├── cv-themes.sty       # Color themes
├── example.tex         # Example CV
├── build.sh           # Build script
├── README.md
└── archive/           # Directory for dated copies
```

## Build Script Options

```bash
Usage: ./build.sh [options]

Options:
  -s, --source FILE    Source .tex file (default: example.tex)
  -t, --target FILE    Target PDF filename (default: cv.pdf)
  -c, --company NAME   Company name for dated copy (default: general)
  -k, --keep          Keep auxiliary files (default: delete)
  -h, --help          Show this help message
```

## Customization

### Themes
Choose a theme by modifying the following line in your .tex file:
```latex
\setTheme{classic}  % Options: classic, modern, professional, nature, ruby, amethyst
```

### Contact Information
Update your contact details:
```latex
\name{Your Name}
\phone{Your Phone}
\email{your.email@example.com}
\linkedin{linkedin-username}
% \github{github-username}  % Uncomment if needed
```

### Custom Spacing
Adjust spacing between sections and elements:
```latex
\setlength{\sectionSpacing}{0ex}
\setlength{\entrySpacing}{3ex}
\setlength{\bulletSpacing}{1.5ex}
```

## Requirements

- LaTeX distribution (e.g., TexLive)
- Bash shell environment
- Required LaTeX packages:
  - xcolor
  - geometry
  - fontawesome5
  - hyperref
  - marvosym
  - titlesec

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This template is distributed under the LaTeX Project Public License (LPPL). See [LICENSE](LICENSE) for more information.