# Customization Guide

This guide provides detailed instructions on how to customize the Academic CV Template to match your needs.

## Table of Contents
1. [Basic Setup](#basic-setup)
2. [Personal Information](#personal-information)
3. [Images and Assets](#images-and-assets)
4. [Sections Management](#sections-management)
5. [Styling Customization](#styling-customization)
6. [Advanced Features](#advanced-features)

## Basic Setup

### 1. Personal Information Configuration

Edit the `config.tex` file to set your personal information:

```latex
% PERSONAL INFORMATION
\newcommand{\fullname}{Dr. Jane Smith}
\newcommand{\email}{jane.smith@university.edu}
\newcommand{\address}{Boston, MA, USA}
\newcommand{\website}{janesmith.com}
\newcommand{\birthdate}{1990-03}
```

### 2. Update Date

```latex
\newcommand{\lastupdated}{December 2024}
```

## Images and Assets

### Profile Photo
- **Format**: JPG or PNG
- **Size**: Recommended 300x400 pixels or similar ratio
- **Location**: `assets/profile_photo.jpg`
- **Quality**: High resolution for print compatibility

### University/Institution Logo
- **Format**: PNG with transparent background (preferred) or JPG
- **Size**: Vector format or high resolution
- **Location**: `assets/university_logo.png`
- **Aspect**: Logo should be horizontally oriented

## Sections Management

### Adding a New Section

```latex
\section{New Section Title}

\begin{twocolentry}{
    [DATE RANGE]
}
    \textbf{[MAIN TITLE]}\end{twocolentry}

\begin{twocolentry}{
    [LOCATION OR SUBTITLE]
}
    [DESCRIPTION]\end{twocolentry}

\vspace{0.10 cm}
\begin{onecolentry}
    \begin{highlights}
        \item [POINT 1]
        \item [POINT 2]
        \item [POINT 3]
    \end{highlights}
\end{onecolentry}
```

### Removing a Section

Simply delete or comment out the entire section block:

```latex
% \section{Section to Remove}
% ... (section content)
```

### Reordering Sections

Cut and paste entire section blocks to reorder them.

## Styling Customization

### Color Schemes

#### Academic Blue Theme
```latex
\definecolor{primaryColor}{RGB}{0, 79, 144}
```

#### Professional Gray Theme
```latex
\definecolor{primaryColor}{RGB}{64, 64, 64}
```

#### Traditional Black Theme
```latex
\definecolor{primaryColor}{RGB}{0, 0, 0}
```

### Font Adjustments

#### Header Name Size
```latex
\fontsize{24 pt}{24 pt}\selectfont \textbf{\fullname}
```

#### Contact Information Size
```latex
\fontsize{10 pt}{12 pt}\selectfont
```

### Layout Customization

#### Column Widths
For two-column entries, you can adjust the date column width:

```latex
\setcolumnwidth{\fill, 4.5 cm}  % 4.5cm for date column
```

#### Spacing Adjustments
```latex
\vspace{0.2 cm}  % Vertical space between sections
```

## Advanced Features

### Adding Hyperlinks

```latex
\href{https://your-website.com}{your-website.com}
```

### Adding Icons (FontAwesome)

```latex
\faEnvelope \hspace{0.1cm} \email
\faGlobe \hspace{0.1cm} \website
\faMapMarker \hspace{0.1cm} \address
```

### Multiple Column Layouts

#### Three Column Entry
```latex
\begin{threecolentry}[optional_label]{middle_column_content}{right_column_content}
    Left column content
\end{threecolentry}
```

### Custom Environments

#### Highlighted Box
```latex
\begin{onecolentry}
    \colorbox{gray!20}{\parbox{\textwidth}{
        \textbf{Important Note:} This is highlighted content.
    }}
\end{onecolentry}
```

## Section-Specific Customization

### Education Section
- Always list most recent degree first
- Include GPA only if it's strong (>3.5/4.0 or equivalent)
- Mention relevant coursework for career changes
- Include thesis title for graduate degrees

### Experience Section
- Use action verbs (Led, Developed, Implemented, etc.)
- Quantify achievements when possible
- Focus on relevant experience for your target position
- List experience in reverse chronological order

### Research Projects Section
- Emphasize your specific contributions
- Mention collaborations and your role
- Include publications if any
- Highlight technical skills gained

### Skills Section
- Group similar skills together
- List most relevant skills first
- Don't include basic computer skills unless specifically relevant
- Be honest about proficiency levels

## Tips for Academic CVs

1. **Length**: Academic CVs can be longer than industry resumes
2. **Publications**: Create a separate section if you have multiple papers
3. **Teaching**: Include if you have teaching experience
4. **Conferences**: List presentations and posters
5. **Grants**: Include funding you've received
6. **Memberships**: List professional organization memberships

## Common Mistakes to Avoid

1. **Inconsistent formatting**: Use the same style throughout
2. **Too much text**: Use bullet points and concise language
3. **Outdated information**: Regularly update your CV
4. **Poor image quality**: Use high-resolution images
5. **Spelling errors**: Always proofread carefully

## Compilation Tips

1. Always compile twice for proper cross-references
2. Check for overfull/underfull hbox warnings
3. Ensure all images are accessible
4. Test PDF output on different devices
5. Keep source files organized and backed up

## Getting Help

If you encounter issues:
1. Check the main README.md file
2. Look at example files in the `examples/` directory
3. Search for similar issues in the GitHub repository
4. Create a new issue with specific details about your problem
