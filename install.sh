#!/bin/bash

# QuickPush Installation Script
# Installs the quickpush command globally on your system

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installing QuickPush Tool...${NC}"

# Create local bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Copy the script
cp quickpush ~/.local/bin/quickpush

# Make it executable
chmod +x ~/.local/bin/quickpush

# Add to PATH if not already there
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
    echo -e "${BLUE}📝 Adding ~/.local/bin to your PATH...${NC}"
    
    # Detect shell and add to appropriate config file
    if [ -f ~/.zshrc ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
        echo -e "${GREEN}✅ Added to ~/.zshrc${NC}"
    elif [ -f ~/.bashrc ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        echo -e "${GREEN}✅ Added to ~/.bashrc${NC}"
    elif [ -f ~/.bash_profile ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bash_profile
        echo -e "${GREEN}✅ Added to ~/.bash_profile${NC}"
    fi
fi

# Add convenient alias
if [ -f ~/.zshrc ] && ! grep -q "alias qp=" ~/.zshrc; then
    echo 'alias qp="quickpush"' >> ~/.zshrc
    echo -e "${GREEN}✅ Added 'qp' alias to ~/.zshrc${NC}"
elif [ -f ~/.bashrc ] && ! grep -q "alias qp=" ~/.bashrc; then
    echo 'alias qp="quickpush"' >> ~/.bashrc
    echo -e "${GREEN}✅ Added 'qp' alias to ~/.bashrc${NC}"
fi

echo ""
echo -e "${GREEN}🎉 QuickPush installed successfully!${NC}"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo "  quickpush    # Full command"
echo "  qp           # Short alias"
echo ""
echo -e "${BLUE}To start using immediately, run:${NC}"
if [ -f ~/.zshrc ]; then
    echo "  source ~/.zshrc"
elif [ -f ~/.bashrc ]; then
    echo "  source ~/.bashrc"
fi
echo ""
echo -e "${BLUE}Or simply open a new terminal window.${NC}"