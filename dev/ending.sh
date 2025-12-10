#!/bin/bash
# =============================================================================
# Development Session Ending Script
# =============================================================================
# This script wraps up a development session by:
# 1. Updating tasks.md status
# 2. Validating OpenSpec changes
# 3. Archiving completed changes (if applicable)
# 4. Writing handover documents
# 5. Pushing code to GitHub
# =============================================================================

set -e  # Exit on error

echo "========================================"
echo "🏁 Ending Development Session"
echo "========================================"
echo ""

# -----------------------------------------------------------------------------
# Step 1: Show Active Changes for Task Update
# -----------------------------------------------------------------------------
echo "📋 Step 1: Active changes (update tasks.md manually)..."
echo "----------------------------------------"
openspec list 2>/dev/null || echo "No active changes"
echo ""
echo "💡 Reminder: Update task completion status in tasks.md:"
echo "   - [x] = completed"
echo "   - [/] = in progress"
echo "   - [ ] = pending"
echo ""

# -----------------------------------------------------------------------------
# Step 2: Validate Changes
# -----------------------------------------------------------------------------
echo "✅ Step 2: Validating OpenSpec changes..."
echo "----------------------------------------"
if openspec validate --strict 2>/dev/null; then
    echo "✅ All changes validated successfully"
else
    echo "⚠️  Validation issues found (review above)"
fi
echo ""

# -----------------------------------------------------------------------------
# Step 3: Check for Archivable Changes
# -----------------------------------------------------------------------------
echo "📦 Step 3: Checking for completed changes..."
echo "----------------------------------------"
echo "If a change is fully complete and deployed, archive it with:"
echo "   openspec archive [change-id] --yes"
echo ""

# -----------------------------------------------------------------------------
# Step 4: Create/Update Handover Document
# -----------------------------------------------------------------------------
echo "📝 Step 4: Creating handover document..."
echo "----------------------------------------"

TIMESTAMP=$(date +"%Y-%m-%d %H:%M")

# Create or update HANDOVER.md
cat > HANDOVER.md << EOF
# Handover Document
*Last Updated: ${TIMESTAMP}*

## Session Summary
<!-- Describe what was done in this session -->

## Completed Work
<!-- List completed items -->
- [ ] Item 1
- [ ] Item 2

## In-Progress Work
<!-- List active changes and their status -->

## Blockers
<!-- Any issues or decisions needed -->
- None

## Next Session Plan
<!-- What should be tackled next -->
1. 
2. 
3. 

## Context Notes
<!-- Important decisions or discoveries -->

EOF

echo "Created/Updated HANDOVER.md"
echo "⚠️  Please edit HANDOVER.md to fill in the details!"
echo ""

# -----------------------------------------------------------------------------
# Step 5: Git Commit and Push
# -----------------------------------------------------------------------------
echo "📤 Step 5: Committing and pushing changes..."
echo "----------------------------------------"

# Show status
echo "Current git status:"
git status --short
echo ""

# Prompt for commit
read -p "Do you want to commit and push? (y/n): " CONFIRM
if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
    read -p "Enter commit message: " COMMIT_MSG
    
    git add .
    git commit -m "session: ${COMMIT_MSG}"
    
    if git push origin main; then
        echo "✅ Successfully pushed to GitHub"
    else
        echo "⚠️  Push failed. You may need to pull first or check remote settings."
    fi
else
    echo "Skipping commit/push. Don't forget to commit your changes later!"
fi
echo ""

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------
echo "========================================"
echo "✅ Session Ending Complete!"
echo "========================================"
echo ""
echo "Checklist:"
echo "  ☐ Updated tasks.md with completion status"
echo "  ☐ Validated all changes"
echo "  ☐ Filled in HANDOVER.md details"
echo "  ☐ Committed and pushed code"
echo ""
echo "Next session, run: ./dev/startup.sh"
echo ""
