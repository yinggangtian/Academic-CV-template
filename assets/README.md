# Assets Directory

This directory contains the images used in your CV template.

## Required Files

### Profile Photo (`profile_photo.jpg`)
- **Purpose**: Your professional headshot for the CV
- **Recommended format**: JPG or PNG
- **Recommended size**: 300×400 pixels or similar 3:4 ratio
- **Quality**: High resolution for print compatibility
- **Style**: Professional, clear background preferred

### University/Institution Logo (`university_logo.png`)
- **Purpose**: Logo of your current institution or university
- **Recommended format**: PNG with transparent background
- **Recommended size**: Vector format or high resolution (300 DPI)
- **Aspect ratio**: Horizontal orientation preferred
- **Quality**: Should be clear when scaled to template size

## Getting Images

### Profile Photo
- Use a professional photographer
- Ensure good lighting and clear background
- Dress professionally
- Face should be clearly visible
- Image should be recent and represent you well

### University Logo
- Download from your institution's official website
- Check their brand guidelines for proper usage
- Ensure you have permission to use the logo
- Look for media/press resources sections
- Contact your institution's communications department if needed

## File Naming

The template expects these specific filenames:
- `profile_photo.jpg` (or `.png`)
- `university_logo.png` (or `.jpg`)

If you use different filenames, update them in your `config.tex` file:

```latex
\newcommand{\photopath}{assets/your_photo_name.jpg}
\newcommand{\universitylogo}{assets/your_logo_name.png}
```

## Image Quality Tips

1. **Resolution**: Use high-resolution images (300 DPI) for print quality
2. **Compression**: Balance file size with quality
3. **Format**: PNG for logos (transparency), JPG for photos
4. **Testing**: Compile your CV to check how images appear
5. **Backup**: Keep original high-resolution versions

## Privacy Note

These image files are included in version control by default. If you want to keep them private:

1. Uncomment the relevant lines in `.gitignore`
2. Use placeholder images in the repository
3. Keep your personal images in a separate, private location
