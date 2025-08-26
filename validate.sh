#!/bin/bash

# Academic CV Template Validation Script
# This script checks if your template setup is correct and ready for compilation

set -e  # Exit on any error

echo "🔍 Academic CV Template Validation"
echo "=================================="
echo

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters for summary
ERRORS=0
WARNINGS=0
SUCCESSES=0

# Function to print colored messages
print_error() {
    echo -e "${RED}❌ ERROR: $1${NC}"
    ((ERRORS++))
}

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING: $1${NC}"
    ((WARNINGS++))
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
    ((SUCCESSES++))
}

print_info() {
    echo -e "${BLUE}ℹ️  INFO: $1${NC}"
}

# Check if we're in the right directory
echo "📂 Checking project structure..."
if [ ! -f "academic_cv_template.tex" ]; then
    print_error "Main template file 'academic_cv_template.tex' not found"
    print_info "Please run this script from the project root directory"
    exit 1
fi
print_success "Main template file found"

# Check for configuration file
if [ ! -f "config.tex" ]; then
    print_warning "Configuration file 'config.tex' not found"
    if [ -f "examples/config_example.tex" ]; then
        print_info "You can create it by running: cp examples/config_example.tex config.tex"
    fi
else
    print_success "Configuration file found"
    
    # Check if config.tex contains placeholder values
    if grep -q "\[YOUR" config.tex; then
        print_warning "Configuration file contains placeholder values"
        print_info "Please edit config.tex with your personal information"
    else
        print_success "Configuration file appears to be customized"
    fi
fi

# Check for assets directory
echo
echo "🖼️  Checking assets..."
if [ ! -d "assets" ]; then
    print_error "Assets directory not found"
    print_info "Create it with: mkdir assets"
else
    print_success "Assets directory found"
    
    # Check for profile photo
    if [ -f "assets/profile_photo.jpg" ] || [ -f "assets/profile_photo.png" ]; then
        print_success "Profile photo found"
    else
        print_warning "Profile photo not found (assets/profile_photo.jpg or .png)"
        print_info "Add your professional headshot to the assets directory"
    fi
    
    # Check for university logo
    if [ -f "assets/university_logo.png" ] || [ -f "assets/university_logo.jpg" ]; then
        print_success "University logo found"
    else
        print_warning "University logo not found (assets/university_logo.png or .jpg)"
        print_info "Add your institution's logo to the assets directory"
    fi
fi

# Check for LaTeX installation
echo
echo "📝 Checking LaTeX installation..."
if command -v pdflatex >/dev/null 2>&1; then
    print_success "pdflatex found"
    LATEX_VERSION=$(pdflatex --version | head -n1)
    print_info "Version: $LATEX_VERSION"
else
    print_error "pdflatex not found"
    print_info "Please install a LaTeX distribution (TeXLive, MiKTeX, or MacTeX)"
fi

# Check for required packages (basic check)
echo
echo "📦 Checking LaTeX packages..."
TEMP_FILE=$(mktemp).tex
cat > "$TEMP_FILE" << 'EOF'
\documentclass{article}
\usepackage{geometry}
\usepackage{titlesec}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{paracol}
\usepackage{fontawesome5}
\begin{document}
Test
\end{document}
EOF

if pdflatex -interaction=nonstopmode "$TEMP_FILE" >/dev/null 2>&1; then
    print_success "All required LaTeX packages appear to be available"
    rm -f "${TEMP_FILE%.*}".* "$TEMP_FILE"
else
    print_warning "Some LaTeX packages may be missing"
    print_info "Try compiling the template to see specific missing packages"
    rm -f "${TEMP_FILE%.*}".* "$TEMP_FILE"
fi

# Check documentation
echo
echo "📖 Checking documentation..."
if [ -f "README.md" ]; then
    print_success "Main README found"
fi

if [ -f "docs/customization_guide.md" ]; then
    print_success "Customization guide found"
fi

if [ -f "examples/config_example.tex" ]; then
    print_success "Example configuration found"
fi

# Try a test compilation if config exists
echo
echo "🔨 Testing compilation..."
if [ -f "config.tex" ]; then
    # Create backup if PDF already exists
    if [ -f "academic_cv_template.pdf" ]; then
        mv academic_cv_template.pdf academic_cv_template.pdf.backup
        print_info "Existing PDF backed up as academic_cv_template.pdf.backup"
    fi
    
    if pdflatex -interaction=nonstopmode academic_cv_template.tex >/dev/null 2>&1; then
        print_success "Template compiles successfully (first pass)"
        
        # Second pass for references
        if pdflatex -interaction=nonstopmode academic_cv_template.tex >/dev/null 2>&1; then
            print_success "Template compiles successfully (second pass)"
            
            if [ -f "academic_cv_template.pdf" ]; then
                print_success "PDF generated successfully"
                PDF_SIZE=$(ls -lh academic_cv_template.pdf | awk '{print $5}')
                print_info "PDF size: $PDF_SIZE"
            fi
        fi
    else
        print_error "Template compilation failed"
        print_info "Check the .log file for detailed error information"
        print_info "You may be missing LaTeX packages or have syntax errors"
    fi
    
    # Clean up auxiliary files
    rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
else
    print_info "Skipping compilation test (no config.tex file)"
fi

# Summary
echo
echo "📊 Validation Summary"
echo "==================="
echo -e "✅ Successes: ${GREEN}$SUCCESSES${NC}"
echo -e "⚠️  Warnings: ${YELLOW}$WARNINGS${NC}"
echo -e "❌ Errors: ${RED}$ERRORS${NC}"
echo

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}🎉 All checks passed! Your template is ready to use.${NC}"
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Template is mostly ready, but please address the warnings above.${NC}"
else
    echo -e "${RED}❌ Please fix the errors above before proceeding.${NC}"
fi

echo
echo "For detailed setup instructions, see README.md"
echo "For customization help, see docs/customization_guide.md"
