#!/bin/bash
# Quick verification script for Medium-imported posts

echo "🔍 Medium Posts Verification Summary"
echo "====================================="

# Count total Medium-imported posts
total_posts=$(grep -r "medium-import" content/post/ 2>/dev/null | wc -l)
echo "📝 Total Medium-imported posts: $total_posts"

# Count posts with proper structure (should be all of them)
posts_with_frontmatter=$(find content/post -name "*.md" -exec grep -l "^+++" {} \; | wc -l)
echo "✅ Posts with proper front matter: $posts_with_frontmatter"

# Count image directories
image_dirs=$(find static/img -type d | wc -l)
echo "📁 Image directories present: $image_dirs"

# Check if verification report exists
if [ -f "MEDIUM_VERIFICATION_REPORT.md" ]; then
    echo "📊 Detailed verification report: MEDIUM_VERIFICATION_REPORT.md"
    
    # Extract key metrics from report
    broken_images=$(grep -o "Found [0-9]* broken images" MEDIUM_VERIFICATION_REPORT.md | grep -o "[0-9]*")
    if [ ! -z "$broken_images" ]; then
        echo "❌ Broken images found: $broken_images"
    fi
    
    success_rate=$(grep -o "Image accessibility rate.*%" MEDIUM_VERIFICATION_REPORT.md | grep -o "[0-9]*\.[0-9]*")
    if [ ! -z "$success_rate" ]; then
        echo "📈 Image accessibility rate: $success_rate%"
    fi
else
    echo "⚠️  No verification report found"
fi

echo ""
echo "🚀 To run full verification:"
echo "python3 /tmp/verify_medium_posts.py"
echo ""
echo "📖 For detailed findings:"
echo "cat MEDIUM_VERIFICATION_REPORT.md"