# Academic CV Template

A professional LaTeX template for academic CVs with clean formatting and easy customization.

## 🌟 Features

- **Professional Design**: Clean and academic-focused layout
- **Easy Customization**: Separate configuration file for personal information
- **Modular Structure**: Well-organized sections for education, experience, research, and skills
- **Responsive Layout**: Optimized for both digital viewing and printing
- **Multi-language Support**: Compatible with various character encodings
- **ATS-Friendly**: Machine-readable format for applicant tracking systems

## 📋 Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
- [Customization](#customization)
- [File Structure](#file-structure)
- [Compilation](#compilation)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/yinggangtian/Academic-CV-template.git
   cd Academic-CV-template
   ```

2. **Prepare your assets**
   - Add your profile photo to `assets/profile_photo.jpg`
   - Add your university logo to `assets/university_logo.png`

3. **Setup configuration**
   ```bash
   make setup  # Creates config.tex from example
   ```
   Or manually:
   ```bash
   cp examples/config_example.tex config.tex
   ```

4. **Customize your information**
   - Edit `config.tex` with your personal information
   - Modify the content sections in `academic_cv_template.tex`

5. **Compile the PDF**
   ```bash
   make          # Using Makefile (recommended)
   # OR
   pdflatex academic_cv_template.tex
   pdflatex academic_cv_template.tex  # Run twice for proper references
   ```

6. **Validate your setup**
   ```bash
   ./validate.sh  # Check if everything is properly configured
   ```

## 📦 Installation

### Prerequisites

You need a LaTeX distribution installed on your system:

#### Windows
- Install [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)

#### macOS
- Install [MacTeX](https://www.tug.org/mactex/)
- Or using Homebrew:
  ```bash
  brew install --cask mactex
  ```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install texlive-full
```

#### Linux (Fedora/CentOS)
```bash
sudo dnf install texlive-scheme-full
```

### Required LaTeX Packages

This template uses the following packages (usually included in full LaTeX distributions):
- `geometry` - Page layout
- `titlesec` - Section formatting
- `tabularx` - Advanced tables
- `xcolor` - Colors
- `fontawesome5` - Icons
- `hyperref` - Links and metadata
- `graphicx` - Images
- `paracol` - Multi-column layouts

## 🛠 Customization

### Personal Information

Edit the `config.tex` file to customize your personal information:

```latex
\newcommand{\fullname}{John Doe}
\newcommand{\email}{john.doe@university.edu}
\newcommand{\address}{City, Country}
\newcommand{\website}{johndoe.com}
\newcommand{\birthdate}{YYYY-MM}
```

### Sections Customization

The template includes the following sections:

1. **Education** - Academic background and degrees
2. **Professional Experience** - Work experience and positions
3. **Research Projects** - Research work and publications
4. **Skills & Technologies** - Technical skills and tools
5. **Awards & Recognition** - Honors and achievements

You can:
- Reorder sections by moving the corresponding code blocks
- Add new sections using the provided environments
- Remove sections you don't need

### Styling Options

#### Colors
Modify the primary color in `config.tex`:
```latex
\definecolor{primaryColor}{RGB}{0, 79, 144}  % Academic Blue
```

#### Layout
The template uses several custom environments:
- `onecolentry` - Full-width entries
- `twocolentry` - Two-column layout (content | date)
- `threecolentry` - Three-column layout
- `highlights` - Bullet point lists

## 📁 File Structure

```
Academic-CV-template/
├── academic_cv_template.tex    # Main template file
├── config.tex                  # Personal information configuration
├── assets/                     # Images and resources
│   ├── profile_photo.jpg      # Your profile photo
│   └── university_logo.png    # University/Institution logo
├── examples/                   # Example files
│   ├── example_output.pdf     # Sample output
│   └── filled_example.tex     # Filled example
├── docs/                      # Documentation
│   └── customization_guide.md # Detailed customization guide
├── README.md                  # This file
└── LICENSE                    # License information
```

## 🔧 Compilation

### Command Line
```bash
# Basic compilation
pdflatex academic_cv_template.tex

# For proper cross-references (run twice)
pdflatex academic_cv_template.tex
pdflatex academic_cv_template.tex
```

### VS Code with LaTeX Workshop
1. Install the LaTeX Workshop extension
2. Open the `.tex` file
3. Use `Ctrl+Alt+B` (Windows/Linux) or `Cmd+Alt+B` (macOS) to build

### Overleaf
1. Create a new project on [Overleaf](https://www.overleaf.com)
2. Upload all files from this repository
3. Set the main document to `academic_cv_template.tex`
4. Compile using the built-in compiler

## 📊 Examples

See the `examples/` directory for:
- `filled_example.tex` - A complete example with sample data
- `example_output.pdf` - What the compiled CV looks like

## 🐛 Troubleshooting

### Common Issues

**1. Missing packages error**
```
Solution: Install the missing package or use a full LaTeX distribution
```

**2. Images not displaying**
```
Solution: Ensure image paths in config.tex are correct and files exist
```

**3. Compilation errors with special characters**
```
Solution: Ensure your .tex file is saved with UTF-8 encoding
```

**4. Font issues**
```
Solution: The template uses Charter font. If unavailable, LaTeX will fallback to default fonts
```

### Getting Help

- Check the [Issues](https://github.com/yourusername/Academic-CV-template/issues) page
- Create a new issue with your specific problem
- Include your LaTeX log file for compilation errors

## 📝 Customization Examples

### Adding a New Section

```latex
\section{Publications}

\begin{twocolentry}{2023}
    \textbf{Your Paper Title}
\end{twocolentry}

\begin{twocolentry}{Journal Name}
    Authors: You, Coauthor A, Coauthor B
\end{twocolentry}

\vspace{0.10 cm}
\begin{onecolentry}
    \begin{highlights}
        \item Brief description of the paper's contribution
        \item Key findings or methodology
    \end{highlights}
\end{onecolentry}
```

### Modifying Colors

```latex
% In config.tex, add or modify:
\definecolor{primaryColor}{RGB}{0, 79, 144}     % Professional blue
\definecolor{primaryColor}{RGB}{128, 0, 0}      % Academic red
\definecolor{primaryColor}{RGB}{0, 100, 0}      % Green theme
```

## 🤝 Contributing

We welcome contributions! Please read our contributing guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Areas for Contribution

- Additional section templates
- Color scheme presets
- Internationalization support
- Mobile-friendly versions
- Integration with reference managers

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by modern academic CV designs
- Built with LaTeX best practices
- Community feedback and contributions

## 📞 Support

If you find this template useful, please:
- ⭐ Star this repository
- 🐛 Report issues
- 💡 Suggest improvements
- 🤝 Contribute to the project

---

**Made with ❤️ for the academic community**