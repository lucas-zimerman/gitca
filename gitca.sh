#!/bin/bash

# gitca - Git Co-Author script for AI assistants

set -e

usage() {
    echo "Usage: gitca <ai-tool>"
    echo ""
    echo "Amends the current git commit with an AI co-author attribution."
    echo ""
    echo "Available options:"
    echo "  chatgpt"
    echo "  claude"
    echo "  cursor"
    exit 1
}

if [ -z "$1" ]; then
    echo "Error: No AI tool specified."
    echo ""
    usage
fi

case "$1" in
    chatgpt)
        CO_AUTHOR="ChatGPT <noreply@chatgpt.com>"
        ;;
    claude)
        CO_AUTHOR="Claude <noreply@anthropic.com>"
        ;;
    cursor)
        CO_AUTHOR="Cursor <cursoragent@cursor.com>"
        ;;
    *)
        echo "Error: Invalid option '$1'."
        echo ""
        usage
        ;;
esac

# Get the current commit message
CURRENT_MSG=$(git log -1 --pretty=%B)

# Amend the commit with the co-author
git commit --amend -m "$CURRENT_MSG

Co-authored-by: $CO_AUTHOR"

echo "Commit amended with co-author: $CO_AUTHOR"
